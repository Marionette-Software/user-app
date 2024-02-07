// ignore_for_file: use_build_context_synchronously

import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/get_markets_future_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/trade_avalible_balance_state_provider.dart';
import 'package:user_app/application/wallets/wallet_market_dynamics_state_notifier_provider.dart';
import 'package:user_app/domain/trade/market_trade.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_dynamics_query.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_dynamics_query.var.gql.dart';
import 'package:user_app/infrastructure/trade/trade_service.dart';
import 'package:user_app/presentation/app/trade/mobile/components/market_page/selected_market.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MarketItemMobile extends StatefulHookConsumerWidget {
  const MarketItemMobile({
    super.key,
    required this.item,
    this.isFavorite = false,
  });

  final bool isFavorite;
  final MarketTrade item;

  @override
  ConsumerState<MarketItemMobile> createState() => _MarketItemMobileState();
}

class _MarketItemMobileState extends ConsumerState<MarketItemMobile> {
  bool hoveredFavorite = false;

  @override
  Widget build(BuildContext context) {
    ITradeService service = TradeService();

    dynamic changeFor24h;
    dynamic change24Percent;

    if (widget.item.marketDynamics != null) {
      if (widget.item.marketDynamics!.lastPrice != null &&
          widget.item.marketDynamics!.startPrice != null) {
        changeFor24h = widget.item.marketDynamics!.lastPrice! -
            widget.item.marketDynamics!.startPrice!;
      } else {
        changeFor24h = null;
      }

      if (changeFor24h != null) {
        if (widget.item.marketDynamics!.startPrice != null) {
          change24Percent = ((100 * changeFor24h) /
                      widget.item.marketDynamics!.startPrice!)
                  .isNegative
              ? (((100 * changeFor24h) /
                          widget.item.marketDynamics!.startPrice!) *
                      -1)
                  .toStringAsFixed(2)
              : ((100 * changeFor24h) / widget.item.marketDynamics!.startPrice!)
                  .toStringAsFixed(2);
        } else {
          change24Percent = null;
        }
      } else {
        change24Percent = 'N/A';
      }
    } else {
      changeFor24h = null;
      change24Percent = 'N/A';
    }

    return InkWell(
      onTap: () async {
        ref.read(tradeMarketPriceProvider.notifier).updateBuy('none');
        ref.read(tradeMarketPriceProvider.notifier).updateSell('none');
        showDialog(
          context: context,
          builder: (ctx) {
            return Container(
              color: isLightTheme(context)
                  ? AppColors.whiteColor
                  : AppColors.mainBackgroundDarkColor,
              alignment: Alignment.center,
              child: const MainLoaderMobile(),
            );
          },
        );
        ref
            .read(selectMarketsNotifierProvider.notifier)
            .selectMarketData(widget.item);
        var response = await service.getMarketDynamics(widget.item.id);
        if (response is OperationResponse<GGetMarketDynamicsData,
            GGetMarketDynamicsVars>) {
          ref
              .watch(walletMarketDynamicsStateNotifierProvider.notifier)
              .updateWalletMarketDynamicsData(
                response.data!.marketDynamics!,
              );
        } else {
          ref
              .watch(walletMarketDynamicsStateNotifierProvider.notifier)
              .updateWalletMarketDynamicsData(
                GGetMarketDynamicsData_marketDynamics(),
              );
        }
        context.pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectedMarketMobile(
              item: widget.item,
            ),
          ),
        );
      },
      child: SizedBox(
        height: 70..h,
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        hoveredFavorite = !hoveredFavorite;
                      });
                    },
                    onTap: () async {
                      ITradeService service = TradeService();
                      await service.setFavoriteMarket(widget.item.id);

                      ref
                          .read(getMarketsNotifierProvider.notifier)
                          .setFavoriteMarket(
                              widget.item.id, !widget.item.isFavorite);
                    },
                    child: SvgPicture.asset(
                      widget.item.isFavorite
                          ? starFavoriteWallet
                          : unselectedStarFavoriteWallet,
                      width: 16.w,
                      height: 16..h,
                      colorFilter: ColorFilter.mode(
                        hoveredFavorite
                            ? isLightTheme(context)
                                ? AppColors.aboutHeaderLight.withOpacity(0.5)
                                : AppColors.whiteColor.withOpacity(0.5)
                            : isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : widget.item.isFavorite
                                    ? AppColors.whiteColor
                                    : AppColors.whiteColor.withOpacity(0.25),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    '${widget.item.id.split('-')[0].toUpperCase()}/${widget.item.id.split('-')[1].toUpperCase()}',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 15.sp,
                          letterSpacing: -0.75.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.item.marketDynamics == null
                        ? 'N/A'
                        : widget.item.marketDynamics!.lastPrice == null
                            ? '-'
                            : widget.item.marketDynamics!.lastPrice!
                                .toStringAsFixed(
                                    widget.item.trading_price_precision),
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 15.sp,
                          letterSpacing: -0.75.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    '${changeFor24h != null ? changeFor24h.isNegative ? '-' : '+' : ''}$change24Percent%',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 13.sp,
                          letterSpacing: -0.65.sp,
                          color: changeFor24h != null
                              ? changeFor24h.isNegative
                                  ? Theme.of(context).colorScheme.error
                                  : MainColorsApp.greenColor
                              : AppColors.whiteColor,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/create_order_with_order_book_provider.dart';
import 'package:user_app/application/trade/get_markets_future_provider.dart';
import 'package:user_app/application/trade/market_dynamic_state_notifier_provider.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/application/trade/market_percet_provider.dart';
import 'package:user_app/application/trade/open_market_list_provider.dart';
import 'package:user_app/application/trade/orderbook/orderbook_state_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/trade_avalible_balance_state_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/trade/market_dynamic/market_dynamic.dart';
import 'package:user_app/domain/trade/market_trade.dart';
import 'package:user_app/domain/trade/order_type.dart';
import 'package:user_app/domain/trade/orderbook/orderbook_state.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/trade/trade_service.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MarketItem extends StatefulHookConsumerWidget {
  const MarketItem({
    super.key,
    required this.item,
  });

  final MarketTrade item;

  @override
  ConsumerState<MarketItem> createState() => _MarketItemState();
}

class _MarketItemState extends ConsumerState<MarketItem> {
  bool hoveredFavorite = false;

  @override
  Widget build(BuildContext context) {
    final tradeMarketPriceRead = ref.read(tradeMarketPriceProvider.notifier);
    final marketOrLimitProviderState = ref.read(marketOrLimitProvider.notifier);
    final marketPercentState = ref.read(marketPercentProviderProvider.notifier);
    final selectMarketsWatch = ref.watch(selectMarketsNotifierProvider);
    final openMarketListRead = ref.read(openMarketListProvider.notifier);
    final priceWithOrderBookRead =
        ref.read(priceWithOrderBookProvider.notifier);
    final amountWithOrderBookRead =
        ref.read(amountWithOrderBookProvider.notifier);

    double? changeFor24h;
    String? change24Percent;

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
      onTap: selectMarketsWatch.id != widget.item.id
          ? () async {
              priceWithOrderBookRead.state = 0;
              amountWithOrderBookRead.state = 0;
              tradeMarketPriceRead.updateBuy('none');
              tradeMarketPriceRead.updateSell('none');
              ref
                  .read(selectMarketsNotifierProvider.notifier)
                  .selectMarketData(widget.item);

              marketPercentState.state = 0;

              ref.read(marketDynamicStateNotifierProvider.notifier).updateData(
                    MarketDynamic.initialData(),
                  );

              ref.read(orderBookStateNotifierProvider.notifier).updateOrderBook(
                    const OrderBookState(
                      buy: [],
                      sell: [],
                    ),
                  );
              ref
                  .read(changeMarketProvider.notifier)
                  .updateChangeMarketData(true);

              marketOrLimitProviderState.state = OrderType.limit;
              var userBox = Hive.box<UserConfigData>(Constants.userConfig);
              UserConfigData userData = userBox.getAt(0)!;
              UserConfigData dataUsr = UserConfigData(
                selectedMarketId: widget.item.id,
                token: userData.token,
                userId: userData.userId,
                userName: userData.userName,
              );
              userBox.putAt(0, dataUsr);
              openMarketListRead.state = false;
            }
          : null,
      child: Container(
        height: 26.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              width: 8.w,
              color: selectMarketsWatch.id == widget.item.id
                  ? MainColorsApp.accentColor
                  : Colors.transparent,
            ),
          ),
          color: selectMarketsWatch.id == widget.item.id
              ? AppColors.whiteColor.withOpacity(0.25)
              : Colors.transparent,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 7.w,
            right: 15.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 145.w,
                child: Row(
                  children: [
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          hoveredFavorite = !hoveredFavorite;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                      onTap: () async {
                        ITradeService service = TradeService();
                        await service.setFavoriteMarket(widget.item.id);

                        ref
                            .read(getMarketsNotifierProvider.notifier)
                            .setFavoriteMarket(
                                widget.item.id, !widget.item.isFavorite);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SvgPicture.asset(
                          widget.item.isFavorite
                              ? starFavoriteWallet
                              : unselectedStarFavoriteWallet,
                          width: 15.w,
                          height: 15.h,
                          colorFilter: ColorFilter.mode(
                            hoveredFavorite
                                ? isLightTheme(context)
                                    ? AppColors.aboutHeaderLight
                                        .withOpacity(0.5)
                                    : AppColors.whiteColor.withOpacity(0.5)
                                : isLightTheme(context)
                                    ? AppColors.aboutHeaderLight
                                    : widget.item.isFavorite
                                        ? AppColors.whiteColor
                                        : AppColors.whiteColor
                                            .withOpacity(0.25),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      widget.item.id.split('-')[0].toUpperCase(),
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.75.sp,
                          ),
                    ),
                    Text(
                      '/${widget.item.id.split('-')[1].toUpperCase()}',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.75.sp,
                            color: isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : AppColors.whiteColor.withOpacity(0.5),
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 103.w,
                child: Text(
                  widget.item.marketDynamics == null
                      ? 'N/A'
                      : widget.item.marketDynamics!.lastPrice == null
                          ? '-'
                          : widget.item.marketDynamics!.lastPrice!
                              .toStringAsFixed(
                                  widget.item.trading_price_precision),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
              SizedBox(
                width: 70.w,
                child: Text(
                  '${changeFor24h != null ? changeFor24h.isNegative ? '-' : '+' : ''}$change24Percent%',
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 15.sp,
                        color: changeFor24h != null
                            ? changeFor24h.isNegative
                                ? MainColorsApp.redColor
                                : MainColorsApp.greenColor
                            : AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

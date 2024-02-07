import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/trade_avalible_balance_state_provider.dart';
import 'package:user_app/application/trade/tranding_tab_provider.dart';
import 'package:user_app/application/wallets/timestamp_state_provider.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_balance_update_subscription.data.gql.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class AvailableBalanceRow extends HookConsumerWidget {
  const AvailableBalanceRow({
    super.key,
    required this.currencyId,
    required this.platformType,
    required this.loaderState,
    this.userBalanceUpdated,
    required this.withTradingBalance,
    required,
  });

  final String currencyId;
  final ValueNotifier<LoadState> loaderState;
  final PlatformTypeState platformType;
  final bool withTradingBalance;
  final GGetUserBalanceUpdatedData_userBalanceUpdated? userBalanceUpdated;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tradingTabWatch = ref.watch(tradingTabProvider);
    final tradeMarketPriceWatch = ref.watch(tradeMarketPriceProvider);

    final timestampQuatBalanceWatch =
        ref.watch(timestampQuatBalanceStateProvider);
    final timestampQuatBalanceRead =
        ref.read(timestampQuatBalanceStateProvider.notifier);

    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);
    final tradeMarketPriceRead = ref.read(tradeMarketPriceProvider.notifier);

    final timestampBaseBalanceWatch =
        ref.watch(timestampBaseBalanceStateProvider);
    final timestampBaseBalanceRead =
        ref.read(timestampBaseBalanceStateProvider.notifier);

    updateBalance() {
      if (userBalanceUpdated!.currencyId == marketDataWatch.quote_currency.id) {
        if (int.parse(userBalanceUpdated!.ts!) >= timestampQuatBalanceWatch) {
          Future.delayed(
            Duration.zero,
            () {
              timestampQuatBalanceRead.state =
                  int.parse(userBalanceUpdated!.ts!);

              tradeMarketPriceRead.updateBuy(
                (withTradingBalance
                        ? userBalanceUpdated!.advancedTradingBalance!
                        : (userBalanceUpdated!.advancedTradingBalance! +
                            userBalanceUpdated!.balance!))
                    .toStringAsFixed(marketDataWatch.quote_currency.precision),
              );
            },
          );
        }
      }
      if (userBalanceUpdated!.currencyId == marketDataWatch.base_currency.id) {
        if (int.parse(userBalanceUpdated!.ts!) >= timestampBaseBalanceWatch) {
          Future.delayed(
            Duration.zero,
            () {
              timestampBaseBalanceRead.state =
                  int.parse(userBalanceUpdated!.ts!);

              tradeMarketPriceRead.updateSell(
                (withTradingBalance
                        ? userBalanceUpdated!.advancedTradingBalance!
                        : (userBalanceUpdated!.advancedTradingBalance! +
                            userBalanceUpdated!.balance!))
                    .toStringAsFixed(marketDataWatch.base_currency.precision),
              );
            },
          );
        }
      }
    }

    return SizedBox(
      width: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 347,
        tabletValue: 330,
        mobileValue: MediaQuery.of(context).size.width,
      ).w,
      child: FutureBuilder(
        future: userBalanceUpdated == null ? null : updateBalance(),
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tr('trade.available'),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: getSizeFromPlatformType(
                          platformType: platformType,
                          webValue: 15,
                          tabletValue: 13,
                          mobileValue: 15,
                        ).sp,
                        color: isLightTheme(context)
                            ? AppColors.aboutHeaderLight
                            : AppColors.whiteColor.withOpacity(0.5),
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  loaderState.value == LoadState.notLoading
                      ? Text(
                          '${tradingTabWatch == 1 ? numberFormatWithPrecision(marketDataWatch.quote_currency.precision).format(tradeMarketPriceWatch.buy == 'none' ? 0 : double.parse(tradeMarketPriceWatch.buy!)) : numberFormatWithPrecision(marketDataWatch.base_currency.precision).format(tradeMarketPriceWatch.buy == 'none' ? 0 : double.parse(tradeMarketPriceWatch.sell!))} ${currencyId.toUpperCase()}',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: getSizeFromPlatformType(
                                      platformType: platformType,
                                      webValue: 15,
                                      tabletValue: 13,
                                      mobileValue: 15,
                                    ).sp,
                                    color: isLightTheme(context)
                                        ? AppColors.aboutHeaderLight
                                        : AppColors.whiteColor.withOpacity(0.5),
                                    fontWeight: FontWeight.w500,
                                  ),
                        )
                      : Text(
                          tr('Processing...'),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  fontSize: getSizeFromPlatformType(
                                    platformType: platformType,
                                    webValue: 15,
                                    tabletValue: 13,
                                    mobileValue: 15,
                                  ).sp,
                                  color: isLightTheme(context)
                                      ? AppColors.aboutHeaderLight
                                      : AppColors.whiteColor.withOpacity(0.5),
                                  fontWeight: FontWeight.w500),
                        ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

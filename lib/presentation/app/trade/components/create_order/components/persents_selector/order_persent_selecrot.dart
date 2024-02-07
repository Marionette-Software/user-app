import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/error_mesegge_provider.dart';
import 'package:user_app/application/trade/is_active_buy_sell_provider.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/application/trade/market_percet_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/trade_avalible_balance_state_provider.dart';
import 'package:user_app/application/trade/tranding_tab_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/trade/order_type.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/persents_selector/components/order_selector_item.dart';

class OrderPercentSelector extends HookConsumerWidget {
  const OrderPercentSelector({
    super.key,
    required this.amountController,
    required this.priceController,
    required this.totalController,
    required this.active,
    required this.platformType,
  });

  final TextEditingController amountController;
  final TextEditingController priceController;
  final TextEditingController totalController;
  final ValueNotifier<bool> active;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketPercentState = ref.read(marketPercentProviderProvider.notifier);
    final marketPercentWatch = ref.watch(marketPercentProviderProvider);

    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);
    final marketOrLimitProviderWatch = ref.watch(marketOrLimitProvider);

    final tradingTabWatch = ref.watch(tradingTabProvider);

    var isActiveBuySellProviderState =
        ref.read(isActiveBuySellProvider.notifier);
    final tradeMarketPriceWatch = ref.watch(tradeMarketPriceProvider);

    final errorMinAmountRead = ref.read(errorMinAmountProvider.notifier);

    double availableBalance = tradingTabWatch == 1
        ? double.parse(tradeMarketPriceWatch.buy!)
        : double.parse(tradeMarketPriceWatch.sell!);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Tooltip(
            message: 'Use 25% of available balance'.hardcoded,
            verticalOffset: -60.h,
            child: OrderSelectorItem(
              platformType: platformType,
              title: '25%',
              onTap: () async {
                isActiveBuySellProviderState.state = true;
                marketPercentState.state = 1;
                active.value = !active.value;
                priceController.text =
                    marketOrLimitProviderWatch == OrderType.limit
                        ? priceController.text
                        : marketDataWatch.marketDynamics!.lastPrice.toString();

                if (tradingTabWatch == 1) {
                  amountController.text = (availableBalance /
                          double.parse(priceController.text) *
                          0.25)
                      .toStringAsFixed(
                          marketDataWatch.trading_amount_precision);

                  double.parse(amountController.text) <
                          marketDataWatch.trading_min_amount
                      ? errorMinAmountRead.state = true
                      : errorMinAmountRead.state = false;

                  if (marketOrLimitProviderWatch == OrderType.limit) {
                    totalController.text = (availableBalance * 0.25)
                        .toStringAsFixed(
                            marketDataWatch.quote_currency.precision);
                  } else {
                    totalController.text =
                        '≈ ${(availableBalance * 0.25).toStringAsFixed(marketDataWatch.quote_currency.precision)}';
                  }
                } else {
                  if (marketOrLimitProviderWatch == OrderType.limit) {
                    totalController.text = (availableBalance *
                            double.parse(priceController.text) *
                            0.25)
                        .toStringAsFixed(
                            marketDataWatch.quote_currency.precision);
                  } else {
                    totalController.text =
                        '≈ ${(availableBalance * double.parse(priceController.text) * 0.25).toStringAsFixed(marketDataWatch.quote_currency.precision)}';
                  }

                  amountController.text = (availableBalance * 0.25)
                      .toStringAsFixed(
                          marketDataWatch.trading_amount_precision);

                  double.parse(amountController.text) <
                          marketDataWatch.trading_min_amount
                      ? errorMinAmountRead.state = true
                      : errorMinAmountRead.state = false;
                }
              },
              active: marketPercentWatch == 1,
            ),
          ),
          const Spacer(),
          Tooltip(
            message: 'Use 50% of available balance'.hardcoded,
            verticalOffset: -60.h,
            child: OrderSelectorItem(
              platformType: platformType,
              title: '50%',
              onTap: () {
                isActiveBuySellProviderState.state = true;
                marketPercentState.state = 2;
                active.value = !active.value;
                priceController.text =
                    marketOrLimitProviderWatch == OrderType.limit
                        ? priceController.text
                        : marketDataWatch.marketDynamics!.lastPrice.toString();

                if (tradingTabWatch == 1) {
                  amountController.text = (availableBalance /
                          double.parse(priceController.text) *
                          0.5)
                      .toStringAsFixed(
                          marketDataWatch.trading_amount_precision);

                  double.parse(amountController.text) <
                          marketDataWatch.trading_min_amount
                      ? errorMinAmountRead.state = true
                      : errorMinAmountRead.state = false;

                  if (marketOrLimitProviderWatch == OrderType.limit) {
                    totalController.text = (availableBalance * 0.5)
                        .toStringAsFixed(
                            marketDataWatch.quote_currency.precision);
                  } else {
                    totalController.text =
                        '≈ ${(availableBalance * 0.5).toStringAsFixed(marketDataWatch.quote_currency.precision)}';
                  }
                } else {
                  if (marketOrLimitProviderWatch == OrderType.limit) {
                    totalController.text = (availableBalance *
                            double.parse(priceController.text) *
                            0.5)
                        .toStringAsFixed(
                            marketDataWatch.quote_currency.precision);
                  } else {
                    totalController.text =
                        '≈ ${(availableBalance * double.parse(priceController.text) * 0.5).toStringAsFixed(marketDataWatch.quote_currency.precision)}';
                  }

                  amountController.text = (availableBalance * 0.5)
                      .toStringAsFixed(
                          marketDataWatch.trading_amount_precision);

                  double.parse(amountController.text) <
                          marketDataWatch.trading_min_amount
                      ? errorMinAmountRead.state = true
                      : errorMinAmountRead.state = false;
                }
              },
              active: marketPercentWatch == 2,
            ),
          ),
          const Spacer(),
          Tooltip(
            message: 'Use 75% of available balance'.hardcoded,
            verticalOffset: -60.h,
            child: OrderSelectorItem(
              platformType: platformType,
              title: '75%',
              onTap: () {
                isActiveBuySellProviderState.state = true;
                marketPercentState.state = 3;
                active.value = !active.value;
                priceController.text =
                    marketOrLimitProviderWatch == OrderType.limit
                        ? priceController.text
                        : marketDataWatch.marketDynamics!.lastPrice.toString();

                if (tradingTabWatch == 1) {
                  amountController.text = (availableBalance /
                          double.parse(priceController.text) *
                          0.75)
                      .toStringAsFixed(
                          marketDataWatch.trading_amount_precision);

                  double.parse(amountController.text) <
                          marketDataWatch.trading_min_amount
                      ? errorMinAmountRead.state = true
                      : errorMinAmountRead.state = false;

                  if (marketOrLimitProviderWatch == OrderType.limit) {
                    totalController.text = (availableBalance * 0.75)
                        .toStringAsFixed(
                            marketDataWatch.quote_currency.precision);
                  } else {
                    totalController.text =
                        '≈ ${(availableBalance * 0.75).toStringAsFixed(marketDataWatch.quote_currency.precision)}';
                  }
                } else {
                  if (marketOrLimitProviderWatch == OrderType.limit) {
                    totalController.text = (availableBalance *
                            double.parse(priceController.text) *
                            0.75)
                        .toStringAsFixed(
                            marketDataWatch.quote_currency.precision);
                  } else {
                    totalController.text =
                        '≈ ${(availableBalance * double.parse(priceController.text) * 0.75).toStringAsFixed(marketDataWatch.quote_currency.precision)}';
                  }

                  amountController.text = (availableBalance * 0.75)
                      .toStringAsFixed(
                          marketDataWatch.trading_amount_precision);

                  double.parse(amountController.text) <
                          marketDataWatch.trading_min_amount
                      ? errorMinAmountRead.state = true
                      : errorMinAmountRead.state = false;
                }
              },
              active: marketPercentWatch == 3,
            ),
          ),
          const Spacer(),
          Tooltip(
            message: 'Use all available balance'.hardcoded,
            verticalOffset: -60.h,
            child: OrderSelectorItem(
              platformType: platformType,
              title: '100%',
              onTap: () {
                isActiveBuySellProviderState.state = true;
                marketPercentState.state = 4;
                active.value = !active.value;
                priceController.text =
                    marketOrLimitProviderWatch == OrderType.limit
                        ? priceController.text
                        : marketDataWatch.marketDynamics!.lastPrice.toString();

                if (tradingTabWatch == 1) {
                  amountController.text = (availableBalance /
                          double.parse(priceController.text) *
                          1)
                      .toStringAsFixed(
                          marketDataWatch.trading_amount_precision);

                  double.parse(amountController.text) <
                          marketDataWatch.trading_min_amount
                      ? errorMinAmountRead.state = true
                      : errorMinAmountRead.state = false;

                  if (marketOrLimitProviderWatch == OrderType.limit) {
                    totalController.text = (availableBalance * 1)
                        .toStringAsFixed(
                            marketDataWatch.quote_currency.precision);
                  } else {
                    totalController.text =
                        '≈ ${(availableBalance * 1).toStringAsFixed(marketDataWatch.quote_currency.precision)}';
                  }
                } else {
                  if (marketOrLimitProviderWatch == OrderType.limit) {
                    totalController.text = (availableBalance *
                            double.parse(priceController.text) *
                            1)
                        .toStringAsFixed(
                            marketDataWatch.quote_currency.precision);
                  } else {
                    totalController.text =
                        '≈ ${(availableBalance * double.parse(priceController.text) * 1).toStringAsFixed(marketDataWatch.quote_currency.precision)}';
                  }

                  amountController.text = (availableBalance * 1)
                      .toStringAsFixed(
                          marketDataWatch.trading_amount_precision);
                  double.parse(amountController.text) <
                          marketDataWatch.trading_min_amount
                      ? errorMinAmountRead.state = true
                      : errorMinAmountRead.state = false;
                }
              },
              active: marketPercentWatch == 4,
            ),
          ),
        ],
      ),
    );
  }
}

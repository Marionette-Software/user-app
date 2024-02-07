import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/error_mesegge_provider.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/trade_avalible_balance_state_provider.dart';
import 'package:user_app/application/trade/tranding_tab_provider.dart';
import 'package:user_app/domain/trade/order_type.dart';

validateButton({
  required WidgetRef ref,
  required TextEditingController totalController,
  required TextEditingController amountController,
}) {
  final tradingTabState = ref.read(tradingTabProvider.notifier);
  final marketOrLimitProviderWatch = ref.watch(marketOrLimitProvider);
  final marketDataWatch = ref.watch(selectMarketsNotifierProvider);

  final tradeMarketPriceWatch = ref.watch(tradeMarketPriceProvider);
  final quoteCurrencyBalanceBuy = tradeMarketPriceWatch.buy!;
  final baseCurrencyBalanceSell = tradeMarketPriceWatch.sell!;

  final errorMinOrMaxPriceWatch = ref.watch(errorMinOrMaxPriceProvider);

  final errorMinAmountWatch = ref.watch(errorMinAmountProvider);

  double total = 0;

  total = marketOrLimitProviderWatch == OrderType.market
      ? totalController.text ==
              0.toStringAsFixed(marketDataWatch.quote_currency.precision)
          ? 0
          : double.parse(totalController.text.replaceAll('≈ ', ''))
      : totalController.text ==
              0.toStringAsFixed(marketDataWatch.quote_currency.precision)
          ? 0
          : double.parse(totalController.text.replaceAll('≈ ', ''));

  double amount =
      amountController.text.isEmpty ? 0 : double.parse(amountController.text);

  if (tradingTabState.state == 1) {
    if (total > double.parse(quoteCurrencyBalanceBuy)) {
      return false;
    } else if (total == 0) {
      return false;
    } else if (amount < marketDataWatch.trading_min_amount) {
      return false;
    } else if (errorMinAmountWatch) {
      return false;
    } else if (errorMinOrMaxPriceWatch) {
      return false;
    } else if (amountController.text == 'Infinity') {
      return false;
    } else {
      return true;
    }
  } else {
    if (amount > double.parse(baseCurrencyBalanceSell)) {
      return false;
    } else if (total == 0) {
      return false;
    } else if (amountController.text == 'Infinity') {
      return false;
    } else if (amount < marketDataWatch.trading_min_amount) {
      return false;
    } else if (errorMinOrMaxPriceWatch) {
      return false;
    } else {
      return true;
    }
  }
}

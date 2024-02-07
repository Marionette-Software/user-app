import 'package:equatable/equatable.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/domain/exchange/exchange_rate.dart';
import 'package:user_app/domain/exchange/precision_currency_state.dart';
import 'package:user_app/domain/wallet/market.dart';

class ExchangeState extends Equatable {
  const ExchangeState({
    required this.currencyFromList,
    required this.currencyToList,
    required this.selectedToCurrency,
    required this.selectedFromCurrency,
    required this.rate,
    required this.valueTo,
    required this.valueFrom,
    required this.activeMarket,
    this.toCurrencyPrecision,
    this.fromCurrencyPrecision,
  });

  final List<Currency> currencyFromList;
  final List<Currency> currencyToList;
  final Currency selectedToCurrency;
  final Currency selectedFromCurrency;
  final ExchangeRate rate;
  final String valueTo;
  final String valueFrom;
  final Market activeMarket;
  final PrecisionCurrencyState? toCurrencyPrecision;
  final PrecisionCurrencyState? fromCurrencyPrecision;

  @override
  List<Object> get props => [
        currencyFromList,
        currencyToList,
        selectedToCurrency,
        selectedFromCurrency,
        rate,
        valueTo,
        valueFrom,
        activeMarket,
        toCurrencyPrecision!,
        fromCurrencyPrecision!,
      ];
}

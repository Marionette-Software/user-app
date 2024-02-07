import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/domain/exchange/exchange_rate.dart';
import 'package:user_app/domain/exchange/exchange_state.dart';
import 'package:user_app/domain/exchange/precision_currency_state.dart';
import 'package:user_app/domain/wallet/market.dart';

final exchangeStateNotifierProvider =
    StateNotifierProvider<ExchangeStateNotifier, ExchangeState>(
  (ref) => ExchangeStateNotifier(),
);

class ExchangeStateNotifier extends StateNotifier<ExchangeState> {
  ExchangeStateNotifier()
      : super(
          ExchangeState(
            currencyFromList: const [],
            currencyToList: const [],
            selectedToCurrency: Currency.initialData(),
            selectedFromCurrency: Currency.initialData(),
            rate: ExchangeRate(
              currencyTo: Currency.initialData(),
              currencyFrom: Currency.initialData(),
              rateWithPrecision: '0.0',
              rate: 0.0,
            ),
            valueTo: '',
            valueFrom: '',
            toCurrencyPrecision: const PrecisionCurrencyState(
              swapBaseToQuotePricePrecision: 0,
              swapQuoteToBasePricePrecision: 0,
            ),
            fromCurrencyPrecision: const PrecisionCurrencyState(
              swapBaseToQuotePricePrecision: 0,
              swapQuoteToBasePricePrecision: 0,
            ),
            activeMarket: Market.initialData(),
          ),
        );

  void updateSelectedToCurrency(
    Currency data,
  ) {
    state = ExchangeState(
      currencyFromList: state.currencyFromList,
      currencyToList: state.currencyToList,
      selectedToCurrency: data,
      selectedFromCurrency: state.selectedFromCurrency,
      rate: state.rate,
      valueTo: state.valueTo,
      valueFrom: state.valueFrom,
      activeMarket: state.activeMarket,
      fromCurrencyPrecision: state.fromCurrencyPrecision,
      toCurrencyPrecision: state.toCurrencyPrecision,
    );
  }

  void updateSelectedFromCurrency(
    Currency data,
  ) {
    state = ExchangeState(
      currencyFromList: state.currencyFromList,
      currencyToList: state.currencyToList,
      selectedFromCurrency: data,
      selectedToCurrency: state.selectedToCurrency,
      rate: state.rate,
      valueTo: state.valueTo,
      valueFrom: state.valueFrom,
      activeMarket: state.activeMarket,
      fromCurrencyPrecision: state.fromCurrencyPrecision,
      toCurrencyPrecision: state.toCurrencyPrecision,
    );
  }

  void updateCurrencyFromList(List<Currency> data) {
    state = ExchangeState(
      currencyFromList: data,
      currencyToList: state.currencyToList,
      selectedToCurrency: state.selectedToCurrency,
      selectedFromCurrency: state.selectedFromCurrency,
      rate: state.rate,
      valueTo: state.valueTo,
      valueFrom: state.valueFrom,
      activeMarket: state.activeMarket, //error here
      fromCurrencyPrecision: state.fromCurrencyPrecision,
      toCurrencyPrecision: state.toCurrencyPrecision,
    );
  }

  void updateCurrencyToList(List<Currency> data) {
    state = ExchangeState(
      currencyFromList: state.currencyFromList,
      currencyToList: data,
      selectedToCurrency: state.selectedToCurrency,
      selectedFromCurrency: state.selectedFromCurrency,
      rate: state.rate,
      valueTo: state.valueTo,
      valueFrom: state.valueFrom,
      activeMarket: state.activeMarket,
      fromCurrencyPrecision: state.fromCurrencyPrecision,
      toCurrencyPrecision: state.toCurrencyPrecision,
    );
  }

  void updateValueTo(String data) {
    state = ExchangeState(
      currencyFromList: state.currencyFromList,
      currencyToList: state.currencyToList,
      selectedToCurrency: state.selectedToCurrency,
      selectedFromCurrency: state.selectedFromCurrency,
      rate: state.rate,
      valueTo: data,
      valueFrom: state.valueFrom,
      activeMarket: state.activeMarket,
      fromCurrencyPrecision: state.fromCurrencyPrecision,
      toCurrencyPrecision: state.toCurrencyPrecision,
    );
  }

  void updateValueFrom(String data) {
    state = ExchangeState(
      currencyFromList: state.currencyFromList,
      currencyToList: state.currencyToList,
      selectedToCurrency: state.selectedToCurrency,
      rate: state.rate,
      selectedFromCurrency: state.selectedFromCurrency,
      valueTo: state.valueTo,
      valueFrom: data,
      activeMarket: state.activeMarket,
      fromCurrencyPrecision: state.fromCurrencyPrecision,
      toCurrencyPrecision: state.toCurrencyPrecision,
    );
  }

  void updateActiveMarket(Market newMarket) {
    state = ExchangeState(
      currencyFromList: state.currencyFromList,
      currencyToList: state.currencyToList,
      selectedToCurrency: state.selectedToCurrency,
      rate: state.rate,
      selectedFromCurrency: state.selectedFromCurrency,
      valueTo: state.valueTo,
      valueFrom: state.valueFrom,
      activeMarket: newMarket,
      fromCurrencyPrecision: state.fromCurrencyPrecision,
      toCurrencyPrecision: state.toCurrencyPrecision,
    );
  }

  void updateRate(ExchangeRate rate) {
    state = ExchangeState(
      currencyFromList: state.currencyFromList,
      currencyToList: state.currencyToList,
      selectedToCurrency: state.selectedToCurrency,
      rate: rate,
      selectedFromCurrency: state.selectedFromCurrency,
      valueTo: state.valueTo,
      valueFrom: state.valueFrom,
      activeMarket: state.activeMarket,
      fromCurrencyPrecision: state.fromCurrencyPrecision,
      toCurrencyPrecision: state.toCurrencyPrecision,
    );
  }

  void updatePrecision(PrecisionCurrencyState toCurrencyPrecision,
      PrecisionCurrencyState fromCurrencyPrecision) {
    state = ExchangeState(
      currencyFromList: state.currencyFromList,
      currencyToList: state.currencyToList,
      selectedToCurrency: state.selectedToCurrency,
      rate: state.rate,
      selectedFromCurrency: state.selectedFromCurrency,
      valueTo: state.valueTo,
      valueFrom: state.valueFrom,
      activeMarket: state.activeMarket,
      toCurrencyPrecision: toCurrencyPrecision,
      fromCurrencyPrecision: fromCurrencyPrecision,
    );
  }
}

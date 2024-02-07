import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_currency.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_exchange_state.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_payment_interface.dart';
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/get_currencies.data.gql.dart';

final nonCustodialCurrenciesStateNotifierProvider = StateNotifierProvider<
    NonCustodialCurrenciesDataStateNotifier, NonCustodialExchangeState>(
  (ref) => NonCustodialCurrenciesDataStateNotifier(),
);

class NonCustodialCurrenciesDataStateNotifier
    extends StateNotifier<NonCustodialExchangeState> {
  NonCustodialCurrenciesDataStateNotifier()
      : super(
          NonCustodialExchangeState(
            currencies: const [],
            markets: const [],
            receivePaymentInterface: const [],
            sendPaymentInterfaces: const [],
            selectedFromCurrency: const NonCustodialCurrency(
              id: 'id',
              name: 'name',
              iconUrl: 'iconUrl',
              precision: 0,
              paymentInterfaces: [],
              paymentInterfacesWC: [],
              currenciesToList: [],
              markets: [],
            ),
            selectedToCurrency: const Currency(
              id: 'id',
              name: 'name',
              iconUrl: 'iconUrl',
              precision: 0,
              minAmount: 0.0,
              marketId: 'marketId',
              swapBaseToQuotePricePrecision: 0,
              swapQuoteToBasePricePrecision: 0,
            ),
            activeMarket: GGetNonCustodialCurrenciesData_currencies_markets(),
            paymentInterfaces: const [],
            wcAddress: '',
            valueFrom: 0.0,
          ),
        );

  void updateCurrencies(List<NonCustodialCurrency> currencies) {
    state = NonCustodialExchangeState(
      currencies: currencies,
      selectedFromCurrency: state.selectedFromCurrency,
      selectedToCurrency: state.selectedToCurrency,
      activeMarket: state.activeMarket,
      markets: state.markets,
      paymentInterfaces: state.paymentInterfaces,
      wcAddress: state.wcAddress,
      valueFrom: state.valueFrom,
      receivePaymentInterface: state.receivePaymentInterface,
      sendPaymentInterfaces: state.sendPaymentInterfaces,
    );
  }

  void updateSelectedToCurrency(Currency currency) {
    state = NonCustodialExchangeState(
      currencies: state.currencies,
      selectedFromCurrency: state.selectedFromCurrency,
      selectedToCurrency: currency,
      activeMarket: state.activeMarket,
      markets: state.markets,
      paymentInterfaces: state.paymentInterfaces,
      wcAddress: state.wcAddress,
      valueFrom: state.valueFrom,
      receivePaymentInterface: state.receivePaymentInterface,
      sendPaymentInterfaces: state.sendPaymentInterfaces,
    );
  }

  void updateSelectedFromCurrency(NonCustodialCurrency currency) {
    state = NonCustodialExchangeState(
      currencies: state.currencies,
      selectedFromCurrency: currency,
      selectedToCurrency: state.selectedToCurrency,
      activeMarket: state.activeMarket,
      markets: state.markets,
      paymentInterfaces: state.paymentInterfaces,
      wcAddress: state.wcAddress,
      valueFrom: state.valueFrom,
      receivePaymentInterface: state.receivePaymentInterface,
      sendPaymentInterfaces: state.sendPaymentInterfaces,
    );
  }

  void updateActiveMarket(
      GGetNonCustodialCurrenciesData_currencies_markets market) {
    state = NonCustodialExchangeState(
      currencies: state.currencies,
      selectedFromCurrency: state.selectedFromCurrency,
      selectedToCurrency: state.selectedToCurrency,
      activeMarket: market,
      markets: state.markets,
      paymentInterfaces: state.paymentInterfaces,
      wcAddress: state.wcAddress,
      valueFrom: state.valueFrom,
      receivePaymentInterface: state.receivePaymentInterface,
      sendPaymentInterfaces: state.sendPaymentInterfaces,
    );
  }

  void updateMarkets(List<Currency> markets) {
    state = NonCustodialExchangeState(
      currencies: state.currencies,
      selectedFromCurrency: state.selectedFromCurrency,
      selectedToCurrency: state.selectedToCurrency,
      activeMarket: state.activeMarket,
      markets: markets,
      paymentInterfaces: state.paymentInterfaces,
      wcAddress: state.wcAddress,
      valueFrom: state.valueFrom,
      receivePaymentInterface: state.receivePaymentInterface,
      sendPaymentInterfaces: state.sendPaymentInterfaces,
    );
  }

  void updatePaymentInterfaces(
      List<GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces?>
          interfaces) {
    state = NonCustodialExchangeState(
      currencies: state.currencies,
      selectedFromCurrency: state.selectedFromCurrency,
      selectedToCurrency: state.selectedToCurrency,
      activeMarket: state.activeMarket,
      markets: state.markets,
      paymentInterfaces: interfaces,
      wcAddress: state.wcAddress,
      valueFrom: state.valueFrom,
      receivePaymentInterface: state.receivePaymentInterface,
      sendPaymentInterfaces: state.sendPaymentInterfaces,
    );
  }

  void updateWCAddress(String address) {
    state = NonCustodialExchangeState(
      currencies: state.currencies,
      selectedFromCurrency: state.selectedFromCurrency,
      selectedToCurrency: state.selectedToCurrency,
      activeMarket: state.activeMarket,
      markets: state.markets,
      paymentInterfaces: state.paymentInterfaces,
      wcAddress: address,
      valueFrom: state.valueFrom,
      receivePaymentInterface: state.receivePaymentInterface,
      sendPaymentInterfaces: state.sendPaymentInterfaces,
    );
  }

  void updateValueFrom(double valueFrom) {
    state = NonCustodialExchangeState(
      currencies: state.currencies,
      selectedFromCurrency: state.selectedFromCurrency,
      selectedToCurrency: state.selectedToCurrency,
      activeMarket: state.activeMarket,
      markets: state.markets,
      paymentInterfaces: state.paymentInterfaces,
      wcAddress: state.wcAddress,
      valueFrom: valueFrom,
      receivePaymentInterface: state.receivePaymentInterface,
      sendPaymentInterfaces: state.sendPaymentInterfaces,
    );
  }

  void updateReceivePaymentInterface(
      List<NonCustodialPaymentInterfacesState> receivePaymentIntefaces) {
    state = NonCustodialExchangeState(
      currencies: state.currencies,
      selectedFromCurrency: state.selectedFromCurrency,
      selectedToCurrency: state.selectedToCurrency,
      activeMarket: state.activeMarket,
      markets: state.markets,
      paymentInterfaces: state.paymentInterfaces,
      wcAddress: state.wcAddress,
      valueFrom: state.valueFrom,
      receivePaymentInterface: receivePaymentIntefaces,
      sendPaymentInterfaces: state.sendPaymentInterfaces,
    );
  }

  void updateSendPaymentInterface(
      List<NonCustodialPaymentInterfacesState> sendPaymentInterface) {
    state = NonCustodialExchangeState(
      currencies: state.currencies,
      selectedFromCurrency: state.selectedFromCurrency,
      selectedToCurrency: state.selectedToCurrency,
      activeMarket: state.activeMarket,
      markets: state.markets,
      paymentInterfaces: state.paymentInterfaces,
      wcAddress: state.wcAddress,
      valueFrom: state.valueFrom,
      receivePaymentInterface: state.receivePaymentInterface,
      sendPaymentInterfaces: sendPaymentInterface,
    );
  }
}

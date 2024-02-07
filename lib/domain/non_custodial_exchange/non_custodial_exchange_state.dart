import 'package:equatable/equatable.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_currency.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_payment_interface.dart';
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/get_currencies.data.gql.dart';

class NonCustodialExchangeState extends Equatable {
  const NonCustodialExchangeState({
    required this.currencies,
    required this.selectedFromCurrency,
    required this.selectedToCurrency,
    required this.activeMarket,
    required this.markets,
    required this.paymentInterfaces,
    required this.wcAddress,
    required this.valueFrom,
    required this.receivePaymentInterface,
    required this.sendPaymentInterfaces,
  });

  final List<NonCustodialCurrency> currencies;
  final NonCustodialCurrency selectedFromCurrency;
  final Currency selectedToCurrency;
  final GGetNonCustodialCurrenciesData_currencies_markets activeMarket;
  final List<Currency> markets;
  final List<
          GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces?>
      paymentInterfaces;
  final String wcAddress;
  final double valueFrom;
  final List<NonCustodialPaymentInterfacesState> receivePaymentInterface;
  final List<NonCustodialPaymentInterfacesState> sendPaymentInterfaces;

  @override
  List<Object> get props => [
        currencies,
        selectedFromCurrency,
        selectedToCurrency,
        activeMarket,
        markets,
        paymentInterfaces,
        wcAddress,
        valueFrom,
        receivePaymentInterface,
        sendPaymentInterfaces,
      ];
}

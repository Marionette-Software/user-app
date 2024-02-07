import 'package:equatable/equatable.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/get_currencies.data.gql.dart';

class NonCustodialCurrency extends Equatable {
  const NonCustodialCurrency({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.precision,
    required this.paymentInterfaces,
    required this.paymentInterfacesWC,
    required this.currenciesToList,
    required this.markets,
  });

  final String id;
  final String name;
  final String iconUrl;
  final int precision;
  final List<
          GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces?>
      paymentInterfaces;
  final List<
          GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface>
      paymentInterfacesWC;
  final List<Currency> currenciesToList;
  final List<GGetNonCustodialCurrenciesData_currencies_markets?> markets;

  @override
  List<Object> get props => [
        id,
        name,
        iconUrl,
        precision,
        paymentInterfaces,
        paymentInterfacesWC,
        currenciesToList,
        markets,
      ];
}

import 'package:equatable/equatable.dart';

class NonCustodialExchangeRate extends Equatable {
  const NonCustodialExchangeRate({
    required this.currencyTo,
    required this.currencyFrom,
    required this.rate,
  });

  final String currencyFrom;
  final String currencyTo;
  final double rate;

  @override
  List<Object> get props => [
        currencyFrom,
        currencyTo,
        rate,
      ];
}

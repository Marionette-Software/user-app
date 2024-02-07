import 'package:equatable/equatable.dart';
import 'package:user_app/domain/exchange/currency_from.dart';

class ExchangeRate extends Equatable {
  const ExchangeRate({
    required this.currencyTo,
    required this.currencyFrom,
    required this.rateWithPrecision,
    required this.rate,
  });

  final Currency currencyFrom;
  final Currency currencyTo;
  final String rateWithPrecision;
  final double rate;

  @override
  List<Object> get props => [
        rateWithPrecision,
        currencyFrom,
        currencyTo,
        rate,
      ];
}

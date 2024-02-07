import 'package:equatable/equatable.dart';

class MarketItem extends Equatable {
  const MarketItem({
    this.id,
    this.tradingPricePrecision,
    this.tradingAmountPrecision,
    this.quoteCurrencyPrecision,
  });

  final String? id;
  final int? tradingPricePrecision;
  final int? tradingAmountPrecision;
  final int? quoteCurrencyPrecision;

  @override
  List<Object> get props => [
        id!,
        tradingPricePrecision!,
        tradingAmountPrecision!,
        quoteCurrencyPrecision!,
      ];
}

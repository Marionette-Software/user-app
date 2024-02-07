import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  const Currency({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.precision,
    required this.minAmount,
    required this.marketId,
    this.swapBaseToQuotePricePrecision,
    this.swapQuoteToBasePricePrecision,
  });

  final String id;
  final String name;
  final String iconUrl;
  final int precision;
  final double minAmount;
  final String marketId;
  final int? swapBaseToQuotePricePrecision;
  final int? swapQuoteToBasePricePrecision;

  factory Currency.initialData() => const Currency(
        id: 'id',
        name: 'name',
        iconUrl: 'iconUrl',
        precision: 0,
        minAmount: 0,
        marketId: 'marketId',
      );

  @override
  List<Object> get props => [
        id,
        name,
        iconUrl,
        precision,
        minAmount,
        marketId,
        swapBaseToQuotePricePrecision!,
        swapQuoteToBasePricePrecision!,
      ];
}

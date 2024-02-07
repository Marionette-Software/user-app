import 'package:json_annotation/json_annotation.dart';

part 'market_dynamic.g.dart';

@JsonSerializable()
class MarketDynamic {
  final String? marketId;
  final double? highPrice;
  final double? lowPrice;
  final double? amount24h;
  final double? lastPrice;
  final double? startPrice;

  MarketDynamic({
    this.marketId = '',
    this.highPrice = 0.0,
    this.lowPrice = 0.0,
    this.amount24h = 0.0,
    this.startPrice = 0.0,
    this.lastPrice = 0.0,
  });

  factory MarketDynamic.initialData() => MarketDynamic(
        highPrice: 0.0,
        lowPrice: 0.0,
        amount24h: 0.0,
        startPrice: 0.0,
        lastPrice: 0.0,
        marketId: '',
      );

  factory MarketDynamic.fromJson(Map<String, dynamic> json) =>
      _$MarketDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$MarketDynamicToJson(this);
}

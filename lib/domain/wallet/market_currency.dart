import 'package:json_annotation/json_annotation.dart';

part 'market_currency.g.dart';

@JsonSerializable()
class MarketCurrency {
  final String id;
  final String name;
  final String icon_url;
  final int precision;
  final bool userBalanceEnable;
  final bool enabled;

  MarketCurrency({
    required this.id,
    required this.name,
    required this.icon_url,
    required this.precision,
    required this.userBalanceEnable,
    required this.enabled,
  });

  factory MarketCurrency.initialData() => MarketCurrency(
        id: 'id',
        name: 'name',
        icon_url: 'icon_url',
        precision: 0,
        userBalanceEnable: false,
        enabled: false,
      );

  factory MarketCurrency.fromJson(Map<String, dynamic> json) =>
      _$MarketCurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$MarketCurrencyToJson(this);
}

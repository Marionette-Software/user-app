// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketCurrency _$MarketCurrencyFromJson(Map<String, dynamic> json) =>
    MarketCurrency(
      id: json['id'] as String,
      name: json['name'] as String,
      icon_url: json['icon_url'] as String,
      precision: json['precision'] as int,
      userBalanceEnable: json['userBalanceEnable'] as bool,
      enabled: json['enabled'] as bool,
    );

Map<String, dynamic> _$MarketCurrencyToJson(MarketCurrency instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon_url': instance.icon_url,
      'precision': instance.precision,
      'userBalanceEnable': instance.userBalanceEnable,
      'enabled': instance.enabled,
    };

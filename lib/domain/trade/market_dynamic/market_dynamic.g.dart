// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_dynamic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketDynamic _$MarketDynamicFromJson(Map<String, dynamic> json) =>
    MarketDynamic(
      marketId: json['marketId'] as String? ?? '',
      highPrice: (json['highPrice'] as num?)?.toDouble() ?? 0.0,
      lowPrice: (json['lowPrice'] as num?)?.toDouble() ?? 0.0,
      amount24h: (json['amount24h'] as num?)?.toDouble() ?? 0.0,
      startPrice: (json['startPrice'] as num?)?.toDouble() ?? 0.0,
      lastPrice: (json['lastPrice'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$MarketDynamicToJson(MarketDynamic instance) =>
    <String, dynamic>{
      'marketId': instance.marketId,
      'highPrice': instance.highPrice,
      'lowPrice': instance.lowPrice,
      'amount24h': instance.amount24h,
      'lastPrice': instance.lastPrice,
      'startPrice': instance.startPrice,
    };

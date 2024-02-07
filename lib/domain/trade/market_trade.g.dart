// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_trade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketTrade _$MarketTradeFromJson(Map<String, dynamic> json) => MarketTrade(
      isFavorite: json['isFavorite'] as bool,
      id: json['id'] as String,
      rate: (json['rate'] as num).toDouble(),
      quote_currency: MarketCurrency.fromJson(
          json['quote_currency'] as Map<String, dynamic>),
      base_currency: MarketCurrency.fromJson(
          json['base_currency'] as Map<String, dynamic>),
      trading_price_precision: json['trading_price_precision'] as int,
      trading_min_amount: (json['trading_min_amount'] as num).toDouble(),
      trading_amount_precision: json['trading_amount_precision'] as int,
      enable_trading: json['enable_trading'] as bool,
      change24: (json['change24'] as num).toDouble(),
      swapBaseToQuotePricePrecision:
          json['swapBaseToQuotePricePrecision'] as int,
      swapQuoteToBasePricePrecision:
          json['swapQuoteToBasePricePrecision'] as int,
      trading_min_price: (json['trading_min_price'] as num).toDouble(),
      trading_max_price: (json['trading_max_price'] as num).toDouble(),
      trading_position: json['trading_position'] as int,
      marketDynamics: json['marketDynamics'] == null
          ? null
          : MarketDynamic.fromJson(
              json['marketDynamics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MarketTradeToJson(MarketTrade instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'enable_trading': instance.enable_trading,
      'base_currency': instance.base_currency,
      'quote_currency': instance.quote_currency,
      'change24': instance.change24,
      'trading_min_price': instance.trading_min_price,
      'trading_max_price': instance.trading_max_price,
      'trading_min_amount': instance.trading_min_amount,
      'trading_price_precision': instance.trading_price_precision,
      'trading_amount_precision': instance.trading_amount_precision,
      'trading_position': instance.trading_position,
      'swapBaseToQuotePricePrecision': instance.swapBaseToQuotePricePrecision,
      'swapQuoteToBasePricePrecision': instance.swapQuoteToBasePricePrecision,
      'marketDynamics': instance.marketDynamics,
      'isFavorite': instance.isFavorite,
    };

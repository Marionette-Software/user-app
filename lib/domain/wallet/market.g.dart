// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Market _$MarketFromJson(Map<String, dynamic> json) => Market(
      id: json['id'] as String,
      enabled: json['enabled'] as bool,
      rate: (json['rate'] as num).toDouble(),
      quote_currency: MarketCurrency.fromJson(
          json['quote_currency'] as Map<String, dynamic>),
      base_currency: MarketCurrency.fromJson(
          json['base_currency'] as Map<String, dynamic>),
      trading_price_precision: json['trading_price_precision'] as int,
      trading_min_amount: (json['trading_min_amount'] as num).toDouble(),
      trading_amount_precision: json['trading_amount_precision'] as int,
      enable_trading: json['enable_trading'] as bool,
      swapQuoteToBasePricePrecision:
          json['swapQuoteToBasePricePrecision'] as int,
      swapBaseToQuotePricePrecision:
          json['swapBaseToQuotePricePrecision'] as int,
      enable_custodial_exchange: json['enable_custodial_exchange'] as bool,
      sell_min_commission: (json['sell_min_commission'] as num).toDouble(),
      sell_max_commission: (json['sell_max_commission'] as num).toDouble(),
      sell_commission: (json['sell_commission'] as num).toDouble(),
      buy_max_commission: (json['buy_max_commission'] as num).toDouble(),
      buy_min_commission: (json['buy_min_commission'] as num).toDouble(),
      buy_commission: (json['buy_commission'] as num).toDouble(),
      commission_currency: json['commission_currency'] as String?,
      minQuoteCurrencyAmount:
          (json['minQuoteCurrencyAmount'] as num?)?.toDouble(),
      minBaseCurrencyAmount:
          (json['minBaseCurrencyAmount'] as num?)?.toDouble(),
      marketDynamics: json['marketDynamics'] == null
          ? null
          : MarketDynamic.fromJson(
              json['marketDynamics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MarketToJson(Market instance) => <String, dynamic>{
      'id': instance.id,
      'base_currency': instance.base_currency,
      'quote_currency': instance.quote_currency,
      'rate': instance.rate,
      'minBaseCurrencyAmount': instance.minBaseCurrencyAmount,
      'minQuoteCurrencyAmount': instance.minQuoteCurrencyAmount,
      'commission_currency': instance.commission_currency,
      'buy_commission': instance.buy_commission,
      'buy_min_commission': instance.buy_min_commission,
      'buy_max_commission': instance.buy_max_commission,
      'sell_commission': instance.sell_commission,
      'sell_min_commission': instance.sell_min_commission,
      'sell_max_commission': instance.sell_max_commission,
      'enable_custodial_exchange': instance.enable_custodial_exchange,
      'enabled': instance.enabled,
      'swapBaseToQuotePricePrecision': instance.swapBaseToQuotePricePrecision,
      'swapQuoteToBasePricePrecision': instance.swapQuoteToBasePricePrecision,
      'enable_trading': instance.enable_trading,
      'trading_min_amount': instance.trading_min_amount,
      'trading_price_precision': instance.trading_price_precision,
      'trading_amount_precision': instance.trading_amount_precision,
      'marketDynamics': instance.marketDynamics,
    };

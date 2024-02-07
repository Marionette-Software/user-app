import 'package:json_annotation/json_annotation.dart';
import 'package:user_app/domain/trade/market_dynamic/market_dynamic.dart';
import 'package:user_app/domain/wallet/market_currency.dart';
part 'market_trade.g.dart';

@JsonSerializable()
class MarketTrade {
  final String id;
  final double rate;
  final bool enable_trading;
  final MarketCurrency base_currency;
  final MarketCurrency quote_currency;
  final double change24;
  final double trading_min_price;
  final double trading_max_price;
  final double trading_min_amount;
  final int trading_price_precision;
  final int trading_amount_precision;
  final int trading_position;
  final int swapBaseToQuotePricePrecision;
  final int swapQuoteToBasePricePrecision;
  final MarketDynamic? marketDynamics;
  bool isFavorite;

  MarketTrade({
    required this.isFavorite,
    required this.id,
    required this.rate,
    required this.quote_currency,
    required this.base_currency,
    required this.trading_price_precision,
    required this.trading_min_amount,
    required this.trading_amount_precision,
    required this.enable_trading,
    required this.change24,
    required this.swapBaseToQuotePricePrecision,
    required this.swapQuoteToBasePricePrecision,
    required this.trading_min_price,
    required this.trading_max_price,
    required this.trading_position,
    this.marketDynamics,
  });

  factory MarketTrade.initialData() => MarketTrade(
        id: 'id',
        rate: 0.0,
        quote_currency: MarketCurrency.initialData(),
        base_currency: MarketCurrency.initialData(),
        trading_price_precision: 0,
        trading_min_amount: 0.0,
        trading_amount_precision: 0,
        enable_trading: false,
        marketDynamics: MarketDynamic.initialData(),
        change24: 0.0,
        trading_min_price: 0.0,
        trading_position: 1,
        trading_max_price: 0.0,
        swapQuoteToBasePricePrecision: 0,
        swapBaseToQuotePricePrecision: 0,
        isFavorite: false,
      );

  factory MarketTrade.fromJson(Map<String, dynamic> json) =>
      _$MarketTradeFromJson(json);

  Map<String, dynamic> toJson() => _$MarketTradeToJson(this);
}

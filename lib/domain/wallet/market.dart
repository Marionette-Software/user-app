import 'package:json_annotation/json_annotation.dart';
import 'package:user_app/domain/trade/market_dynamic/market_dynamic.dart';
import 'package:user_app/domain/wallet/market_currency.dart';
part 'market.g.dart';

@JsonSerializable()
class Market {
  final String id;
  final MarketCurrency base_currency;
  final MarketCurrency quote_currency;
  final double rate;
  final double? minBaseCurrencyAmount;
  final double? minQuoteCurrencyAmount;
  final String? commission_currency;
  final double buy_commission;
  final double buy_min_commission;
  final double buy_max_commission;
  final double sell_commission;
  final double sell_min_commission;
  final double sell_max_commission;
  final bool enable_custodial_exchange;
  final bool enabled;
  final int swapBaseToQuotePricePrecision;
  final int swapQuoteToBasePricePrecision;
  final bool enable_trading;
  final double trading_min_amount;
  final int trading_price_precision;
  final int trading_amount_precision;
  final MarketDynamic? marketDynamics;

  Market({
    required this.id,
    required this.enabled,
    required this.rate,
    required this.quote_currency,
    required this.base_currency,
    required this.trading_price_precision,
    required this.trading_min_amount,
    required this.trading_amount_precision,
    required this.enable_trading,
    required this.swapQuoteToBasePricePrecision,
    required this.swapBaseToQuotePricePrecision,
    required this.enable_custodial_exchange,
    required this.sell_min_commission,
    required this.sell_max_commission,
    required this.sell_commission,
    required this.buy_max_commission,
    required this.buy_min_commission,
    required this.buy_commission,
    this.commission_currency,
    this.minQuoteCurrencyAmount,
    this.minBaseCurrencyAmount,
    this.marketDynamics,
  });

  factory Market.initialData() => Market(
        id: 'id',
        enabled: false,
        rate: 0.0,
        quote_currency: MarketCurrency.initialData(),
        base_currency: MarketCurrency.initialData(),
        trading_price_precision: 0,
        trading_min_amount: 0.0,
        trading_amount_precision: 0,
        enable_trading: false,
        swapQuoteToBasePricePrecision: 0,
        swapBaseToQuotePricePrecision: 0,
        enable_custodial_exchange: false,
        sell_min_commission: 0,
        sell_max_commission: 0,
        sell_commission: 0.0,
        buy_max_commission: 0.0,
        buy_min_commission: 0.0,
        buy_commission: 0.0,
        commission_currency: 'commission_currency',
        minQuoteCurrencyAmount: 0.0,
        minBaseCurrencyAmount: 0.0,
        marketDynamics: MarketDynamic.initialData(),
      );

  factory Market.fromJson(Map<String, dynamic> json) => _$MarketFromJson(json);

  Map<String, dynamic> toJson() => _$MarketToJson(this);
}

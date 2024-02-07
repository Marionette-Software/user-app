// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_market.data.gql.g.dart';

abstract class GGetMarketData
    implements Built<GGetMarketData, GGetMarketDataBuilder> {
  GGetMarketData._();

  factory GGetMarketData([Function(GGetMarketDataBuilder b) updates]) =
      _$GGetMarketData;

  static void _initializeBuilder(GGetMarketDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetMarketData_market? get market;
  static Serializer<GGetMarketData> get serializer =>
      _$gGetMarketDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketData.serializer,
        json,
      );
}

abstract class GGetMarketData_market
    implements Built<GGetMarketData_market, GGetMarketData_marketBuilder> {
  GGetMarketData_market._();

  factory GGetMarketData_market(
          [Function(GGetMarketData_marketBuilder b) updates]) =
      _$GGetMarketData_market;

  static void _initializeBuilder(GGetMarketData_marketBuilder b) =>
      b..G__typename = 'Market';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get isFavorite;
  String? get id;
  double? get rate;
  bool? get enable_trading;
  GGetMarketData_market_quote_currency? get quote_currency;
  GGetMarketData_market_base_currency? get base_currency;
  double? get change24;
  double? get trading_min_price;
  double? get trading_max_price;
  double? get trading_min_amount;
  int? get trading_price_precision;
  int? get trading_amount_precision;
  int? get trading_position;
  GGetMarketData_market_marketDynamics? get marketDynamics;
  static Serializer<GGetMarketData_market> get serializer =>
      _$gGetMarketDataMarketSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketData_market.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketData_market? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketData_market.serializer,
        json,
      );
}

abstract class GGetMarketData_market_quote_currency
    implements
        Built<GGetMarketData_market_quote_currency,
            GGetMarketData_market_quote_currencyBuilder> {
  GGetMarketData_market_quote_currency._();

  factory GGetMarketData_market_quote_currency(
          [Function(GGetMarketData_market_quote_currencyBuilder b) updates]) =
      _$GGetMarketData_market_quote_currency;

  static void _initializeBuilder(
          GGetMarketData_market_quote_currencyBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  int? get precision;
  String? get icon_url;
  String? get name;
  bool? get userBalanceEnable;
  bool? get enabled;
  static Serializer<GGetMarketData_market_quote_currency> get serializer =>
      _$gGetMarketDataMarketQuoteCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketData_market_quote_currency.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketData_market_quote_currency? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketData_market_quote_currency.serializer,
        json,
      );
}

abstract class GGetMarketData_market_base_currency
    implements
        Built<GGetMarketData_market_base_currency,
            GGetMarketData_market_base_currencyBuilder> {
  GGetMarketData_market_base_currency._();

  factory GGetMarketData_market_base_currency(
          [Function(GGetMarketData_market_base_currencyBuilder b) updates]) =
      _$GGetMarketData_market_base_currency;

  static void _initializeBuilder(
          GGetMarketData_market_base_currencyBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  int? get precision;
  String? get icon_url;
  String? get name;
  bool? get userBalanceEnable;
  bool? get enabled;
  static Serializer<GGetMarketData_market_base_currency> get serializer =>
      _$gGetMarketDataMarketBaseCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketData_market_base_currency.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketData_market_base_currency? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketData_market_base_currency.serializer,
        json,
      );
}

abstract class GGetMarketData_market_marketDynamics
    implements
        Built<GGetMarketData_market_marketDynamics,
            GGetMarketData_market_marketDynamicsBuilder> {
  GGetMarketData_market_marketDynamics._();

  factory GGetMarketData_market_marketDynamics(
          [Function(GGetMarketData_market_marketDynamicsBuilder b) updates]) =
      _$GGetMarketData_market_marketDynamics;

  static void _initializeBuilder(
          GGetMarketData_market_marketDynamicsBuilder b) =>
      b..G__typename = 'MarketDynamics';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get marketId;
  double? get startPrice;
  double? get amount24h;
  double? get lastPrice;
  double? get lowPrice;
  double? get highPrice;
  static Serializer<GGetMarketData_market_marketDynamics> get serializer =>
      _$gGetMarketDataMarketMarketDynamicsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketData_market_marketDynamics.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketData_market_marketDynamics? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketData_market_marketDynamics.serializer,
        json,
      );
}

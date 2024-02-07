// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_markets.data.gql.g.dart';

abstract class GGetMarketsData
    implements Built<GGetMarketsData, GGetMarketsDataBuilder> {
  GGetMarketsData._();

  factory GGetMarketsData([Function(GGetMarketsDataBuilder b) updates]) =
      _$GGetMarketsData;

  static void _initializeBuilder(GGetMarketsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetMarketsData_markets?>? get markets;
  static Serializer<GGetMarketsData> get serializer =>
      _$gGetMarketsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketsData.serializer,
        json,
      );
}

abstract class GGetMarketsData_markets
    implements Built<GGetMarketsData_markets, GGetMarketsData_marketsBuilder> {
  GGetMarketsData_markets._();

  factory GGetMarketsData_markets(
          [Function(GGetMarketsData_marketsBuilder b) updates]) =
      _$GGetMarketsData_markets;

  static void _initializeBuilder(GGetMarketsData_marketsBuilder b) =>
      b..G__typename = 'Market';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get isFavorite;
  String? get id;
  double? get rate;
  bool? get enable_trading;
  GGetMarketsData_markets_quote_currency? get quote_currency;
  GGetMarketsData_markets_base_currency? get base_currency;
  double? get change24;
  double? get trading_min_price;
  double? get trading_max_price;
  double? get trading_min_amount;
  int? get trading_price_precision;
  int? get trading_amount_precision;
  int? get trading_position;
  int? get swapBaseToQuotePricePrecision;
  int? get swapQuoteToBasePricePrecision;
  GGetMarketsData_markets_marketDynamics? get marketDynamics;
  static Serializer<GGetMarketsData_markets> get serializer =>
      _$gGetMarketsDataMarketsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketsData_markets.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketsData_markets? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketsData_markets.serializer,
        json,
      );
}

abstract class GGetMarketsData_markets_quote_currency
    implements
        Built<GGetMarketsData_markets_quote_currency,
            GGetMarketsData_markets_quote_currencyBuilder> {
  GGetMarketsData_markets_quote_currency._();

  factory GGetMarketsData_markets_quote_currency(
          [Function(GGetMarketsData_markets_quote_currencyBuilder b) updates]) =
      _$GGetMarketsData_markets_quote_currency;

  static void _initializeBuilder(
          GGetMarketsData_markets_quote_currencyBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  int? get precision;
  String? get icon_url;
  String? get name;
  bool? get userBalanceEnable;
  bool? get enabled;
  static Serializer<GGetMarketsData_markets_quote_currency> get serializer =>
      _$gGetMarketsDataMarketsQuoteCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketsData_markets_quote_currency.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketsData_markets_quote_currency? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketsData_markets_quote_currency.serializer,
        json,
      );
}

abstract class GGetMarketsData_markets_base_currency
    implements
        Built<GGetMarketsData_markets_base_currency,
            GGetMarketsData_markets_base_currencyBuilder> {
  GGetMarketsData_markets_base_currency._();

  factory GGetMarketsData_markets_base_currency(
          [Function(GGetMarketsData_markets_base_currencyBuilder b) updates]) =
      _$GGetMarketsData_markets_base_currency;

  static void _initializeBuilder(
          GGetMarketsData_markets_base_currencyBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get enabled;
  String? get id;
  int? get precision;
  String? get icon_url;
  String? get name;
  bool? get userBalanceEnable;
  static Serializer<GGetMarketsData_markets_base_currency> get serializer =>
      _$gGetMarketsDataMarketsBaseCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketsData_markets_base_currency.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketsData_markets_base_currency? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketsData_markets_base_currency.serializer,
        json,
      );
}

abstract class GGetMarketsData_markets_marketDynamics
    implements
        Built<GGetMarketsData_markets_marketDynamics,
            GGetMarketsData_markets_marketDynamicsBuilder> {
  GGetMarketsData_markets_marketDynamics._();

  factory GGetMarketsData_markets_marketDynamics(
          [Function(GGetMarketsData_markets_marketDynamicsBuilder b) updates]) =
      _$GGetMarketsData_markets_marketDynamics;

  static void _initializeBuilder(
          GGetMarketsData_markets_marketDynamicsBuilder b) =>
      b..G__typename = 'MarketDynamics';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get marketId;
  double? get startPrice;
  double? get amount24h;
  double? get lastPrice;
  double? get lowPrice;
  double? get highPrice;
  static Serializer<GGetMarketsData_markets_marketDynamics> get serializer =>
      _$gGetMarketsDataMarketsMarketDynamicsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketsData_markets_marketDynamics.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketsData_markets_marketDynamics? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketsData_markets_marketDynamics.serializer,
        json,
      );
}

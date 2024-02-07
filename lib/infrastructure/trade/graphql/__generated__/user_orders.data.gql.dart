// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'user_orders.data.gql.g.dart';

abstract class GGetUseOrdersData
    implements Built<GGetUseOrdersData, GGetUseOrdersDataBuilder> {
  GGetUseOrdersData._();

  factory GGetUseOrdersData([Function(GGetUseOrdersDataBuilder b) updates]) =
      _$GGetUseOrdersData;

  static void _initializeBuilder(GGetUseOrdersDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetUseOrdersData_userOrders? get userOrders;
  static Serializer<GGetUseOrdersData> get serializer =>
      _$gGetUseOrdersDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUseOrdersData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUseOrdersData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUseOrdersData.serializer,
        json,
      );
}

abstract class GGetUseOrdersData_userOrders
    implements
        Built<GGetUseOrdersData_userOrders,
            GGetUseOrdersData_userOrdersBuilder> {
  GGetUseOrdersData_userOrders._();

  factory GGetUseOrdersData_userOrders(
          [Function(GGetUseOrdersData_userOrdersBuilder b) updates]) =
      _$GGetUseOrdersData_userOrders;

  static void _initializeBuilder(GGetUseOrdersData_userOrdersBuilder b) =>
      b..G__typename = 'OrdersPaginated';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetUseOrdersData_userOrders_result?>? get result;
  int? get limit;
  int? get total;
  static Serializer<GGetUseOrdersData_userOrders> get serializer =>
      _$gGetUseOrdersDataUserOrdersSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUseOrdersData_userOrders.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUseOrdersData_userOrders? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUseOrdersData_userOrders.serializer,
        json,
      );
}

abstract class GGetUseOrdersData_userOrders_result
    implements
        Built<GGetUseOrdersData_userOrders_result,
            GGetUseOrdersData_userOrders_resultBuilder> {
  GGetUseOrdersData_userOrders_result._();

  factory GGetUseOrdersData_userOrders_result(
          [Function(GGetUseOrdersData_userOrders_resultBuilder b) updates]) =
      _$GGetUseOrdersData_userOrders_result;

  static void _initializeBuilder(
          GGetUseOrdersData_userOrders_resultBuilder b) =>
      b..G__typename = 'Order';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get market;
  GGetUseOrdersData_userOrders_result_Market? get Market;
  String? get type;
  String? get side;
  String? get status;
  double? get executedAmount;
  double? get executedVolume;
  GGetUseOrdersData_userOrders_result_user? get user;
  double? get amount;
  double? get price;
  String? get createdAt;
  static Serializer<GGetUseOrdersData_userOrders_result> get serializer =>
      _$gGetUseOrdersDataUserOrdersResultSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUseOrdersData_userOrders_result.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUseOrdersData_userOrders_result? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUseOrdersData_userOrders_result.serializer,
        json,
      );
}

abstract class GGetUseOrdersData_userOrders_result_Market
    implements
        Built<GGetUseOrdersData_userOrders_result_Market,
            GGetUseOrdersData_userOrders_result_MarketBuilder> {
  GGetUseOrdersData_userOrders_result_Market._();

  factory GGetUseOrdersData_userOrders_result_Market(
      [Function(GGetUseOrdersData_userOrders_result_MarketBuilder b)
          updates]) = _$GGetUseOrdersData_userOrders_result_Market;

  static void _initializeBuilder(
          GGetUseOrdersData_userOrders_result_MarketBuilder b) =>
      b..G__typename = 'Market';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  double? get rate;
  bool? get enable_trading;
  GGetUseOrdersData_userOrders_result_Market_quote_currency? get quote_currency;
  GGetUseOrdersData_userOrders_result_Market_base_currency? get base_currency;
  double? get change24;
  double? get trading_min_price;
  double? get trading_max_price;
  double? get trading_min_amount;
  int? get trading_price_precision;
  int? get trading_amount_precision;
  GGetUseOrdersData_userOrders_result_Market_marketDynamics? get marketDynamics;
  static Serializer<GGetUseOrdersData_userOrders_result_Market>
      get serializer => _$gGetUseOrdersDataUserOrdersResultMarketSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUseOrdersData_userOrders_result_Market.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUseOrdersData_userOrders_result_Market? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUseOrdersData_userOrders_result_Market.serializer,
        json,
      );
}

abstract class GGetUseOrdersData_userOrders_result_Market_quote_currency
    implements
        Built<GGetUseOrdersData_userOrders_result_Market_quote_currency,
            GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder> {
  GGetUseOrdersData_userOrders_result_Market_quote_currency._();

  factory GGetUseOrdersData_userOrders_result_Market_quote_currency(
      [Function(
              GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder
                  b)
          updates]) = _$GGetUseOrdersData_userOrders_result_Market_quote_currency;

  static void _initializeBuilder(
          GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  int? get precision;
  String? get icon_url;
  String? get name;
  static Serializer<GGetUseOrdersData_userOrders_result_Market_quote_currency>
      get serializer =>
          _$gGetUseOrdersDataUserOrdersResultMarketQuoteCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUseOrdersData_userOrders_result_Market_quote_currency.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUseOrdersData_userOrders_result_Market_quote_currency? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUseOrdersData_userOrders_result_Market_quote_currency.serializer,
        json,
      );
}

abstract class GGetUseOrdersData_userOrders_result_Market_base_currency
    implements
        Built<GGetUseOrdersData_userOrders_result_Market_base_currency,
            GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder> {
  GGetUseOrdersData_userOrders_result_Market_base_currency._();

  factory GGetUseOrdersData_userOrders_result_Market_base_currency(
      [Function(
              GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder b)
          updates]) = _$GGetUseOrdersData_userOrders_result_Market_base_currency;

  static void _initializeBuilder(
          GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  int? get precision;
  String? get icon_url;
  String? get name;
  static Serializer<GGetUseOrdersData_userOrders_result_Market_base_currency>
      get serializer =>
          _$gGetUseOrdersDataUserOrdersResultMarketBaseCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUseOrdersData_userOrders_result_Market_base_currency.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUseOrdersData_userOrders_result_Market_base_currency? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUseOrdersData_userOrders_result_Market_base_currency.serializer,
        json,
      );
}

abstract class GGetUseOrdersData_userOrders_result_Market_marketDynamics
    implements
        Built<GGetUseOrdersData_userOrders_result_Market_marketDynamics,
            GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder> {
  GGetUseOrdersData_userOrders_result_Market_marketDynamics._();

  factory GGetUseOrdersData_userOrders_result_Market_marketDynamics(
      [Function(
              GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder
                  b)
          updates]) = _$GGetUseOrdersData_userOrders_result_Market_marketDynamics;

  static void _initializeBuilder(
          GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder b) =>
      b..G__typename = 'MarketDynamics';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get marketId;
  double? get startPrice;
  double? get amount24h;
  double? get lastPrice;
  double? get lowPrice;
  double? get highPrice;
  static Serializer<GGetUseOrdersData_userOrders_result_Market_marketDynamics>
      get serializer =>
          _$gGetUseOrdersDataUserOrdersResultMarketMarketDynamicsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUseOrdersData_userOrders_result_Market_marketDynamics.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUseOrdersData_userOrders_result_Market_marketDynamics? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUseOrdersData_userOrders_result_Market_marketDynamics.serializer,
        json,
      );
}

abstract class GGetUseOrdersData_userOrders_result_user
    implements
        Built<GGetUseOrdersData_userOrders_result_user,
            GGetUseOrdersData_userOrders_result_userBuilder> {
  GGetUseOrdersData_userOrders_result_user._();

  factory GGetUseOrdersData_userOrders_result_user(
      [Function(GGetUseOrdersData_userOrders_result_userBuilder b)
          updates]) = _$GGetUseOrdersData_userOrders_result_user;

  static void _initializeBuilder(
          GGetUseOrdersData_userOrders_result_userBuilder b) =>
      b..G__typename = 'User';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  static Serializer<GGetUseOrdersData_userOrders_result_user> get serializer =>
      _$gGetUseOrdersDataUserOrdersResultUserSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUseOrdersData_userOrders_result_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUseOrdersData_userOrders_result_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUseOrdersData_userOrders_result_user.serializer,
        json,
      );
}

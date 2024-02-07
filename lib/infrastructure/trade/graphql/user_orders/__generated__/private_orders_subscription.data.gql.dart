// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'private_orders_subscription.data.gql.g.dart';

abstract class GPrivateOrdersSubscriptionData
    implements
        Built<GPrivateOrdersSubscriptionData,
            GPrivateOrdersSubscriptionDataBuilder> {
  GPrivateOrdersSubscriptionData._();

  factory GPrivateOrdersSubscriptionData(
          [Function(GPrivateOrdersSubscriptionDataBuilder b) updates]) =
      _$GPrivateOrdersSubscriptionData;

  static void _initializeBuilder(GPrivateOrdersSubscriptionDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GPrivateOrdersSubscriptionData_privateOrders? get privateOrders;
  static Serializer<GPrivateOrdersSubscriptionData> get serializer =>
      _$gPrivateOrdersSubscriptionDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPrivateOrdersSubscriptionData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPrivateOrdersSubscriptionData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPrivateOrdersSubscriptionData.serializer,
        json,
      );
}

abstract class GPrivateOrdersSubscriptionData_privateOrders
    implements
        Built<GPrivateOrdersSubscriptionData_privateOrders,
            GPrivateOrdersSubscriptionData_privateOrdersBuilder> {
  GPrivateOrdersSubscriptionData_privateOrders._();

  factory GPrivateOrdersSubscriptionData_privateOrders(
      [Function(GPrivateOrdersSubscriptionData_privateOrdersBuilder b)
          updates]) = _$GPrivateOrdersSubscriptionData_privateOrders;

  static void _initializeBuilder(
          GPrivateOrdersSubscriptionData_privateOrdersBuilder b) =>
      b..G__typename = 'Order';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get market;
  String? get type;
  String? get side;
  String? get status;
  double? get executedAmount;
  double? get executedVolume;
  GPrivateOrdersSubscriptionData_privateOrders_user? get user;
  double? get amount;
  double? get price;
  String? get createdAt;
  GPrivateOrdersSubscriptionData_privateOrders_Market? get Market;
  static Serializer<GPrivateOrdersSubscriptionData_privateOrders>
      get serializer => _$gPrivateOrdersSubscriptionDataPrivateOrdersSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPrivateOrdersSubscriptionData_privateOrders.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPrivateOrdersSubscriptionData_privateOrders? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPrivateOrdersSubscriptionData_privateOrders.serializer,
        json,
      );
}

abstract class GPrivateOrdersSubscriptionData_privateOrders_user
    implements
        Built<GPrivateOrdersSubscriptionData_privateOrders_user,
            GPrivateOrdersSubscriptionData_privateOrders_userBuilder> {
  GPrivateOrdersSubscriptionData_privateOrders_user._();

  factory GPrivateOrdersSubscriptionData_privateOrders_user(
      [Function(GPrivateOrdersSubscriptionData_privateOrders_userBuilder b)
          updates]) = _$GPrivateOrdersSubscriptionData_privateOrders_user;

  static void _initializeBuilder(
          GPrivateOrdersSubscriptionData_privateOrders_userBuilder b) =>
      b..G__typename = 'User';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  static Serializer<GPrivateOrdersSubscriptionData_privateOrders_user>
      get serializer =>
          _$gPrivateOrdersSubscriptionDataPrivateOrdersUserSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPrivateOrdersSubscriptionData_privateOrders_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPrivateOrdersSubscriptionData_privateOrders_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPrivateOrdersSubscriptionData_privateOrders_user.serializer,
        json,
      );
}

abstract class GPrivateOrdersSubscriptionData_privateOrders_Market
    implements
        Built<GPrivateOrdersSubscriptionData_privateOrders_Market,
            GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder> {
  GPrivateOrdersSubscriptionData_privateOrders_Market._();

  factory GPrivateOrdersSubscriptionData_privateOrders_Market(
      [Function(GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder b)
          updates]) = _$GPrivateOrdersSubscriptionData_privateOrders_Market;

  static void _initializeBuilder(
          GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder b) =>
      b..G__typename = 'Market';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  double? get rate;
  bool? get enable_trading;
  GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency?
      get quote_currency;
  GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency?
      get base_currency;
  double? get change24;
  double? get trading_min_price;
  double? get trading_max_price;
  double? get trading_min_amount;
  int? get trading_price_precision;
  int? get trading_amount_precision;
  GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics?
      get marketDynamics;
  static Serializer<GPrivateOrdersSubscriptionData_privateOrders_Market>
      get serializer =>
          _$gPrivateOrdersSubscriptionDataPrivateOrdersMarketSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPrivateOrdersSubscriptionData_privateOrders_Market.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPrivateOrdersSubscriptionData_privateOrders_Market? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPrivateOrdersSubscriptionData_privateOrders_Market.serializer,
        json,
      );
}

abstract class GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency
    implements
        Built<
            GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency,
            GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder> {
  GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency._();

  factory GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency(
          [Function(
                  GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder
                      b)
              updates]) =
      _$GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency;

  static void _initializeBuilder(
          GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder
              b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  int? get precision;
  String? get icon_url;
  String? get name;
  static Serializer<
          GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency>
      get serializer =>
          _$gPrivateOrdersSubscriptionDataPrivateOrdersMarketQuoteCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency
                .serializer,
            json,
          );
}

abstract class GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency
    implements
        Built<GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency,
            GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder> {
  GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency._();

  factory GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency(
          [Function(
                  GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder
                      b)
              updates]) =
      _$GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency;

  static void _initializeBuilder(
          GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder
              b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  int? get precision;
  String? get icon_url;
  String? get name;
  static Serializer<
          GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency>
      get serializer =>
          _$gPrivateOrdersSubscriptionDataPrivateOrdersMarketBaseCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency
                .serializer,
            json,
          );
}

abstract class GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics
    implements
        Built<
            GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics,
            GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder> {
  GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics._();

  factory GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics(
          [Function(
                  GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder
                      b)
              updates]) =
      _$GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics;

  static void _initializeBuilder(
          GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder
              b) =>
      b..G__typename = 'MarketDynamics';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get marketId;
  double? get startPrice;
  double? get amount24h;
  double? get lastPrice;
  double? get lowPrice;
  double? get highPrice;
  static Serializer<
          GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics>
      get serializer =>
          _$gPrivateOrdersSubscriptionDataPrivateOrdersMarketMarketDynamicsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics
                .serializer,
            json,
          );
}

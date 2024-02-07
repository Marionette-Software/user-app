// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_user_wallets.data.gql.g.dart';

abstract class GGetUserWalletsData
    implements Built<GGetUserWalletsData, GGetUserWalletsDataBuilder> {
  GGetUserWalletsData._();

  factory GGetUserWalletsData(
      [Function(GGetUserWalletsDataBuilder b) updates]) = _$GGetUserWalletsData;

  static void _initializeBuilder(GGetUserWalletsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetUserWalletsData_user? get user;
  static Serializer<GGetUserWalletsData> get serializer =>
      _$gGetUserWalletsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserWalletsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserWalletsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserWalletsData.serializer,
        json,
      );
}

abstract class GGetUserWalletsData_user
    implements
        Built<GGetUserWalletsData_user, GGetUserWalletsData_userBuilder> {
  GGetUserWalletsData_user._();

  factory GGetUserWalletsData_user(
          [Function(GGetUserWalletsData_userBuilder b) updates]) =
      _$GGetUserWalletsData_user;

  static void _initializeBuilder(GGetUserWalletsData_userBuilder b) =>
      b..G__typename = 'User';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetUserWalletsData_user_currencies?>? get currencies;
  static Serializer<GGetUserWalletsData_user> get serializer =>
      _$gGetUserWalletsDataUserSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserWalletsData_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserWalletsData_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserWalletsData_user.serializer,
        json,
      );
}

abstract class GGetUserWalletsData_user_currencies
    implements
        Built<GGetUserWalletsData_user_currencies,
            GGetUserWalletsData_user_currenciesBuilder> {
  GGetUserWalletsData_user_currencies._();

  factory GGetUserWalletsData_user_currencies(
          [Function(GGetUserWalletsData_user_currenciesBuilder b) updates]) =
      _$GGetUserWalletsData_user_currencies;

  static void _initializeBuilder(
          GGetUserWalletsData_user_currenciesBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get name;
  String? get icon_url;
  int? get position;
  int? get precision;
  bool? get enabled;
  String? get lightBgColor1;
  String? get lightBgColor2;
  String? get darkBgColor1;
  String? get darkBgColor2;
  String? get lightTextColor;
  bool? get staking_enabled;
  bool? get isUnstakingProcess;
  bool? get isFavorite;
  BuiltList<GGetUserWalletsData_user_currencies_markets?>? get markets;
  static Serializer<GGetUserWalletsData_user_currencies> get serializer =>
      _$gGetUserWalletsDataUserCurrenciesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserWalletsData_user_currencies.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserWalletsData_user_currencies? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserWalletsData_user_currencies.serializer,
        json,
      );
}

abstract class GGetUserWalletsData_user_currencies_markets
    implements
        Built<GGetUserWalletsData_user_currencies_markets,
            GGetUserWalletsData_user_currencies_marketsBuilder> {
  GGetUserWalletsData_user_currencies_markets._();

  factory GGetUserWalletsData_user_currencies_markets(
      [Function(GGetUserWalletsData_user_currencies_marketsBuilder b)
          updates]) = _$GGetUserWalletsData_user_currencies_markets;

  static void _initializeBuilder(
          GGetUserWalletsData_user_currencies_marketsBuilder b) =>
      b..G__typename = 'Market';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  bool? get isFavorite;
  GGetUserWalletsData_user_currencies_markets_marketDynamics?
      get marketDynamics;
  GGetUserWalletsData_user_currencies_markets_base_currency? get base_currency;
  GGetUserWalletsData_user_currencies_markets_quote_currency?
      get quote_currency;
  double? get rate;
  double? get minBaseCurrencyAmount;
  double? get minQuoteCurrencyAmount;
  String? get commission_currency;
  double? get buy_commission;
  double? get buy_min_commission;
  double? get buy_max_commission;
  double? get sell_commission;
  double? get sell_min_commission;
  double? get sell_max_commission;
  bool? get enable_custodial_exchange;
  bool? get enabled;
  int? get swapBaseToQuotePricePrecision;
  int? get swapQuoteToBasePricePrecision;
  bool? get enable_trading;
  double? get trading_min_amount;
  int? get trading_price_precision;
  int? get trading_amount_precision;
  static Serializer<GGetUserWalletsData_user_currencies_markets>
      get serializer => _$gGetUserWalletsDataUserCurrenciesMarketsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserWalletsData_user_currencies_markets.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserWalletsData_user_currencies_markets? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserWalletsData_user_currencies_markets.serializer,
        json,
      );
}

abstract class GGetUserWalletsData_user_currencies_markets_marketDynamics
    implements
        Built<GGetUserWalletsData_user_currencies_markets_marketDynamics,
            GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder> {
  GGetUserWalletsData_user_currencies_markets_marketDynamics._();

  factory GGetUserWalletsData_user_currencies_markets_marketDynamics(
      [Function(
              GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder
                  b)
          updates]) = _$GGetUserWalletsData_user_currencies_markets_marketDynamics;

  static void _initializeBuilder(
          GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder
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
  static Serializer<GGetUserWalletsData_user_currencies_markets_marketDynamics>
      get serializer =>
          _$gGetUserWalletsDataUserCurrenciesMarketsMarketDynamicsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserWalletsData_user_currencies_markets_marketDynamics.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserWalletsData_user_currencies_markets_marketDynamics? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserWalletsData_user_currencies_markets_marketDynamics.serializer,
        json,
      );
}

abstract class GGetUserWalletsData_user_currencies_markets_base_currency
    implements
        Built<GGetUserWalletsData_user_currencies_markets_base_currency,
            GGetUserWalletsData_user_currencies_markets_base_currencyBuilder> {
  GGetUserWalletsData_user_currencies_markets_base_currency._();

  factory GGetUserWalletsData_user_currencies_markets_base_currency(
      [Function(
              GGetUserWalletsData_user_currencies_markets_base_currencyBuilder
                  b)
          updates]) = _$GGetUserWalletsData_user_currencies_markets_base_currency;

  static void _initializeBuilder(
          GGetUserWalletsData_user_currencies_markets_base_currencyBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get name;
  String? get icon_url;
  int? get precision;
  bool? get userBalanceEnable;
  bool? get enabled;
  static Serializer<GGetUserWalletsData_user_currencies_markets_base_currency>
      get serializer =>
          _$gGetUserWalletsDataUserCurrenciesMarketsBaseCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserWalletsData_user_currencies_markets_base_currency.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserWalletsData_user_currencies_markets_base_currency? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserWalletsData_user_currencies_markets_base_currency.serializer,
        json,
      );
}

abstract class GGetUserWalletsData_user_currencies_markets_quote_currency
    implements
        Built<GGetUserWalletsData_user_currencies_markets_quote_currency,
            GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder> {
  GGetUserWalletsData_user_currencies_markets_quote_currency._();

  factory GGetUserWalletsData_user_currencies_markets_quote_currency(
      [Function(
              GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder
                  b)
          updates]) = _$GGetUserWalletsData_user_currencies_markets_quote_currency;

  static void _initializeBuilder(
          GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder
              b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get name;
  String? get icon_url;
  int? get precision;
  bool? get userBalanceEnable;
  bool? get enabled;
  static Serializer<GGetUserWalletsData_user_currencies_markets_quote_currency>
      get serializer =>
          _$gGetUserWalletsDataUserCurrenciesMarketsQuoteCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserWalletsData_user_currencies_markets_quote_currency.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserWalletsData_user_currencies_markets_quote_currency? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserWalletsData_user_currencies_markets_quote_currency.serializer,
        json,
      );
}

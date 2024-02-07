// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_currencies.data.gql.g.dart';

abstract class GGetNonCustodialCurrenciesData
    implements
        Built<GGetNonCustodialCurrenciesData,
            GGetNonCustodialCurrenciesDataBuilder> {
  GGetNonCustodialCurrenciesData._();

  factory GGetNonCustodialCurrenciesData(
          [Function(GGetNonCustodialCurrenciesDataBuilder b) updates]) =
      _$GGetNonCustodialCurrenciesData;

  static void _initializeBuilder(GGetNonCustodialCurrenciesDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetNonCustodialCurrenciesData_currencies?>? get currencies;
  static Serializer<GGetNonCustodialCurrenciesData> get serializer =>
      _$gGetNonCustodialCurrenciesDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetNonCustodialCurrenciesData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetNonCustodialCurrenciesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetNonCustodialCurrenciesData.serializer,
        json,
      );
}

abstract class GGetNonCustodialCurrenciesData_currencies
    implements
        Built<GGetNonCustodialCurrenciesData_currencies,
            GGetNonCustodialCurrenciesData_currenciesBuilder> {
  GGetNonCustodialCurrenciesData_currencies._();

  factory GGetNonCustodialCurrenciesData_currencies(
      [Function(GGetNonCustodialCurrenciesData_currenciesBuilder b)
          updates]) = _$GGetNonCustodialCurrenciesData_currencies;

  static void _initializeBuilder(
          GGetNonCustodialCurrenciesData_currenciesBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get name;
  int? get precision;
  String? get icon_url;
  BuiltList<GGetNonCustodialCurrenciesData_currencies_markets?>? get markets;
  BuiltList<
          GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces?>?
      get currencyPaymentInterfaces;
  static Serializer<GGetNonCustodialCurrenciesData_currencies> get serializer =>
      _$gGetNonCustodialCurrenciesDataCurrenciesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetNonCustodialCurrenciesData_currencies.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetNonCustodialCurrenciesData_currencies? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetNonCustodialCurrenciesData_currencies.serializer,
        json,
      );
}

abstract class GGetNonCustodialCurrenciesData_currencies_markets
    implements
        Built<GGetNonCustodialCurrenciesData_currencies_markets,
            GGetNonCustodialCurrenciesData_currencies_marketsBuilder> {
  GGetNonCustodialCurrenciesData_currencies_markets._();

  factory GGetNonCustodialCurrenciesData_currencies_markets(
      [Function(GGetNonCustodialCurrenciesData_currencies_marketsBuilder b)
          updates]) = _$GGetNonCustodialCurrenciesData_currencies_markets;

  static void _initializeBuilder(
          GGetNonCustodialCurrenciesData_currencies_marketsBuilder b) =>
      b..G__typename = 'Market';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  double? get rate;
  String? get commission_currency;
  String? get base_currency_id;
  double? get minBaseCurrencyAmount;
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency?
      get base_currency;
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency?
      get quote_currency;
  String? get quote_currency_id;
  double? get minQuoteCurrencyAmount;
  double? get buy_commission;
  double? get buy_max_commission;
  double? get buy_min_commission;
  double? get sell_commission;
  double? get sell_max_commission;
  double? get sell_min_commission;
  bool? get enable_non_custodial_exchange;
  int? get swapBaseToQuotePricePrecision;
  int? get swapQuoteToBasePricePrecision;
  static Serializer<GGetNonCustodialCurrenciesData_currencies_markets>
      get serializer =>
          _$gGetNonCustodialCurrenciesDataCurrenciesMarketsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetNonCustodialCurrenciesData_currencies_markets.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetNonCustodialCurrenciesData_currencies_markets? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetNonCustodialCurrenciesData_currencies_markets.serializer,
        json,
      );
}

abstract class GGetNonCustodialCurrenciesData_currencies_markets_base_currency
    implements
        Built<GGetNonCustodialCurrenciesData_currencies_markets_base_currency,
            GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder> {
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency._();

  factory GGetNonCustodialCurrenciesData_currencies_markets_base_currency(
          [Function(
                  GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder
                      b)
              updates]) =
      _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency;

  static void _initializeBuilder(
          GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder
              b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get name;
  int? get precision;
  String? get icon_url;
  bool? get userBalanceEnable;
  BuiltList<
          GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces?>?
      get currencyPaymentInterfaces;
  static Serializer<
          GGetNonCustodialCurrenciesData_currencies_markets_base_currency>
      get serializer =>
          _$gGetNonCustodialCurrenciesDataCurrenciesMarketsBaseCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetNonCustodialCurrenciesData_currencies_markets_base_currency
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetNonCustodialCurrenciesData_currencies_markets_base_currency?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetNonCustodialCurrenciesData_currencies_markets_base_currency
                .serializer,
            json,
          );
}

abstract class GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces
    implements
        Built<
            GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces,
            GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfacesBuilder> {
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces._();

  factory GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces(
          [Function(
                  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfacesBuilder
                      b)
              updates]) =
      _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces;

  static void _initializeBuilder(
          GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfacesBuilder
              b) =>
      b..G__typename = 'CurrencyPaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get type;
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface?
      get paymentInterface;
  static Serializer<
          GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces>
      get serializer =>
          _$gGetNonCustodialCurrenciesDataCurrenciesMarketsBaseCurrencyCurrencyPaymentInterfacesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces
                .serializer,
            json,
          );
}

abstract class GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface
    implements
        Built<
            GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface,
            GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder> {
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface._();

  factory GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface(
          [Function(
                  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
                      b)
              updates]) =
      _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface;

  static void _initializeBuilder(
          GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
              b) =>
      b..G__typename = 'PaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get title;
  String? get subtitle;
  String? get logoUrl;
  static Serializer<
          GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface>
      get serializer =>
          _$gGetNonCustodialCurrenciesDataCurrenciesMarketsBaseCurrencyCurrencyPaymentInterfacesPaymentInterfaceSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface
                .serializer,
            json,
          );
}

abstract class GGetNonCustodialCurrenciesData_currencies_markets_quote_currency
    implements
        Built<GGetNonCustodialCurrenciesData_currencies_markets_quote_currency,
            GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder> {
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency._();

  factory GGetNonCustodialCurrenciesData_currencies_markets_quote_currency(
          [Function(
                  GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder
                      b)
              updates]) =
      _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency;

  static void _initializeBuilder(
          GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder
              b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get name;
  int? get precision;
  String? get icon_url;
  bool? get userBalanceEnable;
  BuiltList<
          GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces?>?
      get currencyPaymentInterfaces;
  static Serializer<
          GGetNonCustodialCurrenciesData_currencies_markets_quote_currency>
      get serializer =>
          _$gGetNonCustodialCurrenciesDataCurrenciesMarketsQuoteCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetNonCustodialCurrenciesData_currencies_markets_quote_currency
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetNonCustodialCurrenciesData_currencies_markets_quote_currency?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetNonCustodialCurrenciesData_currencies_markets_quote_currency
                .serializer,
            json,
          );
}

abstract class GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces
    implements
        Built<
            GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces,
            GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfacesBuilder> {
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces._();

  factory GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces(
          [Function(
                  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfacesBuilder
                      b)
              updates]) =
      _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces;

  static void _initializeBuilder(
          GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfacesBuilder
              b) =>
      b..G__typename = 'CurrencyPaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get type;
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface?
      get paymentInterface;
  static Serializer<
          GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces>
      get serializer =>
          _$gGetNonCustodialCurrenciesDataCurrenciesMarketsQuoteCurrencyCurrencyPaymentInterfacesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces
                .serializer,
            json,
          );
}

abstract class GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface
    implements
        Built<
            GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface,
            GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder> {
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface._();

  factory GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface(
          [Function(
                  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
                      b)
              updates]) =
      _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface;

  static void _initializeBuilder(
          GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
              b) =>
      b..G__typename = 'PaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get title;
  String? get subtitle;
  String? get logoUrl;
  static Serializer<
          GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface>
      get serializer =>
          _$gGetNonCustodialCurrenciesDataCurrenciesMarketsQuoteCurrencyCurrencyPaymentInterfacesPaymentInterfaceSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface
                .serializer,
            json,
          );
}

abstract class GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces
    implements
        Built<
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces,
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfacesBuilder> {
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces._();

  factory GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces(
          [Function(
                  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfacesBuilder
                      b)
              updates]) =
      _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces;

  static void _initializeBuilder(
          GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfacesBuilder
              b) =>
      b..G__typename = 'CurrencyPaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get paymentInterfaceId;
  String? get type;
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface?
      get paymentInterface;
  bool? get userDepositEnable;
  bool? get userWithdrawEnable;
  static Serializer<
          GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces>
      get serializer =>
          _$gGetNonCustodialCurrenciesDataCurrenciesCurrencyPaymentInterfacesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces
                .serializer,
            json,
          );
}

abstract class GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface
    implements
        Built<
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface,
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder> {
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface._();

  factory GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface(
          [Function(
                  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder
                      b)
              updates]) =
      _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface;

  static void _initializeBuilder(
          GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder
              b) =>
      b..G__typename = 'PaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get title;
  String? get logoUrl;
  String? get subtitle;
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain?
      get blockchain;
  static Serializer<
          GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface>
      get serializer =>
          _$gGetNonCustodialCurrenciesDataCurrenciesCurrencyPaymentInterfacesPaymentInterfaceSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface
                .serializer,
            json,
          );
}

abstract class GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain
    implements
        Built<
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain,
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder> {
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain._();

  factory GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain(
          [Function(
                  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder
                      b)
              updates]) =
      _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain;

  static void _initializeBuilder(
          GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder
              b) =>
      b..G__typename = 'Blockchain';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get name;
  String? get description;
  String? get explorer_address;
  String? get chainId;
  String? get wallet;
  static Serializer<
          GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain>
      get serializer =>
          _$gGetNonCustodialCurrenciesDataCurrenciesCurrencyPaymentInterfacesPaymentInterfaceBlockchainSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain
                .serializer,
            json,
          );
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_currency_chains_by_id.data.gql.g.dart';

abstract class GGetCurrencyChainsDataData
    implements
        Built<GGetCurrencyChainsDataData, GGetCurrencyChainsDataDataBuilder> {
  GGetCurrencyChainsDataData._();

  factory GGetCurrencyChainsDataData(
          [Function(GGetCurrencyChainsDataDataBuilder b) updates]) =
      _$GGetCurrencyChainsDataData;

  static void _initializeBuilder(GGetCurrencyChainsDataDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetCurrencyChainsDataData_currencyChains?>? get currencyChains;
  static Serializer<GGetCurrencyChainsDataData> get serializer =>
      _$gGetCurrencyChainsDataDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetCurrencyChainsDataData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetCurrencyChainsDataData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetCurrencyChainsDataData.serializer,
        json,
      );
}

abstract class GGetCurrencyChainsDataData_currencyChains
    implements
        Built<GGetCurrencyChainsDataData_currencyChains,
            GGetCurrencyChainsDataData_currencyChainsBuilder> {
  GGetCurrencyChainsDataData_currencyChains._();

  factory GGetCurrencyChainsDataData_currencyChains(
      [Function(GGetCurrencyChainsDataData_currencyChainsBuilder b)
          updates]) = _$GGetCurrencyChainsDataData_currencyChains;

  static void _initializeBuilder(
          GGetCurrencyChainsDataData_currencyChainsBuilder b) =>
      b..G__typename = 'Chain';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get title;
  String? get subtitle;
  BuiltList<
          GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces?>?
      get currencyPaymentInterfaces;
  static Serializer<GGetCurrencyChainsDataData_currencyChains> get serializer =>
      _$gGetCurrencyChainsDataDataCurrencyChainsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetCurrencyChainsDataData_currencyChains.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetCurrencyChainsDataData_currencyChains? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetCurrencyChainsDataData_currencyChains.serializer,
        json,
      );
}

abstract class GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces
    implements
        Built<
            GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces,
            GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfacesBuilder> {
  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces._();

  factory GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces(
          [Function(
                  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfacesBuilder
                      b)
              updates]) =
      _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces;

  static void _initializeBuilder(
          GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfacesBuilder
              b) =>
      b..G__typename = 'CurrencyPaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  double? get minDirectDepositAmount;
  double? get directDepositFee;
  double? get minDirectDepositFee;
  double? get maxDirectDepositFee;
  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface?
      get paymentInterface;
  static Serializer<
          GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces>
      get serializer =>
          _$gGetCurrencyChainsDataDataCurrencyChainsCurrencyPaymentInterfacesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces
                .serializer,
            json,
          );
}

abstract class GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface
    implements
        Built<
            GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface,
            GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder> {
  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface._();

  factory GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface(
          [Function(
                  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder
                      b)
              updates]) =
      _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface;

  static void _initializeBuilder(
          GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder
              b) =>
      b..G__typename = 'PaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get logoUrl;
  String? get id;
  String? get title;
  String? get subtitle;
  static Serializer<
          GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface>
      get serializer =>
          _$gGetCurrencyChainsDataDataCurrencyChainsCurrencyPaymentInterfacesPaymentInterfaceSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface
                .serializer,
            json,
          );
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_deposit_wallet_payment_interface.data.gql.g.dart';

abstract class GGetDepositWalletPaymentInterfaceData
    implements
        Built<GGetDepositWalletPaymentInterfaceData,
            GGetDepositWalletPaymentInterfaceDataBuilder> {
  GGetDepositWalletPaymentInterfaceData._();

  factory GGetDepositWalletPaymentInterfaceData(
          [Function(GGetDepositWalletPaymentInterfaceDataBuilder b) updates]) =
      _$GGetDepositWalletPaymentInterfaceData;

  static void _initializeBuilder(
          GGetDepositWalletPaymentInterfaceDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetDepositWalletPaymentInterfaceData_currency? get currency;
  static Serializer<GGetDepositWalletPaymentInterfaceData> get serializer =>
      _$gGetDepositWalletPaymentInterfaceDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDepositWalletPaymentInterfaceData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDepositWalletPaymentInterfaceData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDepositWalletPaymentInterfaceData.serializer,
        json,
      );
}

abstract class GGetDepositWalletPaymentInterfaceData_currency
    implements
        Built<GGetDepositWalletPaymentInterfaceData_currency,
            GGetDepositWalletPaymentInterfaceData_currencyBuilder> {
  GGetDepositWalletPaymentInterfaceData_currency._();

  factory GGetDepositWalletPaymentInterfaceData_currency(
      [Function(GGetDepositWalletPaymentInterfaceData_currencyBuilder b)
          updates]) = _$GGetDepositWalletPaymentInterfaceData_currency;

  static void _initializeBuilder(
          GGetDepositWalletPaymentInterfaceData_currencyBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<
          GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces?>?
      get currencyPaymentInterfaces;
  static Serializer<GGetDepositWalletPaymentInterfaceData_currency>
      get serializer =>
          _$gGetDepositWalletPaymentInterfaceDataCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDepositWalletPaymentInterfaceData_currency.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDepositWalletPaymentInterfaceData_currency? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDepositWalletPaymentInterfaceData_currency.serializer,
        json,
      );
}

abstract class GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces
    implements
        Built<
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces,
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfacesBuilder> {
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces._();

  factory GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces(
          [Function(
                  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfacesBuilder
                      b)
              updates]) =
      _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces;

  static void _initializeBuilder(
          GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfacesBuilder
              b) =>
      b..G__typename = 'CurrencyPaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get userDepositEnable;
  bool? get userDirectDepositEnabled;
  bool? get enable;
  String? get id;
  double? get minDirectDepositAmount;
  String? get type;
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface?
      get paymentInterface;
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency?
      get currency;
  static Serializer<
          GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces>
      get serializer =>
          _$gGetDepositWalletPaymentInterfaceDataCurrencyCurrencyPaymentInterfacesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces
                .serializer,
            json,
          );
}

abstract class GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface
    implements
        Built<
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface,
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder> {
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface._();

  factory GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface(
          [Function(
                  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
                      b)
              updates]) =
      _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface;

  static void _initializeBuilder(
          GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
              b) =>
      b..G__typename = 'PaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get title;
  String? get logoUrl;
  String? get subtitle;
  static Serializer<
          GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface>
      get serializer =>
          _$gGetDepositWalletPaymentInterfaceDataCurrencyCurrencyPaymentInterfacesPaymentInterfaceSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface
                .serializer,
            json,
          );
}

abstract class GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency
    implements
        Built<
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency,
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder> {
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency._();

  factory GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency(
          [Function(
                  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder
                      b)
              updates]) =
      _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency;

  static void _initializeBuilder(
          GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder
              b) =>
      b..G__typename = 'AdminCurrency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get icon_url;
  static Serializer<
          GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency>
      get serializer =>
          _$gGetDepositWalletPaymentInterfaceDataCurrencyCurrencyPaymentInterfacesCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency
                .serializer,
            json,
          );
}

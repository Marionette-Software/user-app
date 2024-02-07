// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_withdraw_wallet_payment_interface.data.gql.g.dart';

abstract class GGetWithdrawWalletPaymentInterfaceData
    implements
        Built<GGetWithdrawWalletPaymentInterfaceData,
            GGetWithdrawWalletPaymentInterfaceDataBuilder> {
  GGetWithdrawWalletPaymentInterfaceData._();

  factory GGetWithdrawWalletPaymentInterfaceData(
          [Function(GGetWithdrawWalletPaymentInterfaceDataBuilder b) updates]) =
      _$GGetWithdrawWalletPaymentInterfaceData;

  static void _initializeBuilder(
          GGetWithdrawWalletPaymentInterfaceDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetWithdrawWalletPaymentInterfaceData_currency? get currency;
  static Serializer<GGetWithdrawWalletPaymentInterfaceData> get serializer =>
      _$gGetWithdrawWalletPaymentInterfaceDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetWithdrawWalletPaymentInterfaceData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetWithdrawWalletPaymentInterfaceData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetWithdrawWalletPaymentInterfaceData.serializer,
        json,
      );
}

abstract class GGetWithdrawWalletPaymentInterfaceData_currency
    implements
        Built<GGetWithdrawWalletPaymentInterfaceData_currency,
            GGetWithdrawWalletPaymentInterfaceData_currencyBuilder> {
  GGetWithdrawWalletPaymentInterfaceData_currency._();

  factory GGetWithdrawWalletPaymentInterfaceData_currency(
      [Function(GGetWithdrawWalletPaymentInterfaceData_currencyBuilder b)
          updates]) = _$GGetWithdrawWalletPaymentInterfaceData_currency;

  static void _initializeBuilder(
          GGetWithdrawWalletPaymentInterfaceData_currencyBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces?>?
      get withdrawPaymentInterfaces;
  static Serializer<GGetWithdrawWalletPaymentInterfaceData_currency>
      get serializer =>
          _$gGetWithdrawWalletPaymentInterfaceDataCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetWithdrawWalletPaymentInterfaceData_currency.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetWithdrawWalletPaymentInterfaceData_currency? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetWithdrawWalletPaymentInterfaceData_currency.serializer,
        json,
      );
}

abstract class GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces
    implements
        Built<
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces,
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfacesBuilder> {
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces._();

  factory GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces(
          [Function(
                  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfacesBuilder
                      b)
              updates]) =
      _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces;

  static void _initializeBuilder(
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfacesBuilder
              b) =>
      b..G__typename = 'WithdrawPaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get type;
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface?
      get paymentInterface;
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency?
      get currency;
  BuiltList<
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients?>?
      get recipients;
  String? get recipientSchema;
  double? get minWithdrawAmount;
  double? get maxWithdrawAmount;
  double? get withdrawFee;
  double? get minWithdrawFee;
  double? get maxWithdrawFee;
  double? get maxWithdrawAmount24h;
  double? get withdrawAmount24h;
  static Serializer<
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces>
      get serializer =>
          _$gGetWithdrawWalletPaymentInterfaceDataCurrencyWithdrawPaymentInterfacesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces
                .serializer,
            json,
          );
}

abstract class GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface
    implements
        Built<
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface,
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder> {
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface._();

  factory GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface(
          [Function(
                  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder
                      b)
              updates]) =
      _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface;

  static void _initializeBuilder(
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder
              b) =>
      b..G__typename = 'PaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get title;
  String? get logoUrl;
  String? get subtitle;
  static Serializer<
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface>
      get serializer =>
          _$gGetWithdrawWalletPaymentInterfaceDataCurrencyWithdrawPaymentInterfacesPaymentInterfaceSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface
                .serializer,
            json,
          );
}

abstract class GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency
    implements
        Built<
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency,
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder> {
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency._();

  factory GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency(
          [Function(
                  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder
                      b)
              updates]) =
      _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency;

  static void _initializeBuilder(
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder
              b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get name;
  String? get icon_url;
  static Serializer<
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency>
      get serializer =>
          _$gGetWithdrawWalletPaymentInterfaceDataCurrencyWithdrawPaymentInterfacesCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency
                .serializer,
            json,
          );
}

abstract class GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients
    implements
        Built<
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients,
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipientsBuilder> {
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients._();

  factory GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients(
          [Function(
                  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipientsBuilder
                      b)
              updates]) =
      _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients;

  static void _initializeBuilder(
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipientsBuilder
              b) =>
      b..G__typename = 'Recipient';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get data;
  String? get description;
  static Serializer<
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients>
      get serializer =>
          _$gGetWithdrawWalletPaymentInterfaceDataCurrencyWithdrawPaymentInterfacesRecipientsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients
                .serializer,
            json,
          );
}

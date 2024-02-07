// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'generate_deposti_address.data.gql.g.dart';

abstract class GGenerateDepositAddressData
    implements
        Built<GGenerateDepositAddressData, GGenerateDepositAddressDataBuilder> {
  GGenerateDepositAddressData._();

  factory GGenerateDepositAddressData(
          [Function(GGenerateDepositAddressDataBuilder b) updates]) =
      _$GGenerateDepositAddressData;

  static void _initializeBuilder(GGenerateDepositAddressDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGenerateDepositAddressData_generateWallet? get generateWallet;
  static Serializer<GGenerateDepositAddressData> get serializer =>
      _$gGenerateDepositAddressDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGenerateDepositAddressData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGenerateDepositAddressData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGenerateDepositAddressData.serializer,
        json,
      );
}

abstract class GGenerateDepositAddressData_generateWallet
    implements
        Built<GGenerateDepositAddressData_generateWallet,
            GGenerateDepositAddressData_generateWalletBuilder> {
  GGenerateDepositAddressData_generateWallet._();

  factory GGenerateDepositAddressData_generateWallet(
      [Function(GGenerateDepositAddressData_generateWalletBuilder b)
          updates]) = _$GGenerateDepositAddressData_generateWallet;

  static void _initializeBuilder(
          GGenerateDepositAddressData_generateWalletBuilder b) =>
      b..G__typename = 'Wallet';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get type;
  GGenerateDepositAddressData_generateWallet_paymentInterface?
      get paymentInterface;
  GGenerateDepositAddressData_generateWallet_currency? get currency;
  GGenerateDepositAddressData_generateWallet_deposit? get deposit;
  static Serializer<GGenerateDepositAddressData_generateWallet>
      get serializer => _$gGenerateDepositAddressDataGenerateWalletSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGenerateDepositAddressData_generateWallet.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGenerateDepositAddressData_generateWallet? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGenerateDepositAddressData_generateWallet.serializer,
        json,
      );
}

abstract class GGenerateDepositAddressData_generateWallet_paymentInterface
    implements
        Built<GGenerateDepositAddressData_generateWallet_paymentInterface,
            GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder> {
  GGenerateDepositAddressData_generateWallet_paymentInterface._();

  factory GGenerateDepositAddressData_generateWallet_paymentInterface(
      [Function(
              GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder
                  b)
          updates]) = _$GGenerateDepositAddressData_generateWallet_paymentInterface;

  static void _initializeBuilder(
          GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder
              b) =>
      b..G__typename = 'PaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get title;
  String? get logoUrl;
  String? get subtitle;
  static Serializer<GGenerateDepositAddressData_generateWallet_paymentInterface>
      get serializer =>
          _$gGenerateDepositAddressDataGenerateWalletPaymentInterfaceSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGenerateDepositAddressData_generateWallet_paymentInterface.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGenerateDepositAddressData_generateWallet_paymentInterface? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGenerateDepositAddressData_generateWallet_paymentInterface.serializer,
        json,
      );
}

abstract class GGenerateDepositAddressData_generateWallet_currency
    implements
        Built<GGenerateDepositAddressData_generateWallet_currency,
            GGenerateDepositAddressData_generateWallet_currencyBuilder> {
  GGenerateDepositAddressData_generateWallet_currency._();

  factory GGenerateDepositAddressData_generateWallet_currency(
      [Function(GGenerateDepositAddressData_generateWallet_currencyBuilder b)
          updates]) = _$GGenerateDepositAddressData_generateWallet_currency;

  static void _initializeBuilder(
          GGenerateDepositAddressData_generateWallet_currencyBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get icon_url;
  static Serializer<GGenerateDepositAddressData_generateWallet_currency>
      get serializer =>
          _$gGenerateDepositAddressDataGenerateWalletCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGenerateDepositAddressData_generateWallet_currency.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGenerateDepositAddressData_generateWallet_currency? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGenerateDepositAddressData_generateWallet_currency.serializer,
        json,
      );
}

abstract class GGenerateDepositAddressData_generateWallet_deposit
    implements
        Built<GGenerateDepositAddressData_generateWallet_deposit,
            GGenerateDepositAddressData_generateWallet_depositBuilder> {
  GGenerateDepositAddressData_generateWallet_deposit._();

  factory GGenerateDepositAddressData_generateWallet_deposit(
      [Function(GGenerateDepositAddressData_generateWallet_depositBuilder b)
          updates]) = _$GGenerateDepositAddressData_generateWallet_deposit;

  static void _initializeBuilder(
          GGenerateDepositAddressData_generateWallet_depositBuilder b) =>
      b..G__typename = 'InitialDepositData';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get address;
  String? get encodedAddress;
  String? get redirectUrl;
  double? get depositCommission;
  double? get minDepositCommission;
  double? get maxDepositCommission;
  double? get minDepositAmount;
  double? get maxDepositAmount;
  static Serializer<GGenerateDepositAddressData_generateWallet_deposit>
      get serializer =>
          _$gGenerateDepositAddressDataGenerateWalletDepositSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGenerateDepositAddressData_generateWallet_deposit.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGenerateDepositAddressData_generateWallet_deposit? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGenerateDepositAddressData_generateWallet_deposit.serializer,
        json,
      );
}

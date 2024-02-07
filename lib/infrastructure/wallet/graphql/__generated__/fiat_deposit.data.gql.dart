// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'fiat_deposit.data.gql.g.dart';

abstract class GFiatGenerateWalletData
    implements Built<GFiatGenerateWalletData, GFiatGenerateWalletDataBuilder> {
  GFiatGenerateWalletData._();

  factory GFiatGenerateWalletData(
          [Function(GFiatGenerateWalletDataBuilder b) updates]) =
      _$GFiatGenerateWalletData;

  static void _initializeBuilder(GFiatGenerateWalletDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GFiatGenerateWalletData_generateWallet? get generateWallet;
  static Serializer<GFiatGenerateWalletData> get serializer =>
      _$gFiatGenerateWalletDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFiatGenerateWalletData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFiatGenerateWalletData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFiatGenerateWalletData.serializer,
        json,
      );
}

abstract class GFiatGenerateWalletData_generateWallet
    implements
        Built<GFiatGenerateWalletData_generateWallet,
            GFiatGenerateWalletData_generateWalletBuilder> {
  GFiatGenerateWalletData_generateWallet._();

  factory GFiatGenerateWalletData_generateWallet(
          [Function(GFiatGenerateWalletData_generateWalletBuilder b) updates]) =
      _$GFiatGenerateWalletData_generateWallet;

  static void _initializeBuilder(
          GFiatGenerateWalletData_generateWalletBuilder b) =>
      b..G__typename = 'Wallet';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GFiatGenerateWalletData_generateWallet_deposit? get deposit;
  static Serializer<GFiatGenerateWalletData_generateWallet> get serializer =>
      _$gFiatGenerateWalletDataGenerateWalletSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFiatGenerateWalletData_generateWallet.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFiatGenerateWalletData_generateWallet? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFiatGenerateWalletData_generateWallet.serializer,
        json,
      );
}

abstract class GFiatGenerateWalletData_generateWallet_deposit
    implements
        Built<GFiatGenerateWalletData_generateWallet_deposit,
            GFiatGenerateWalletData_generateWallet_depositBuilder> {
  GFiatGenerateWalletData_generateWallet_deposit._();

  factory GFiatGenerateWalletData_generateWallet_deposit(
      [Function(GFiatGenerateWalletData_generateWallet_depositBuilder b)
          updates]) = _$GFiatGenerateWalletData_generateWallet_deposit;

  static void _initializeBuilder(
          GFiatGenerateWalletData_generateWallet_depositBuilder b) =>
      b..G__typename = 'InitialDepositData';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get address;
  String? get encodedAddress;
  static Serializer<GFiatGenerateWalletData_generateWallet_deposit>
      get serializer =>
          _$gFiatGenerateWalletDataGenerateWalletDepositSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFiatGenerateWalletData_generateWallet_deposit.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFiatGenerateWalletData_generateWallet_deposit? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFiatGenerateWalletData_generateWallet_deposit.serializer,
        json,
      );
}

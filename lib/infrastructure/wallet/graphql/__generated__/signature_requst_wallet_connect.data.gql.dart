// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'signature_requst_wallet_connect.data.gql.g.dart';

abstract class GsignatureRequestWalletConnectData
    implements
        Built<GsignatureRequestWalletConnectData,
            GsignatureRequestWalletConnectDataBuilder> {
  GsignatureRequestWalletConnectData._();

  factory GsignatureRequestWalletConnectData(
          [Function(GsignatureRequestWalletConnectDataBuilder b) updates]) =
      _$GsignatureRequestWalletConnectData;

  static void _initializeBuilder(GsignatureRequestWalletConnectDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GsignatureRequestWalletConnectData_connectWallet? get connectWallet;
  static Serializer<GsignatureRequestWalletConnectData> get serializer =>
      _$gsignatureRequestWalletConnectDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GsignatureRequestWalletConnectData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GsignatureRequestWalletConnectData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GsignatureRequestWalletConnectData.serializer,
        json,
      );
}

abstract class GsignatureRequestWalletConnectData_connectWallet
    implements
        Built<GsignatureRequestWalletConnectData_connectWallet,
            GsignatureRequestWalletConnectData_connectWalletBuilder> {
  GsignatureRequestWalletConnectData_connectWallet._();

  factory GsignatureRequestWalletConnectData_connectWallet(
      [Function(GsignatureRequestWalletConnectData_connectWalletBuilder b)
          updates]) = _$GsignatureRequestWalletConnectData_connectWallet;

  static void _initializeBuilder(
          GsignatureRequestWalletConnectData_connectWalletBuilder b) =>
      b..G__typename = 'Wallet';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  static Serializer<GsignatureRequestWalletConnectData_connectWallet>
      get serializer =>
          _$gsignatureRequestWalletConnectDataConnectWalletSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GsignatureRequestWalletConnectData_connectWallet.serializer,
        this,
      ) as Map<String, dynamic>);

  static GsignatureRequestWalletConnectData_connectWallet? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GsignatureRequestWalletConnectData_connectWallet.serializer,
        json,
      );
}

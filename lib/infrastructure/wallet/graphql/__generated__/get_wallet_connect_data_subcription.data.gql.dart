// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_wallet_connect_data_subcription.data.gql.g.dart';

abstract class GconnectToWalletData
    implements Built<GconnectToWalletData, GconnectToWalletDataBuilder> {
  GconnectToWalletData._();

  factory GconnectToWalletData(
          [Function(GconnectToWalletDataBuilder b) updates]) =
      _$GconnectToWalletData;

  static void _initializeBuilder(GconnectToWalletDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GconnectToWalletData_walletToConnect? get walletToConnect;
  static Serializer<GconnectToWalletData> get serializer =>
      _$gconnectToWalletDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GconnectToWalletData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GconnectToWalletData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GconnectToWalletData.serializer,
        json,
      );
}

abstract class GconnectToWalletData_walletToConnect
    implements
        Built<GconnectToWalletData_walletToConnect,
            GconnectToWalletData_walletToConnectBuilder> {
  GconnectToWalletData_walletToConnect._();

  factory GconnectToWalletData_walletToConnect(
          [Function(GconnectToWalletData_walletToConnectBuilder b) updates]) =
      _$GconnectToWalletData_walletToConnect;

  static void _initializeBuilder(
          GconnectToWalletData_walletToConnectBuilder b) =>
      b..G__typename = 'WalletConnect';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get address;
  GconnectToWalletData_walletToConnect_paymentInterface? get paymentInterface;
  String? get action;
  int? get chainId;
  static Serializer<GconnectToWalletData_walletToConnect> get serializer =>
      _$gconnectToWalletDataWalletToConnectSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GconnectToWalletData_walletToConnect.serializer,
        this,
      ) as Map<String, dynamic>);

  static GconnectToWalletData_walletToConnect? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GconnectToWalletData_walletToConnect.serializer,
        json,
      );
}

abstract class GconnectToWalletData_walletToConnect_paymentInterface
    implements
        Built<GconnectToWalletData_walletToConnect_paymentInterface,
            GconnectToWalletData_walletToConnect_paymentInterfaceBuilder> {
  GconnectToWalletData_walletToConnect_paymentInterface._();

  factory GconnectToWalletData_walletToConnect_paymentInterface(
      [Function(GconnectToWalletData_walletToConnect_paymentInterfaceBuilder b)
          updates]) = _$GconnectToWalletData_walletToConnect_paymentInterface;

  static void _initializeBuilder(
          GconnectToWalletData_walletToConnect_paymentInterfaceBuilder b) =>
      b..G__typename = 'PaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  static Serializer<GconnectToWalletData_walletToConnect_paymentInterface>
      get serializer =>
          _$gconnectToWalletDataWalletToConnectPaymentInterfaceSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GconnectToWalletData_walletToConnect_paymentInterface.serializer,
        this,
      ) as Map<String, dynamic>);

  static GconnectToWalletData_walletToConnect_paymentInterface? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GconnectToWalletData_walletToConnect_paymentInterface.serializer,
        json,
      );
}

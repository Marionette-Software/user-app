// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_withdraw_wallet_payment_interface.var.gql.g.dart';

abstract class GGetWithdrawWalletPaymentInterfaceVars
    implements
        Built<GGetWithdrawWalletPaymentInterfaceVars,
            GGetWithdrawWalletPaymentInterfaceVarsBuilder> {
  GGetWithdrawWalletPaymentInterfaceVars._();

  factory GGetWithdrawWalletPaymentInterfaceVars(
          [Function(GGetWithdrawWalletPaymentInterfaceVarsBuilder b) updates]) =
      _$GGetWithdrawWalletPaymentInterfaceVars;

  String get id;
  static Serializer<GGetWithdrawWalletPaymentInterfaceVars> get serializer =>
      _$gGetWithdrawWalletPaymentInterfaceVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetWithdrawWalletPaymentInterfaceVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetWithdrawWalletPaymentInterfaceVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetWithdrawWalletPaymentInterfaceVars.serializer,
        json,
      );
}

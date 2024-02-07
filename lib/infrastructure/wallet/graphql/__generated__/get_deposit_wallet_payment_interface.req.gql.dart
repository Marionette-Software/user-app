// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_deposit_wallet_payment_interface.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_deposit_wallet_payment_interface.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_deposit_wallet_payment_interface.var.gql.dart'
    as _i3;

part 'get_deposit_wallet_payment_interface.req.gql.g.dart';

abstract class GGetDepositWalletPaymentInterfaceReq
    implements
        Built<GGetDepositWalletPaymentInterfaceReq,
            GGetDepositWalletPaymentInterfaceReqBuilder>,
        _i1.OperationRequest<_i2.GGetDepositWalletPaymentInterfaceData,
            _i3.GGetDepositWalletPaymentInterfaceVars> {
  GGetDepositWalletPaymentInterfaceReq._();

  factory GGetDepositWalletPaymentInterfaceReq(
          [Function(GGetDepositWalletPaymentInterfaceReqBuilder b) updates]) =
      _$GGetDepositWalletPaymentInterfaceReq;

  static void _initializeBuilder(
          GGetDepositWalletPaymentInterfaceReqBuilder b) =>
      b
        ..operation = _i4.Operation(
          document: _i5.document,
          operationName: 'GetDepositWalletPaymentInterface',
        )
        ..executeOnListen = true;

  @override
  _i3.GGetDepositWalletPaymentInterfaceVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetDepositWalletPaymentInterfaceData? Function(
    _i2.GGetDepositWalletPaymentInterfaceData?,
    _i2.GGetDepositWalletPaymentInterfaceData?,
  )? get updateResult;
  @override
  _i2.GGetDepositWalletPaymentInterfaceData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetDepositWalletPaymentInterfaceData? parseData(
          Map<String, dynamic> json) =>
      _i2.GGetDepositWalletPaymentInterfaceData.fromJson(json);

  static Serializer<GGetDepositWalletPaymentInterfaceReq> get serializer =>
      _$gGetDepositWalletPaymentInterfaceReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetDepositWalletPaymentInterfaceReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDepositWalletPaymentInterfaceReq? fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetDepositWalletPaymentInterfaceReq.serializer,
        json,
      );
}

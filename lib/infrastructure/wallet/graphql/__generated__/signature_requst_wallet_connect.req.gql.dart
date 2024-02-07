// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/signature_requst_wallet_connect.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/signature_requst_wallet_connect.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/signature_requst_wallet_connect.var.gql.dart'
    as _i3;

part 'signature_requst_wallet_connect.req.gql.g.dart';

abstract class GsignatureRequestWalletConnectReq
    implements
        Built<GsignatureRequestWalletConnectReq,
            GsignatureRequestWalletConnectReqBuilder>,
        _i1.OperationRequest<_i2.GsignatureRequestWalletConnectData,
            _i3.GsignatureRequestWalletConnectVars> {
  GsignatureRequestWalletConnectReq._();

  factory GsignatureRequestWalletConnectReq(
          [Function(GsignatureRequestWalletConnectReqBuilder b) updates]) =
      _$GsignatureRequestWalletConnectReq;

  static void _initializeBuilder(GsignatureRequestWalletConnectReqBuilder b) =>
      b
        ..operation = _i4.Operation(
          document: _i5.document,
          operationName: 'signatureRequestWalletConnect',
        )
        ..executeOnListen = true;

  @override
  _i3.GsignatureRequestWalletConnectVars get vars;
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
  _i2.GsignatureRequestWalletConnectData? Function(
    _i2.GsignatureRequestWalletConnectData?,
    _i2.GsignatureRequestWalletConnectData?,
  )? get updateResult;
  @override
  _i2.GsignatureRequestWalletConnectData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GsignatureRequestWalletConnectData? parseData(
          Map<String, dynamic> json) =>
      _i2.GsignatureRequestWalletConnectData.fromJson(json);

  static Serializer<GsignatureRequestWalletConnectReq> get serializer =>
      _$gsignatureRequestWalletConnectReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GsignatureRequestWalletConnectReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GsignatureRequestWalletConnectReq? fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GsignatureRequestWalletConnectReq.serializer,
        json,
      );
}

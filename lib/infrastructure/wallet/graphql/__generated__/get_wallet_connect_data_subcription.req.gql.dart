// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_wallet_connect_data_subcription.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_wallet_connect_data_subcription.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_wallet_connect_data_subcription.var.gql.dart'
    as _i3;

part 'get_wallet_connect_data_subcription.req.gql.g.dart';

abstract class GconnectToWalletReq
    implements
        Built<GconnectToWalletReq, GconnectToWalletReqBuilder>,
        _i1.OperationRequest<_i2.GconnectToWalletData,
            _i3.GconnectToWalletVars> {
  GconnectToWalletReq._();

  factory GconnectToWalletReq(
      [Function(GconnectToWalletReqBuilder b) updates]) = _$GconnectToWalletReq;

  static void _initializeBuilder(GconnectToWalletReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'connectToWallet',
    )
    ..executeOnListen = true;

  @override
  _i3.GconnectToWalletVars get vars;
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
  _i2.GconnectToWalletData? Function(
    _i2.GconnectToWalletData?,
    _i2.GconnectToWalletData?,
  )? get updateResult;
  @override
  _i2.GconnectToWalletData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GconnectToWalletData? parseData(Map<String, dynamic> json) =>
      _i2.GconnectToWalletData.fromJson(json);

  static Serializer<GconnectToWalletReq> get serializer =>
      _$gconnectToWalletReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GconnectToWalletReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GconnectToWalletReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GconnectToWalletReq.serializer,
        json,
      );
}

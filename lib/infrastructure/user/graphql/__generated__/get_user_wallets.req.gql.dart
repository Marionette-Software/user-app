// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_wallets.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_wallets.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_wallets.var.gql.dart'
    as _i3;

part 'get_user_wallets.req.gql.g.dart';

abstract class GGetUserWalletsReq
    implements
        Built<GGetUserWalletsReq, GGetUserWalletsReqBuilder>,
        _i1.OperationRequest<_i2.GGetUserWalletsData, _i3.GGetUserWalletsVars> {
  GGetUserWalletsReq._();

  factory GGetUserWalletsReq([Function(GGetUserWalletsReqBuilder b) updates]) =
      _$GGetUserWalletsReq;

  static void _initializeBuilder(GGetUserWalletsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetUserWallets',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetUserWalletsVars get vars;
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
  _i2.GGetUserWalletsData? Function(
    _i2.GGetUserWalletsData?,
    _i2.GGetUserWalletsData?,
  )? get updateResult;
  @override
  _i2.GGetUserWalletsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetUserWalletsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetUserWalletsData.fromJson(json);

  static Serializer<GGetUserWalletsReq> get serializer =>
      _$gGetUserWalletsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetUserWalletsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserWalletsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetUserWalletsReq.serializer,
        json,
      );
}

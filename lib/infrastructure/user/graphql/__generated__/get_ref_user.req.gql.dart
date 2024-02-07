// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_ref_user.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_ref_user.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_ref_user.var.gql.dart'
    as _i3;

part 'get_ref_user.req.gql.g.dart';

abstract class GGetRefUserReq
    implements
        Built<GGetRefUserReq, GGetRefUserReqBuilder>,
        _i1.OperationRequest<_i2.GGetRefUserData, _i3.GGetRefUserVars> {
  GGetRefUserReq._();

  factory GGetRefUserReq([Function(GGetRefUserReqBuilder b) updates]) =
      _$GGetRefUserReq;

  static void _initializeBuilder(GGetRefUserReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetRefUser',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetRefUserVars get vars;
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
  _i2.GGetRefUserData? Function(
    _i2.GGetRefUserData?,
    _i2.GGetRefUserData?,
  )? get updateResult;
  @override
  _i2.GGetRefUserData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetRefUserData? parseData(Map<String, dynamic> json) =>
      _i2.GGetRefUserData.fromJson(json);

  static Serializer<GGetRefUserReq> get serializer =>
      _$gGetRefUserReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetRefUserReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetRefUserReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetRefUserReq.serializer,
        json,
      );
}

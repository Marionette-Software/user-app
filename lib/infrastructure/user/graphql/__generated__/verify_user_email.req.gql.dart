// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/user/graphql/__generated__/verify_user_email.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/user/graphql/__generated__/verify_user_email.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/user/graphql/__generated__/verify_user_email.var.gql.dart'
    as _i3;

part 'verify_user_email.req.gql.g.dart';

abstract class GVerifyEmailTokenReq
    implements
        Built<GVerifyEmailTokenReq, GVerifyEmailTokenReqBuilder>,
        _i1.OperationRequest<_i2.GVerifyEmailTokenData,
            _i3.GVerifyEmailTokenVars> {
  GVerifyEmailTokenReq._();

  factory GVerifyEmailTokenReq(
          [Function(GVerifyEmailTokenReqBuilder b) updates]) =
      _$GVerifyEmailTokenReq;

  static void _initializeBuilder(GVerifyEmailTokenReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'VerifyEmailToken',
    )
    ..executeOnListen = true;

  @override
  _i3.GVerifyEmailTokenVars get vars;
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
  _i2.GVerifyEmailTokenData? Function(
    _i2.GVerifyEmailTokenData?,
    _i2.GVerifyEmailTokenData?,
  )? get updateResult;
  @override
  _i2.GVerifyEmailTokenData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GVerifyEmailTokenData? parseData(Map<String, dynamic> json) =>
      _i2.GVerifyEmailTokenData.fromJson(json);

  static Serializer<GVerifyEmailTokenReq> get serializer =>
      _$gVerifyEmailTokenReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GVerifyEmailTokenReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GVerifyEmailTokenReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GVerifyEmailTokenReq.serializer,
        json,
      );
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/auth/sign_up/__generated__/sign_up_request.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/auth/sign_up/__generated__/sign_up_request.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/auth/sign_up/__generated__/sign_up_request.var.gql.dart'
    as _i3;

part 'sign_up_request.req.gql.g.dart';

abstract class GSignUpReq
    implements
        Built<GSignUpReq, GSignUpReqBuilder>,
        _i1.OperationRequest<_i2.GSignUpData, _i3.GSignUpVars> {
  GSignUpReq._();

  factory GSignUpReq([Function(GSignUpReqBuilder b) updates]) = _$GSignUpReq;

  static void _initializeBuilder(GSignUpReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'SignUp',
    )
    ..executeOnListen = true;

  @override
  _i3.GSignUpVars get vars;
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
  _i2.GSignUpData? Function(
    _i2.GSignUpData?,
    _i2.GSignUpData?,
  )? get updateResult;
  @override
  _i2.GSignUpData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GSignUpData? parseData(Map<String, dynamic> json) =>
      _i2.GSignUpData.fromJson(json);

  static Serializer<GSignUpReq> get serializer => _$gSignUpReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GSignUpReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSignUpReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GSignUpReq.serializer,
        json,
      );
}

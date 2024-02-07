// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/auth/google_auth/__generated__/sign_in_with_google.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/auth/google_auth/__generated__/sign_in_with_google.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/auth/google_auth/__generated__/sign_in_with_google.var.gql.dart'
    as _i3;

part 'sign_in_with_google.req.gql.g.dart';

abstract class GSignUpWithGoogleReq
    implements
        Built<GSignUpWithGoogleReq, GSignUpWithGoogleReqBuilder>,
        _i1.OperationRequest<_i2.GSignUpWithGoogleData,
            _i3.GSignUpWithGoogleVars> {
  GSignUpWithGoogleReq._();

  factory GSignUpWithGoogleReq(
          [Function(GSignUpWithGoogleReqBuilder b) updates]) =
      _$GSignUpWithGoogleReq;

  static void _initializeBuilder(GSignUpWithGoogleReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'SignUpWithGoogle',
    )
    ..executeOnListen = true;

  @override
  _i3.GSignUpWithGoogleVars get vars;
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
  _i2.GSignUpWithGoogleData? Function(
    _i2.GSignUpWithGoogleData?,
    _i2.GSignUpWithGoogleData?,
  )? get updateResult;
  @override
  _i2.GSignUpWithGoogleData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GSignUpWithGoogleData? parseData(Map<String, dynamic> json) =>
      _i2.GSignUpWithGoogleData.fromJson(json);

  static Serializer<GSignUpWithGoogleReq> get serializer =>
      _$gSignUpWithGoogleReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GSignUpWithGoogleReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSignUpWithGoogleReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GSignUpWithGoogleReq.serializer,
        json,
      );
}

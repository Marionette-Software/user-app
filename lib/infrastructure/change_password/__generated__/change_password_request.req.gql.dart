// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/change_password/__generated__/change_password_request.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/change_password/__generated__/change_password_request.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/change_password/__generated__/change_password_request.var.gql.dart'
    as _i3;

part 'change_password_request.req.gql.g.dart';

abstract class GChangeMyPasswordReq
    implements
        Built<GChangeMyPasswordReq, GChangeMyPasswordReqBuilder>,
        _i1.OperationRequest<_i2.GChangeMyPasswordData,
            _i3.GChangeMyPasswordVars> {
  GChangeMyPasswordReq._();

  factory GChangeMyPasswordReq(
          [Function(GChangeMyPasswordReqBuilder b) updates]) =
      _$GChangeMyPasswordReq;

  static void _initializeBuilder(GChangeMyPasswordReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'ChangeMyPassword',
    )
    ..executeOnListen = true;

  @override
  _i3.GChangeMyPasswordVars get vars;
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
  _i2.GChangeMyPasswordData? Function(
    _i2.GChangeMyPasswordData?,
    _i2.GChangeMyPasswordData?,
  )? get updateResult;
  @override
  _i2.GChangeMyPasswordData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GChangeMyPasswordData? parseData(Map<String, dynamic> json) =>
      _i2.GChangeMyPasswordData.fromJson(json);

  static Serializer<GChangeMyPasswordReq> get serializer =>
      _$gChangeMyPasswordReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GChangeMyPasswordReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GChangeMyPasswordReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GChangeMyPasswordReq.serializer,
        json,
      );
}

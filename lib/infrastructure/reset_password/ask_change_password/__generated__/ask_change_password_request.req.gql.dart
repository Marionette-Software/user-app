// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/reset_password/ask_change_password/__generated__/ask_change_password_request.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/reset_password/ask_change_password/__generated__/ask_change_password_request.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/reset_password/ask_change_password/__generated__/ask_change_password_request.var.gql.dart'
    as _i3;

part 'ask_change_password_request.req.gql.g.dart';

abstract class GAskChangePasswordReq
    implements
        Built<GAskChangePasswordReq, GAskChangePasswordReqBuilder>,
        _i1.OperationRequest<_i2.GAskChangePasswordData,
            _i3.GAskChangePasswordVars> {
  GAskChangePasswordReq._();

  factory GAskChangePasswordReq(
          [Function(GAskChangePasswordReqBuilder b) updates]) =
      _$GAskChangePasswordReq;

  static void _initializeBuilder(GAskChangePasswordReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'AskChangePassword',
    )
    ..executeOnListen = true;

  @override
  _i3.GAskChangePasswordVars get vars;
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
  _i2.GAskChangePasswordData? Function(
    _i2.GAskChangePasswordData?,
    _i2.GAskChangePasswordData?,
  )? get updateResult;
  @override
  _i2.GAskChangePasswordData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GAskChangePasswordData? parseData(Map<String, dynamic> json) =>
      _i2.GAskChangePasswordData.fromJson(json);

  static Serializer<GAskChangePasswordReq> get serializer =>
      _$gAskChangePasswordReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GAskChangePasswordReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAskChangePasswordReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GAskChangePasswordReq.serializer,
        json,
      );
}

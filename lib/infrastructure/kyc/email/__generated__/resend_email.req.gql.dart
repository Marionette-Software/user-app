// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/kyc/email/__generated__/resend_email.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/kyc/email/__generated__/resend_email.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/kyc/email/__generated__/resend_email.var.gql.dart'
    as _i3;

part 'resend_email.req.gql.g.dart';

abstract class GResendEmailConfirmReq
    implements
        Built<GResendEmailConfirmReq, GResendEmailConfirmReqBuilder>,
        _i1.OperationRequest<_i2.GResendEmailConfirmData,
            _i3.GResendEmailConfirmVars> {
  GResendEmailConfirmReq._();

  factory GResendEmailConfirmReq(
          [Function(GResendEmailConfirmReqBuilder b) updates]) =
      _$GResendEmailConfirmReq;

  static void _initializeBuilder(GResendEmailConfirmReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'ResendEmailConfirm',
    )
    ..executeOnListen = true;

  @override
  _i3.GResendEmailConfirmVars get vars;
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
  _i2.GResendEmailConfirmData? Function(
    _i2.GResendEmailConfirmData?,
    _i2.GResendEmailConfirmData?,
  )? get updateResult;
  @override
  _i2.GResendEmailConfirmData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GResendEmailConfirmData? parseData(Map<String, dynamic> json) =>
      _i2.GResendEmailConfirmData.fromJson(json);

  static Serializer<GResendEmailConfirmReq> get serializer =>
      _$gResendEmailConfirmReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GResendEmailConfirmReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GResendEmailConfirmReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GResendEmailConfirmReq.serializer,
        json,
      );
}

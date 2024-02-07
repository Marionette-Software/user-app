// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/user/graphql/__generated__/verify_user_phone.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/user/graphql/__generated__/verify_user_phone.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/user/graphql/__generated__/verify_user_phone.var.gql.dart'
    as _i3;

part 'verify_user_phone.req.gql.g.dart';

abstract class GVerifyUserPhoneNumberReq
    implements
        Built<GVerifyUserPhoneNumberReq, GVerifyUserPhoneNumberReqBuilder>,
        _i1.OperationRequest<_i2.GVerifyUserPhoneNumberData,
            _i3.GVerifyUserPhoneNumberVars> {
  GVerifyUserPhoneNumberReq._();

  factory GVerifyUserPhoneNumberReq(
          [Function(GVerifyUserPhoneNumberReqBuilder b) updates]) =
      _$GVerifyUserPhoneNumberReq;

  static void _initializeBuilder(GVerifyUserPhoneNumberReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'VerifyUserPhoneNumber',
    )
    ..executeOnListen = true;

  @override
  _i3.GVerifyUserPhoneNumberVars get vars;
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
  _i2.GVerifyUserPhoneNumberData? Function(
    _i2.GVerifyUserPhoneNumberData?,
    _i2.GVerifyUserPhoneNumberData?,
  )? get updateResult;
  @override
  _i2.GVerifyUserPhoneNumberData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GVerifyUserPhoneNumberData? parseData(Map<String, dynamic> json) =>
      _i2.GVerifyUserPhoneNumberData.fromJson(json);

  static Serializer<GVerifyUserPhoneNumberReq> get serializer =>
      _$gVerifyUserPhoneNumberReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GVerifyUserPhoneNumberReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GVerifyUserPhoneNumberReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GVerifyUserPhoneNumberReq.serializer,
        json,
      );
}

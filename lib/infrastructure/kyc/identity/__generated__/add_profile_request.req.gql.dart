// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/kyc/identity/__generated__/add_profile_request.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/kyc/identity/__generated__/add_profile_request.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/kyc/identity/__generated__/add_profile_request.var.gql.dart'
    as _i3;

part 'add_profile_request.req.gql.g.dart';

abstract class GAddProfileReq
    implements
        Built<GAddProfileReq, GAddProfileReqBuilder>,
        _i1.OperationRequest<_i2.GAddProfileData, _i3.GAddProfileVars> {
  GAddProfileReq._();

  factory GAddProfileReq([Function(GAddProfileReqBuilder b) updates]) =
      _$GAddProfileReq;

  static void _initializeBuilder(GAddProfileReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'AddProfile',
    )
    ..executeOnListen = true;

  @override
  _i3.GAddProfileVars get vars;
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
  _i2.GAddProfileData? Function(
    _i2.GAddProfileData?,
    _i2.GAddProfileData?,
  )? get updateResult;
  @override
  _i2.GAddProfileData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GAddProfileData? parseData(Map<String, dynamic> json) =>
      _i2.GAddProfileData.fromJson(json);

  static Serializer<GAddProfileReq> get serializer =>
      _$gAddProfileReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GAddProfileReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddProfileReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GAddProfileReq.serializer,
        json,
      );
}

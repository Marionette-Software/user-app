// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/user/graphql/__generated__/add_user_profile.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/user/graphql/__generated__/add_user_profile.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/user/graphql/__generated__/add_user_profile.var.gql.dart'
    as _i3;

part 'add_user_profile.req.gql.g.dart';

abstract class GAddUserProfileReq
    implements
        Built<GAddUserProfileReq, GAddUserProfileReqBuilder>,
        _i1.OperationRequest<_i2.GAddUserProfileData, _i3.GAddUserProfileVars> {
  GAddUserProfileReq._();

  factory GAddUserProfileReq([Function(GAddUserProfileReqBuilder b) updates]) =
      _$GAddUserProfileReq;

  static void _initializeBuilder(GAddUserProfileReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'AddUserProfile',
    )
    ..executeOnListen = true;

  @override
  _i3.GAddUserProfileVars get vars;
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
  _i2.GAddUserProfileData? Function(
    _i2.GAddUserProfileData?,
    _i2.GAddUserProfileData?,
  )? get updateResult;
  @override
  _i2.GAddUserProfileData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GAddUserProfileData? parseData(Map<String, dynamic> json) =>
      _i2.GAddUserProfileData.fromJson(json);

  static Serializer<GAddUserProfileReq> get serializer =>
      _$gAddUserProfileReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GAddUserProfileReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddUserProfileReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GAddUserProfileReq.serializer,
        json,
      );
}

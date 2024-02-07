// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.var.gql.dart'
    as _i3;

part 'get_user_history.req.gql.g.dart';

abstract class GGetUserHistoryReq
    implements
        Built<GGetUserHistoryReq, GGetUserHistoryReqBuilder>,
        _i1.OperationRequest<_i2.GGetUserHistoryData, _i3.GGetUserHistoryVars> {
  GGetUserHistoryReq._();

  factory GGetUserHistoryReq([Function(GGetUserHistoryReqBuilder b) updates]) =
      _$GGetUserHistoryReq;

  static void _initializeBuilder(GGetUserHistoryReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetUserHistory',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetUserHistoryVars get vars;
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
  _i2.GGetUserHistoryData? Function(
    _i2.GGetUserHistoryData?,
    _i2.GGetUserHistoryData?,
  )? get updateResult;
  @override
  _i2.GGetUserHistoryData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetUserHistoryData? parseData(Map<String, dynamic> json) =>
      _i2.GGetUserHistoryData.fromJson(json);

  static Serializer<GGetUserHistoryReq> get serializer =>
      _$gGetUserHistoryReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetUserHistoryReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetUserHistoryReq.serializer,
        json,
      );
}

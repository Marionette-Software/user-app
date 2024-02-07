// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_history_by_wallet.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_history_by_wallet.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_history_by_wallet.var.gql.dart'
    as _i3;

part 'get_history_by_wallet.req.gql.g.dart';

abstract class GGetUserHistoryByIdReq
    implements
        Built<GGetUserHistoryByIdReq, GGetUserHistoryByIdReqBuilder>,
        _i1.OperationRequest<_i2.GGetUserHistoryByIdData,
            _i3.GGetUserHistoryByIdVars> {
  GGetUserHistoryByIdReq._();

  factory GGetUserHistoryByIdReq(
          [Function(GGetUserHistoryByIdReqBuilder b) updates]) =
      _$GGetUserHistoryByIdReq;

  static void _initializeBuilder(GGetUserHistoryByIdReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetUserHistoryById',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetUserHistoryByIdVars get vars;
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
  _i2.GGetUserHistoryByIdData? Function(
    _i2.GGetUserHistoryByIdData?,
    _i2.GGetUserHistoryByIdData?,
  )? get updateResult;
  @override
  _i2.GGetUserHistoryByIdData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetUserHistoryByIdData? parseData(Map<String, dynamic> json) =>
      _i2.GGetUserHistoryByIdData.fromJson(json);

  static Serializer<GGetUserHistoryByIdReq> get serializer =>
      _$gGetUserHistoryByIdReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetUserHistoryByIdReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryByIdReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetUserHistoryByIdReq.serializer,
        json,
      );
}

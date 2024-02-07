// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_history.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_history.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_history.var.gql.dart'
    as _i3;

part 'public_trades_history.req.gql.g.dart';

abstract class GGetPublicTradesHistoryReq
    implements
        Built<GGetPublicTradesHistoryReq, GGetPublicTradesHistoryReqBuilder>,
        _i1.OperationRequest<_i2.GGetPublicTradesHistoryData,
            _i3.GGetPublicTradesHistoryVars> {
  GGetPublicTradesHistoryReq._();

  factory GGetPublicTradesHistoryReq(
          [Function(GGetPublicTradesHistoryReqBuilder b) updates]) =
      _$GGetPublicTradesHistoryReq;

  static void _initializeBuilder(GGetPublicTradesHistoryReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetPublicTradesHistory',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetPublicTradesHistoryVars get vars;
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
  _i2.GGetPublicTradesHistoryData? Function(
    _i2.GGetPublicTradesHistoryData?,
    _i2.GGetPublicTradesHistoryData?,
  )? get updateResult;
  @override
  _i2.GGetPublicTradesHistoryData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetPublicTradesHistoryData? parseData(Map<String, dynamic> json) =>
      _i2.GGetPublicTradesHistoryData.fromJson(json);

  static Serializer<GGetPublicTradesHistoryReq> get serializer =>
      _$gGetPublicTradesHistoryReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetPublicTradesHistoryReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetPublicTradesHistoryReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetPublicTradesHistoryReq.serializer,
        json,
      );
}

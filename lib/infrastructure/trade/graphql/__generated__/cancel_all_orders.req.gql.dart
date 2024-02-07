// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/trade/graphql/__generated__/cancel_all_orders.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/trade/graphql/__generated__/cancel_all_orders.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/trade/graphql/__generated__/cancel_all_orders.var.gql.dart'
    as _i3;

part 'cancel_all_orders.req.gql.g.dart';

abstract class GCancelAllOrdersReq
    implements
        Built<GCancelAllOrdersReq, GCancelAllOrdersReqBuilder>,
        _i1.OperationRequest<_i2.GCancelAllOrdersData,
            _i3.GCancelAllOrdersVars> {
  GCancelAllOrdersReq._();

  factory GCancelAllOrdersReq(
      [Function(GCancelAllOrdersReqBuilder b) updates]) = _$GCancelAllOrdersReq;

  static void _initializeBuilder(GCancelAllOrdersReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CancelAllOrders',
    )
    ..executeOnListen = true;

  @override
  _i3.GCancelAllOrdersVars get vars;
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
  _i2.GCancelAllOrdersData? Function(
    _i2.GCancelAllOrdersData?,
    _i2.GCancelAllOrdersData?,
  )? get updateResult;
  @override
  _i2.GCancelAllOrdersData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GCancelAllOrdersData? parseData(Map<String, dynamic> json) =>
      _i2.GCancelAllOrdersData.fromJson(json);

  static Serializer<GCancelAllOrdersReq> get serializer =>
      _$gCancelAllOrdersReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCancelAllOrdersReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCancelAllOrdersReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCancelAllOrdersReq.serializer,
        json,
      );
}

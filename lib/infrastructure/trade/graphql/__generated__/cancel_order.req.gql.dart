// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/trade/graphql/__generated__/cancel_order.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/trade/graphql/__generated__/cancel_order.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/trade/graphql/__generated__/cancel_order.var.gql.dart'
    as _i3;

part 'cancel_order.req.gql.g.dart';

abstract class GCancelOrderActionReq
    implements
        Built<GCancelOrderActionReq, GCancelOrderActionReqBuilder>,
        _i1.OperationRequest<_i2.GCancelOrderActionData,
            _i3.GCancelOrderActionVars> {
  GCancelOrderActionReq._();

  factory GCancelOrderActionReq(
          [Function(GCancelOrderActionReqBuilder b) updates]) =
      _$GCancelOrderActionReq;

  static void _initializeBuilder(GCancelOrderActionReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CancelOrderAction',
    )
    ..executeOnListen = true;

  @override
  _i3.GCancelOrderActionVars get vars;
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
  _i2.GCancelOrderActionData? Function(
    _i2.GCancelOrderActionData?,
    _i2.GCancelOrderActionData?,
  )? get updateResult;
  @override
  _i2.GCancelOrderActionData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GCancelOrderActionData? parseData(Map<String, dynamic> json) =>
      _i2.GCancelOrderActionData.fromJson(json);

  static Serializer<GCancelOrderActionReq> get serializer =>
      _$gCancelOrderActionReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCancelOrderActionReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCancelOrderActionReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCancelOrderActionReq.serializer,
        json,
      );
}

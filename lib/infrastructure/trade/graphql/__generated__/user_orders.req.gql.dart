// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_orders.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_orders.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_orders.var.gql.dart'
    as _i3;

part 'user_orders.req.gql.g.dart';

abstract class GGetUseOrdersReq
    implements
        Built<GGetUseOrdersReq, GGetUseOrdersReqBuilder>,
        _i1.OperationRequest<_i2.GGetUseOrdersData, _i3.GGetUseOrdersVars> {
  GGetUseOrdersReq._();

  factory GGetUseOrdersReq([Function(GGetUseOrdersReqBuilder b) updates]) =
      _$GGetUseOrdersReq;

  static void _initializeBuilder(GGetUseOrdersReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetUseOrders',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetUseOrdersVars get vars;
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
  _i2.GGetUseOrdersData? Function(
    _i2.GGetUseOrdersData?,
    _i2.GGetUseOrdersData?,
  )? get updateResult;
  @override
  _i2.GGetUseOrdersData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetUseOrdersData? parseData(Map<String, dynamic> json) =>
      _i2.GGetUseOrdersData.fromJson(json);

  static Serializer<GGetUseOrdersReq> get serializer =>
      _$gGetUseOrdersReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetUseOrdersReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUseOrdersReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetUseOrdersReq.serializer,
        json,
      );
}

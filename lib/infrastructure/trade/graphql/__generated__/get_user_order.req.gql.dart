// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_user_order.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_user_order.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_user_order.var.gql.dart'
    as _i3;

part 'get_user_order.req.gql.g.dart';

abstract class GGetUserOrderReq
    implements
        Built<GGetUserOrderReq, GGetUserOrderReqBuilder>,
        _i1.OperationRequest<_i2.GGetUserOrderData, _i3.GGetUserOrderVars> {
  GGetUserOrderReq._();

  factory GGetUserOrderReq([Function(GGetUserOrderReqBuilder b) updates]) =
      _$GGetUserOrderReq;

  static void _initializeBuilder(GGetUserOrderReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetUserOrder',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetUserOrderVars get vars;
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
  _i2.GGetUserOrderData? Function(
    _i2.GGetUserOrderData?,
    _i2.GGetUserOrderData?,
  )? get updateResult;
  @override
  _i2.GGetUserOrderData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetUserOrderData? parseData(Map<String, dynamic> json) =>
      _i2.GGetUserOrderData.fromJson(json);

  static Serializer<GGetUserOrderReq> get serializer =>
      _$gGetUserOrderReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetUserOrderReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserOrderReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetUserOrderReq.serializer,
        json,
      );
}

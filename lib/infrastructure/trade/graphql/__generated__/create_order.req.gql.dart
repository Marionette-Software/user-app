// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/trade/graphql/__generated__/create_order.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/trade/graphql/__generated__/create_order.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/trade/graphql/__generated__/create_order.var.gql.dart'
    as _i3;

part 'create_order.req.gql.g.dart';

abstract class GCreateOrderReq
    implements
        Built<GCreateOrderReq, GCreateOrderReqBuilder>,
        _i1.OperationRequest<_i2.GCreateOrderData, _i3.GCreateOrderVars> {
  GCreateOrderReq._();

  factory GCreateOrderReq([Function(GCreateOrderReqBuilder b) updates]) =
      _$GCreateOrderReq;

  static void _initializeBuilder(GCreateOrderReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CreateOrder',
    )
    ..executeOnListen = true;

  @override
  _i3.GCreateOrderVars get vars;
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
  _i2.GCreateOrderData? Function(
    _i2.GCreateOrderData?,
    _i2.GCreateOrderData?,
  )? get updateResult;
  @override
  _i2.GCreateOrderData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GCreateOrderData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateOrderData.fromJson(json);

  static Serializer<GCreateOrderReq> get serializer =>
      _$gCreateOrderReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCreateOrderReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateOrderReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCreateOrderReq.serializer,
        json,
      );
}

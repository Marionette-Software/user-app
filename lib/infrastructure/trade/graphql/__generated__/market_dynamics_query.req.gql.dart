// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_dynamics_query.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_dynamics_query.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_dynamics_query.var.gql.dart'
    as _i3;

part 'market_dynamics_query.req.gql.g.dart';

abstract class GGetMarketDynamicsReq
    implements
        Built<GGetMarketDynamicsReq, GGetMarketDynamicsReqBuilder>,
        _i1.OperationRequest<_i2.GGetMarketDynamicsData,
            _i3.GGetMarketDynamicsVars> {
  GGetMarketDynamicsReq._();

  factory GGetMarketDynamicsReq(
          [Function(GGetMarketDynamicsReqBuilder b) updates]) =
      _$GGetMarketDynamicsReq;

  static void _initializeBuilder(GGetMarketDynamicsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetMarketDynamics',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetMarketDynamicsVars get vars;
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
  _i2.GGetMarketDynamicsData? Function(
    _i2.GGetMarketDynamicsData?,
    _i2.GGetMarketDynamicsData?,
  )? get updateResult;
  @override
  _i2.GGetMarketDynamicsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetMarketDynamicsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetMarketDynamicsData.fromJson(json);

  static Serializer<GGetMarketDynamicsReq> get serializer =>
      _$gGetMarketDynamicsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetMarketDynamicsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketDynamicsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetMarketDynamicsReq.serializer,
        json,
      );
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/trade/graphql/market_dynamics/__generated__/market_dynamics_subscription.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/trade/graphql/market_dynamics/__generated__/market_dynamics_subscription.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/trade/graphql/market_dynamics/__generated__/market_dynamics_subscription.var.gql.dart'
    as _i3;

part 'market_dynamics_subscription.req.gql.g.dart';

abstract class GMarketDynamicsReq
    implements
        Built<GMarketDynamicsReq, GMarketDynamicsReqBuilder>,
        _i1.OperationRequest<_i2.GMarketDynamicsData, _i3.GMarketDynamicsVars> {
  GMarketDynamicsReq._();

  factory GMarketDynamicsReq([Function(GMarketDynamicsReqBuilder b) updates]) =
      _$GMarketDynamicsReq;

  static void _initializeBuilder(GMarketDynamicsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'MarketDynamics',
    )
    ..executeOnListen = true;

  @override
  _i3.GMarketDynamicsVars get vars;
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
  _i2.GMarketDynamicsData? Function(
    _i2.GMarketDynamicsData?,
    _i2.GMarketDynamicsData?,
  )? get updateResult;
  @override
  _i2.GMarketDynamicsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GMarketDynamicsData? parseData(Map<String, dynamic> json) =>
      _i2.GMarketDynamicsData.fromJson(json);

  static Serializer<GMarketDynamicsReq> get serializer =>
      _$gMarketDynamicsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GMarketDynamicsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMarketDynamicsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GMarketDynamicsReq.serializer,
        json,
      );
}

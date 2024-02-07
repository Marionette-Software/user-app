// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_rate_subscription.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_rate_subscription.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_rate_subscription.var.gql.dart'
    as _i3;

part 'market_rate_subscription.req.gql.g.dart';

abstract class GMarketRateReq
    implements
        Built<GMarketRateReq, GMarketRateReqBuilder>,
        _i1.OperationRequest<_i2.GMarketRateData, _i3.GMarketRateVars> {
  GMarketRateReq._();

  factory GMarketRateReq([Function(GMarketRateReqBuilder b) updates]) =
      _$GMarketRateReq;

  static void _initializeBuilder(GMarketRateReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'MarketRate',
    )
    ..executeOnListen = true;

  @override
  _i3.GMarketRateVars get vars;
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
  _i2.GMarketRateData? Function(
    _i2.GMarketRateData?,
    _i2.GMarketRateData?,
  )? get updateResult;
  @override
  _i2.GMarketRateData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GMarketRateData? parseData(Map<String, dynamic> json) =>
      _i2.GMarketRateData.fromJson(json);

  static Serializer<GMarketRateReq> get serializer =>
      _$gMarketRateReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GMarketRateReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMarketRateReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GMarketRateReq.serializer,
        json,
      );
}

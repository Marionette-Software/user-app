// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_market_rate.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_market_rate.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_market_rate.var.gql.dart'
    as _i3;

part 'get_market_rate.req.gql.g.dart';

abstract class GGetMarketRateReq
    implements
        Built<GGetMarketRateReq, GGetMarketRateReqBuilder>,
        _i1.OperationRequest<_i2.GGetMarketRateData, _i3.GGetMarketRateVars> {
  GGetMarketRateReq._();

  factory GGetMarketRateReq([Function(GGetMarketRateReqBuilder b) updates]) =
      _$GGetMarketRateReq;

  static void _initializeBuilder(GGetMarketRateReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetMarketRate',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetMarketRateVars get vars;
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
  _i2.GGetMarketRateData? Function(
    _i2.GGetMarketRateData?,
    _i2.GGetMarketRateData?,
  )? get updateResult;
  @override
  _i2.GGetMarketRateData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetMarketRateData? parseData(Map<String, dynamic> json) =>
      _i2.GGetMarketRateData.fromJson(json);

  static Serializer<GGetMarketRateReq> get serializer =>
      _$gGetMarketRateReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetMarketRateReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketRateReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetMarketRateReq.serializer,
        json,
      );
}

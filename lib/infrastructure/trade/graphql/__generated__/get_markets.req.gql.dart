// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_markets.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_markets.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_markets.var.gql.dart'
    as _i3;

part 'get_markets.req.gql.g.dart';

abstract class GGetMarketsReq
    implements
        Built<GGetMarketsReq, GGetMarketsReqBuilder>,
        _i1.OperationRequest<_i2.GGetMarketsData, _i3.GGetMarketsVars> {
  GGetMarketsReq._();

  factory GGetMarketsReq([Function(GGetMarketsReqBuilder b) updates]) =
      _$GGetMarketsReq;

  static void _initializeBuilder(GGetMarketsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetMarkets',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetMarketsVars get vars;
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
  _i2.GGetMarketsData? Function(
    _i2.GGetMarketsData?,
    _i2.GGetMarketsData?,
  )? get updateResult;
  @override
  _i2.GGetMarketsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetMarketsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetMarketsData.fromJson(json);

  static Serializer<GGetMarketsReq> get serializer =>
      _$gGetMarketsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetMarketsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetMarketsReq.serializer,
        json,
      );
}

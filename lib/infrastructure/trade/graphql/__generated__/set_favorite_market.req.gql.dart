// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/trade/graphql/__generated__/set_favorite_market.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/trade/graphql/__generated__/set_favorite_market.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/trade/graphql/__generated__/set_favorite_market.var.gql.dart'
    as _i3;

part 'set_favorite_market.req.gql.g.dart';

abstract class GsetFavoriteMarketReq
    implements
        Built<GsetFavoriteMarketReq, GsetFavoriteMarketReqBuilder>,
        _i1.OperationRequest<_i2.GsetFavoriteMarketData,
            _i3.GsetFavoriteMarketVars> {
  GsetFavoriteMarketReq._();

  factory GsetFavoriteMarketReq(
          [Function(GsetFavoriteMarketReqBuilder b) updates]) =
      _$GsetFavoriteMarketReq;

  static void _initializeBuilder(GsetFavoriteMarketReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'setFavoriteMarket',
    )
    ..executeOnListen = true;

  @override
  _i3.GsetFavoriteMarketVars get vars;
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
  _i2.GsetFavoriteMarketData? Function(
    _i2.GsetFavoriteMarketData?,
    _i2.GsetFavoriteMarketData?,
  )? get updateResult;
  @override
  _i2.GsetFavoriteMarketData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GsetFavoriteMarketData? parseData(Map<String, dynamic> json) =>
      _i2.GsetFavoriteMarketData.fromJson(json);

  static Serializer<GsetFavoriteMarketReq> get serializer =>
      _$gsetFavoriteMarketReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GsetFavoriteMarketReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GsetFavoriteMarketReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GsetFavoriteMarketReq.serializer,
        json,
      );
}

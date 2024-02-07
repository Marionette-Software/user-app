// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/full_orderbook_subscription.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/full_orderbook_subscription.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/full_orderbook_subscription.var.gql.dart'
    as _i3;

part 'full_orderbook_subscription.req.gql.g.dart';

abstract class GPublicFullOrderBookSubscriptionReq
    implements
        Built<GPublicFullOrderBookSubscriptionReq,
            GPublicFullOrderBookSubscriptionReqBuilder>,
        _i1.OperationRequest<_i2.GPublicFullOrderBookSubscriptionData,
            _i3.GPublicFullOrderBookSubscriptionVars> {
  GPublicFullOrderBookSubscriptionReq._();

  factory GPublicFullOrderBookSubscriptionReq(
          [Function(GPublicFullOrderBookSubscriptionReqBuilder b) updates]) =
      _$GPublicFullOrderBookSubscriptionReq;

  static void _initializeBuilder(
          GPublicFullOrderBookSubscriptionReqBuilder b) =>
      b
        ..operation = _i4.Operation(
          document: _i5.document,
          operationName: 'PublicFullOrderBookSubscription',
        )
        ..executeOnListen = true;

  @override
  _i3.GPublicFullOrderBookSubscriptionVars get vars;
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
  _i2.GPublicFullOrderBookSubscriptionData? Function(
    _i2.GPublicFullOrderBookSubscriptionData?,
    _i2.GPublicFullOrderBookSubscriptionData?,
  )? get updateResult;
  @override
  _i2.GPublicFullOrderBookSubscriptionData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GPublicFullOrderBookSubscriptionData? parseData(
          Map<String, dynamic> json) =>
      _i2.GPublicFullOrderBookSubscriptionData.fromJson(json);

  static Serializer<GPublicFullOrderBookSubscriptionReq> get serializer =>
      _$gPublicFullOrderBookSubscriptionReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GPublicFullOrderBookSubscriptionReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicFullOrderBookSubscriptionReq? fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GPublicFullOrderBookSubscriptionReq.serializer,
        json,
      );
}

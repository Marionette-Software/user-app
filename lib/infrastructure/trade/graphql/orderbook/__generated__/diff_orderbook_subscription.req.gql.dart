// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/diff_orderbook_subscription.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/diff_orderbook_subscription.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/diff_orderbook_subscription.var.gql.dart'
    as _i3;

part 'diff_orderbook_subscription.req.gql.g.dart';

abstract class GPublicDiffOrderBookSubscriptionReq
    implements
        Built<GPublicDiffOrderBookSubscriptionReq,
            GPublicDiffOrderBookSubscriptionReqBuilder>,
        _i1.OperationRequest<_i2.GPublicDiffOrderBookSubscriptionData,
            _i3.GPublicDiffOrderBookSubscriptionVars> {
  GPublicDiffOrderBookSubscriptionReq._();

  factory GPublicDiffOrderBookSubscriptionReq(
          [Function(GPublicDiffOrderBookSubscriptionReqBuilder b) updates]) =
      _$GPublicDiffOrderBookSubscriptionReq;

  static void _initializeBuilder(
          GPublicDiffOrderBookSubscriptionReqBuilder b) =>
      b
        ..operation = _i4.Operation(
          document: _i5.document,
          operationName: 'PublicDiffOrderBookSubscription',
        )
        ..executeOnListen = true;

  @override
  _i3.GPublicDiffOrderBookSubscriptionVars get vars;
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
  _i2.GPublicDiffOrderBookSubscriptionData? Function(
    _i2.GPublicDiffOrderBookSubscriptionData?,
    _i2.GPublicDiffOrderBookSubscriptionData?,
  )? get updateResult;
  @override
  _i2.GPublicDiffOrderBookSubscriptionData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GPublicDiffOrderBookSubscriptionData? parseData(
          Map<String, dynamic> json) =>
      _i2.GPublicDiffOrderBookSubscriptionData.fromJson(json);

  static Serializer<GPublicDiffOrderBookSubscriptionReq> get serializer =>
      _$gPublicDiffOrderBookSubscriptionReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GPublicDiffOrderBookSubscriptionReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicDiffOrderBookSubscriptionReq? fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GPublicDiffOrderBookSubscriptionReq.serializer,
        json,
      );
}

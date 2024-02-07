// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_subscription.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_subscription.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_subscription.var.gql.dart'
    as _i3;

part 'public_trades_subscription.req.gql.g.dart';

abstract class GPublicTradesSubscriptionReq
    implements
        Built<GPublicTradesSubscriptionReq,
            GPublicTradesSubscriptionReqBuilder>,
        _i1.OperationRequest<_i2.GPublicTradesSubscriptionData,
            _i3.GPublicTradesSubscriptionVars> {
  GPublicTradesSubscriptionReq._();

  factory GPublicTradesSubscriptionReq(
          [Function(GPublicTradesSubscriptionReqBuilder b) updates]) =
      _$GPublicTradesSubscriptionReq;

  static void _initializeBuilder(GPublicTradesSubscriptionReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'PublicTradesSubscription',
    )
    ..executeOnListen = true;

  @override
  _i3.GPublicTradesSubscriptionVars get vars;
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
  _i2.GPublicTradesSubscriptionData? Function(
    _i2.GPublicTradesSubscriptionData?,
    _i2.GPublicTradesSubscriptionData?,
  )? get updateResult;
  @override
  _i2.GPublicTradesSubscriptionData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GPublicTradesSubscriptionData? parseData(Map<String, dynamic> json) =>
      _i2.GPublicTradesSubscriptionData.fromJson(json);

  static Serializer<GPublicTradesSubscriptionReq> get serializer =>
      _$gPublicTradesSubscriptionReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GPublicTradesSubscriptionReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicTradesSubscriptionReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GPublicTradesSubscriptionReq.serializer,
        json,
      );
}

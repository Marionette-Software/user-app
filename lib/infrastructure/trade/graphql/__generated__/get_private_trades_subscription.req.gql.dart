// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_private_trades_subscription.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_private_trades_subscription.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_private_trades_subscription.var.gql.dart'
    as _i3;

part 'get_private_trades_subscription.req.gql.g.dart';

abstract class GGetPrivateTradesReq
    implements
        Built<GGetPrivateTradesReq, GGetPrivateTradesReqBuilder>,
        _i1.OperationRequest<_i2.GGetPrivateTradesData,
            _i3.GGetPrivateTradesVars> {
  GGetPrivateTradesReq._();

  factory GGetPrivateTradesReq(
          [Function(GGetPrivateTradesReqBuilder b) updates]) =
      _$GGetPrivateTradesReq;

  static void _initializeBuilder(GGetPrivateTradesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetPrivateTrades',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetPrivateTradesVars get vars;
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
  _i2.GGetPrivateTradesData? Function(
    _i2.GGetPrivateTradesData?,
    _i2.GGetPrivateTradesData?,
  )? get updateResult;
  @override
  _i2.GGetPrivateTradesData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetPrivateTradesData? parseData(Map<String, dynamic> json) =>
      _i2.GGetPrivateTradesData.fromJson(json);

  static Serializer<GGetPrivateTradesReq> get serializer =>
      _$gGetPrivateTradesReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetPrivateTradesReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetPrivateTradesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetPrivateTradesReq.serializer,
        json,
      );
}

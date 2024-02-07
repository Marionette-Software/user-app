// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_balance_update_subscription.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_balance_update_subscription.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_balance_update_subscription.var.gql.dart'
    as _i3;

part 'user_balance_update_subscription.req.gql.g.dart';

abstract class GGetUserBalanceUpdatedReq
    implements
        Built<GGetUserBalanceUpdatedReq, GGetUserBalanceUpdatedReqBuilder>,
        _i1.OperationRequest<_i2.GGetUserBalanceUpdatedData,
            _i3.GGetUserBalanceUpdatedVars> {
  GGetUserBalanceUpdatedReq._();

  factory GGetUserBalanceUpdatedReq(
          [Function(GGetUserBalanceUpdatedReqBuilder b) updates]) =
      _$GGetUserBalanceUpdatedReq;

  static void _initializeBuilder(GGetUserBalanceUpdatedReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetUserBalanceUpdated',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetUserBalanceUpdatedVars get vars;
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
  _i2.GGetUserBalanceUpdatedData? Function(
    _i2.GGetUserBalanceUpdatedData?,
    _i2.GGetUserBalanceUpdatedData?,
  )? get updateResult;
  @override
  _i2.GGetUserBalanceUpdatedData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetUserBalanceUpdatedData? parseData(Map<String, dynamic> json) =>
      _i2.GGetUserBalanceUpdatedData.fromJson(json);

  static Serializer<GGetUserBalanceUpdatedReq> get serializer =>
      _$gGetUserBalanceUpdatedReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetUserBalanceUpdatedReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserBalanceUpdatedReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetUserBalanceUpdatedReq.serializer,
        json,
      );
}

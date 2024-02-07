// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_balances_subscription.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_balances_subscription.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_balances_subscription.var.gql.dart'
    as _i3;

part 'user_balances_subscription.req.gql.g.dart';

abstract class GUserBalancesReq
    implements
        Built<GUserBalancesReq, GUserBalancesReqBuilder>,
        _i1.OperationRequest<_i2.GUserBalancesData, _i3.GUserBalancesVars> {
  GUserBalancesReq._();

  factory GUserBalancesReq([Function(GUserBalancesReqBuilder b) updates]) =
      _$GUserBalancesReq;

  static void _initializeBuilder(GUserBalancesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'UserBalances',
    )
    ..executeOnListen = true;

  @override
  _i3.GUserBalancesVars get vars;
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
  _i2.GUserBalancesData? Function(
    _i2.GUserBalancesData?,
    _i2.GUserBalancesData?,
  )? get updateResult;
  @override
  _i2.GUserBalancesData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GUserBalancesData? parseData(Map<String, dynamic> json) =>
      _i2.GUserBalancesData.fromJson(json);

  static Serializer<GUserBalancesReq> get serializer =>
      _$gUserBalancesReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUserBalancesReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserBalancesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUserBalancesReq.serializer,
        json,
      );
}

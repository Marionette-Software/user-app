// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_user_balances.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_user_balances.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_user_balances.var.gql.dart'
    as _i3;

part 'get_user_balances.req.gql.g.dart';

abstract class GGetUserBalancesReq
    implements
        Built<GGetUserBalancesReq, GGetUserBalancesReqBuilder>,
        _i1.OperationRequest<_i2.GGetUserBalancesData,
            _i3.GGetUserBalancesVars> {
  GGetUserBalancesReq._();

  factory GGetUserBalancesReq(
      [Function(GGetUserBalancesReqBuilder b) updates]) = _$GGetUserBalancesReq;

  static void _initializeBuilder(GGetUserBalancesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetUserBalances',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetUserBalancesVars get vars;
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
  _i2.GGetUserBalancesData? Function(
    _i2.GGetUserBalancesData?,
    _i2.GGetUserBalancesData?,
  )? get updateResult;
  @override
  _i2.GGetUserBalancesData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetUserBalancesData? parseData(Map<String, dynamic> json) =>
      _i2.GGetUserBalancesData.fromJson(json);

  static Serializer<GGetUserBalancesReq> get serializer =>
      _$gGetUserBalancesReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetUserBalancesReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserBalancesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetUserBalancesReq.serializer,
        json,
      );
}

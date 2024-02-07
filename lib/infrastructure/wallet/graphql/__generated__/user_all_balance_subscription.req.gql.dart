// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_all_balance_subscription.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_all_balance_subscription.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_all_balance_subscription.var.gql.dart'
    as _i3;

part 'user_all_balance_subscription.req.gql.g.dart';

abstract class GUserAllBalanceReq
    implements
        Built<GUserAllBalanceReq, GUserAllBalanceReqBuilder>,
        _i1.OperationRequest<_i2.GUserAllBalanceData, _i3.GUserAllBalanceVars> {
  GUserAllBalanceReq._();

  factory GUserAllBalanceReq([Function(GUserAllBalanceReqBuilder b) updates]) =
      _$GUserAllBalanceReq;

  static void _initializeBuilder(GUserAllBalanceReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'UserAllBalance',
    )
    ..executeOnListen = true;

  @override
  _i3.GUserAllBalanceVars get vars;
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
  _i2.GUserAllBalanceData? Function(
    _i2.GUserAllBalanceData?,
    _i2.GUserAllBalanceData?,
  )? get updateResult;
  @override
  _i2.GUserAllBalanceData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GUserAllBalanceData? parseData(Map<String, dynamic> json) =>
      _i2.GUserAllBalanceData.fromJson(json);

  static Serializer<GUserAllBalanceReq> get serializer =>
      _$gUserAllBalanceReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUserAllBalanceReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserAllBalanceReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUserAllBalanceReq.serializer,
        json,
      );
}

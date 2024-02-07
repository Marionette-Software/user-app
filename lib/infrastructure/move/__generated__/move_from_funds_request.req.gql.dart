// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/move/__generated__/move_from_funds_request.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/move/__generated__/move_from_funds_request.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/move/__generated__/move_from_funds_request.var.gql.dart'
    as _i3;

part 'move_from_funds_request.req.gql.g.dart';

abstract class GMoveFromAdvancedTradingFundsReq
    implements
        Built<GMoveFromAdvancedTradingFundsReq,
            GMoveFromAdvancedTradingFundsReqBuilder>,
        _i1.OperationRequest<_i2.GMoveFromAdvancedTradingFundsData,
            _i3.GMoveFromAdvancedTradingFundsVars> {
  GMoveFromAdvancedTradingFundsReq._();

  factory GMoveFromAdvancedTradingFundsReq(
          [Function(GMoveFromAdvancedTradingFundsReqBuilder b) updates]) =
      _$GMoveFromAdvancedTradingFundsReq;

  static void _initializeBuilder(GMoveFromAdvancedTradingFundsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'MoveFromAdvancedTradingFunds',
    )
    ..executeOnListen = true;

  @override
  _i3.GMoveFromAdvancedTradingFundsVars get vars;
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
  _i2.GMoveFromAdvancedTradingFundsData? Function(
    _i2.GMoveFromAdvancedTradingFundsData?,
    _i2.GMoveFromAdvancedTradingFundsData?,
  )? get updateResult;
  @override
  _i2.GMoveFromAdvancedTradingFundsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GMoveFromAdvancedTradingFundsData? parseData(Map<String, dynamic> json) =>
      _i2.GMoveFromAdvancedTradingFundsData.fromJson(json);

  static Serializer<GMoveFromAdvancedTradingFundsReq> get serializer =>
      _$gMoveFromAdvancedTradingFundsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GMoveFromAdvancedTradingFundsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMoveFromAdvancedTradingFundsReq? fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GMoveFromAdvancedTradingFundsReq.serializer,
        json,
      );
}

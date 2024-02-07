// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/cancel_stake.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/cancel_stake.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/cancel_stake.var.gql.dart'
    as _i3;

part 'cancel_stake.req.gql.g.dart';

abstract class GCancelCurrencyStateReq
    implements
        Built<GCancelCurrencyStateReq, GCancelCurrencyStateReqBuilder>,
        _i1.OperationRequest<_i2.GCancelCurrencyStateData,
            _i3.GCancelCurrencyStateVars> {
  GCancelCurrencyStateReq._();

  factory GCancelCurrencyStateReq(
          [Function(GCancelCurrencyStateReqBuilder b) updates]) =
      _$GCancelCurrencyStateReq;

  static void _initializeBuilder(GCancelCurrencyStateReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CancelCurrencyState',
    )
    ..executeOnListen = true;

  @override
  _i3.GCancelCurrencyStateVars get vars;
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
  _i2.GCancelCurrencyStateData? Function(
    _i2.GCancelCurrencyStateData?,
    _i2.GCancelCurrencyStateData?,
  )? get updateResult;
  @override
  _i2.GCancelCurrencyStateData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GCancelCurrencyStateData? parseData(Map<String, dynamic> json) =>
      _i2.GCancelCurrencyStateData.fromJson(json);

  static Serializer<GCancelCurrencyStateReq> get serializer =>
      _$gCancelCurrencyStateReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCancelCurrencyStateReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCancelCurrencyStateReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCancelCurrencyStateReq.serializer,
        json,
      );
}

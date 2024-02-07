// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_currency_chains_by_id.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_currency_chains_by_id.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_currency_chains_by_id.var.gql.dart'
    as _i3;

part 'get_currency_chains_by_id.req.gql.g.dart';

abstract class GGetCurrencyChainsDataReq
    implements
        Built<GGetCurrencyChainsDataReq, GGetCurrencyChainsDataReqBuilder>,
        _i1.OperationRequest<_i2.GGetCurrencyChainsDataData,
            _i3.GGetCurrencyChainsDataVars> {
  GGetCurrencyChainsDataReq._();

  factory GGetCurrencyChainsDataReq(
          [Function(GGetCurrencyChainsDataReqBuilder b) updates]) =
      _$GGetCurrencyChainsDataReq;

  static void _initializeBuilder(GGetCurrencyChainsDataReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetCurrencyChainsData',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetCurrencyChainsDataVars get vars;
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
  _i2.GGetCurrencyChainsDataData? Function(
    _i2.GGetCurrencyChainsDataData?,
    _i2.GGetCurrencyChainsDataData?,
  )? get updateResult;
  @override
  _i2.GGetCurrencyChainsDataData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetCurrencyChainsDataData? parseData(Map<String, dynamic> json) =>
      _i2.GGetCurrencyChainsDataData.fromJson(json);

  static Serializer<GGetCurrencyChainsDataReq> get serializer =>
      _$gGetCurrencyChainsDataReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetCurrencyChainsDataReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetCurrencyChainsDataReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetCurrencyChainsDataReq.serializer,
        json,
      );
}

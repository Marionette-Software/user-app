// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/get_currencies.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/get_currencies.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/get_currencies.var.gql.dart'
    as _i3;

part 'get_currencies.req.gql.g.dart';

abstract class GGetNonCustodialCurrenciesReq
    implements
        Built<GGetNonCustodialCurrenciesReq,
            GGetNonCustodialCurrenciesReqBuilder>,
        _i1.OperationRequest<_i2.GGetNonCustodialCurrenciesData,
            _i3.GGetNonCustodialCurrenciesVars> {
  GGetNonCustodialCurrenciesReq._();

  factory GGetNonCustodialCurrenciesReq(
          [Function(GGetNonCustodialCurrenciesReqBuilder b) updates]) =
      _$GGetNonCustodialCurrenciesReq;

  static void _initializeBuilder(GGetNonCustodialCurrenciesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetNonCustodialCurrencies',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetNonCustodialCurrenciesVars get vars;
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
  _i2.GGetNonCustodialCurrenciesData? Function(
    _i2.GGetNonCustodialCurrenciesData?,
    _i2.GGetNonCustodialCurrenciesData?,
  )? get updateResult;
  @override
  _i2.GGetNonCustodialCurrenciesData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetNonCustodialCurrenciesData? parseData(Map<String, dynamic> json) =>
      _i2.GGetNonCustodialCurrenciesData.fromJson(json);

  static Serializer<GGetNonCustodialCurrenciesReq> get serializer =>
      _$gGetNonCustodialCurrenciesReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetNonCustodialCurrenciesReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetNonCustodialCurrenciesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetNonCustodialCurrenciesReq.serializer,
        json,
      );
}

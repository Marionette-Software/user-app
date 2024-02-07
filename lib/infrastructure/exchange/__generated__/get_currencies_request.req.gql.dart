// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/exchange/__generated__/get_currencies_request.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/exchange/__generated__/get_currencies_request.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/exchange/__generated__/get_currencies_request.var.gql.dart'
    as _i3;

part 'get_currencies_request.req.gql.g.dart';

abstract class GGetCurrenciesReq
    implements
        Built<GGetCurrenciesReq, GGetCurrenciesReqBuilder>,
        _i1.OperationRequest<_i2.GGetCurrenciesData, _i3.GGetCurrenciesVars> {
  GGetCurrenciesReq._();

  factory GGetCurrenciesReq([Function(GGetCurrenciesReqBuilder b) updates]) =
      _$GGetCurrenciesReq;

  static void _initializeBuilder(GGetCurrenciesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetCurrencies',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetCurrenciesVars get vars;
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
  _i2.GGetCurrenciesData? Function(
    _i2.GGetCurrenciesData?,
    _i2.GGetCurrenciesData?,
  )? get updateResult;
  @override
  _i2.GGetCurrenciesData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetCurrenciesData? parseData(Map<String, dynamic> json) =>
      _i2.GGetCurrenciesData.fromJson(json);

  static Serializer<GGetCurrenciesReq> get serializer =>
      _$gGetCurrenciesReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetCurrenciesReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetCurrenciesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetCurrenciesReq.serializer,
        json,
      );
}

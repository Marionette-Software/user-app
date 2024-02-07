// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_currency_for_filter_history.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_currency_for_filter_history.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_currency_for_filter_history.var.gql.dart'
    as _i3;

part 'get_currency_for_filter_history.req.gql.g.dart';

abstract class GGetCurrencyForFilterHistoryReq
    implements
        Built<GGetCurrencyForFilterHistoryReq,
            GGetCurrencyForFilterHistoryReqBuilder>,
        _i1.OperationRequest<_i2.GGetCurrencyForFilterHistoryData,
            _i3.GGetCurrencyForFilterHistoryVars> {
  GGetCurrencyForFilterHistoryReq._();

  factory GGetCurrencyForFilterHistoryReq(
          [Function(GGetCurrencyForFilterHistoryReqBuilder b) updates]) =
      _$GGetCurrencyForFilterHistoryReq;

  static void _initializeBuilder(GGetCurrencyForFilterHistoryReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetCurrencyForFilterHistory',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetCurrencyForFilterHistoryVars get vars;
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
  _i2.GGetCurrencyForFilterHistoryData? Function(
    _i2.GGetCurrencyForFilterHistoryData?,
    _i2.GGetCurrencyForFilterHistoryData?,
  )? get updateResult;
  @override
  _i2.GGetCurrencyForFilterHistoryData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetCurrencyForFilterHistoryData? parseData(Map<String, dynamic> json) =>
      _i2.GGetCurrencyForFilterHistoryData.fromJson(json);

  static Serializer<GGetCurrencyForFilterHistoryReq> get serializer =>
      _$gGetCurrencyForFilterHistoryReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetCurrencyForFilterHistoryReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetCurrencyForFilterHistoryReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetCurrencyForFilterHistoryReq.serializer,
        json,
      );
}

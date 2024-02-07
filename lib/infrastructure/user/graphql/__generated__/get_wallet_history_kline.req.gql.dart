// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_wallet_history_kline.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_wallet_history_kline.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_wallet_history_kline.var.gql.dart'
    as _i3;

part 'get_wallet_history_kline.req.gql.g.dart';

abstract class GWalletHistoryKlineReq
    implements
        Built<GWalletHistoryKlineReq, GWalletHistoryKlineReqBuilder>,
        _i1.OperationRequest<_i2.GWalletHistoryKlineData,
            _i3.GWalletHistoryKlineVars> {
  GWalletHistoryKlineReq._();

  factory GWalletHistoryKlineReq(
          [Function(GWalletHistoryKlineReqBuilder b) updates]) =
      _$GWalletHistoryKlineReq;

  static void _initializeBuilder(GWalletHistoryKlineReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'WalletHistoryKline',
    )
    ..executeOnListen = true;

  @override
  _i3.GWalletHistoryKlineVars get vars;
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
  _i2.GWalletHistoryKlineData? Function(
    _i2.GWalletHistoryKlineData?,
    _i2.GWalletHistoryKlineData?,
  )? get updateResult;
  @override
  _i2.GWalletHistoryKlineData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GWalletHistoryKlineData? parseData(Map<String, dynamic> json) =>
      _i2.GWalletHistoryKlineData.fromJson(json);

  static Serializer<GWalletHistoryKlineReq> get serializer =>
      _$gWalletHistoryKlineReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GWalletHistoryKlineReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWalletHistoryKlineReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GWalletHistoryKlineReq.serializer,
        json,
      );
}

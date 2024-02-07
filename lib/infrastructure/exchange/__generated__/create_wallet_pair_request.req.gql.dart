// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/exchange/__generated__/create_wallet_pair_request.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/exchange/__generated__/create_wallet_pair_request.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/exchange/__generated__/create_wallet_pair_request.var.gql.dart'
    as _i3;

part 'create_wallet_pair_request.req.gql.g.dart';

abstract class GInitiateNonCustodianExchangeReq
    implements
        Built<GInitiateNonCustodianExchangeReq,
            GInitiateNonCustodianExchangeReqBuilder>,
        _i1.OperationRequest<_i2.GInitiateNonCustodianExchangeData,
            _i3.GInitiateNonCustodianExchangeVars> {
  GInitiateNonCustodianExchangeReq._();

  factory GInitiateNonCustodianExchangeReq(
          [Function(GInitiateNonCustodianExchangeReqBuilder b) updates]) =
      _$GInitiateNonCustodianExchangeReq;

  static void _initializeBuilder(GInitiateNonCustodianExchangeReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'InitiateNonCustodianExchange',
    )
    ..executeOnListen = true;

  @override
  _i3.GInitiateNonCustodianExchangeVars get vars;
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
  _i2.GInitiateNonCustodianExchangeData? Function(
    _i2.GInitiateNonCustodianExchangeData?,
    _i2.GInitiateNonCustodianExchangeData?,
  )? get updateResult;
  @override
  _i2.GInitiateNonCustodianExchangeData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GInitiateNonCustodianExchangeData? parseData(Map<String, dynamic> json) =>
      _i2.GInitiateNonCustodianExchangeData.fromJson(json);

  static Serializer<GInitiateNonCustodianExchangeReq> get serializer =>
      _$gInitiateNonCustodianExchangeReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GInitiateNonCustodianExchangeReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GInitiateNonCustodianExchangeReq? fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GInitiateNonCustodianExchangeReq.serializer,
        json,
      );
}

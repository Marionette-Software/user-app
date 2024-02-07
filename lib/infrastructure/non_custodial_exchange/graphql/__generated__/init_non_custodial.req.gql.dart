// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/init_non_custodial.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/init_non_custodial.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/init_non_custodial.var.gql.dart'
    as _i3;

part 'init_non_custodial.req.gql.g.dart';

abstract class GInitNonCustodialReq
    implements
        Built<GInitNonCustodialReq, GInitNonCustodialReqBuilder>,
        _i1.OperationRequest<_i2.GInitNonCustodialData,
            _i3.GInitNonCustodialVars> {
  GInitNonCustodialReq._();

  factory GInitNonCustodialReq(
          [Function(GInitNonCustodialReqBuilder b) updates]) =
      _$GInitNonCustodialReq;

  static void _initializeBuilder(GInitNonCustodialReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'InitNonCustodial',
    )
    ..executeOnListen = true;

  @override
  _i3.GInitNonCustodialVars get vars;
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
  _i2.GInitNonCustodialData? Function(
    _i2.GInitNonCustodialData?,
    _i2.GInitNonCustodialData?,
  )? get updateResult;
  @override
  _i2.GInitNonCustodialData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GInitNonCustodialData? parseData(Map<String, dynamic> json) =>
      _i2.GInitNonCustodialData.fromJson(json);

  static Serializer<GInitNonCustodialReq> get serializer =>
      _$gInitNonCustodialReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GInitNonCustodialReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GInitNonCustodialReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GInitNonCustodialReq.serializer,
        json,
      );
}

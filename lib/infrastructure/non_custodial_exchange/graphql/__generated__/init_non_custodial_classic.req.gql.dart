// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/init_non_custodial_classic.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/init_non_custodial_classic.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/init_non_custodial_classic.var.gql.dart'
    as _i3;

part 'init_non_custodial_classic.req.gql.g.dart';

abstract class GInitNonCustodialClassicReq
    implements
        Built<GInitNonCustodialClassicReq, GInitNonCustodialClassicReqBuilder>,
        _i1.OperationRequest<_i2.GInitNonCustodialClassicData,
            _i3.GInitNonCustodialClassicVars> {
  GInitNonCustodialClassicReq._();

  factory GInitNonCustodialClassicReq(
          [Function(GInitNonCustodialClassicReqBuilder b) updates]) =
      _$GInitNonCustodialClassicReq;

  static void _initializeBuilder(GInitNonCustodialClassicReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'InitNonCustodialClassic',
    )
    ..executeOnListen = true;

  @override
  _i3.GInitNonCustodialClassicVars get vars;
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
  _i2.GInitNonCustodialClassicData? Function(
    _i2.GInitNonCustodialClassicData?,
    _i2.GInitNonCustodialClassicData?,
  )? get updateResult;
  @override
  _i2.GInitNonCustodialClassicData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GInitNonCustodialClassicData? parseData(Map<String, dynamic> json) =>
      _i2.GInitNonCustodialClassicData.fromJson(json);

  static Serializer<GInitNonCustodialClassicReq> get serializer =>
      _$gInitNonCustodialClassicReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GInitNonCustodialClassicReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GInitNonCustodialClassicReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GInitNonCustodialClassicReq.serializer,
        json,
      );
}

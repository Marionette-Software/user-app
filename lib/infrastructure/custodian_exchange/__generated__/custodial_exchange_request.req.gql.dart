// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/custodian_exchange/__generated__/custodial_exchange_request.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/custodian_exchange/__generated__/custodial_exchange_request.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/custodian_exchange/__generated__/custodial_exchange_request.var.gql.dart'
    as _i3;

part 'custodial_exchange_request.req.gql.g.dart';

abstract class GUserExchangeReq
    implements
        Built<GUserExchangeReq, GUserExchangeReqBuilder>,
        _i1.OperationRequest<_i2.GUserExchangeData, _i3.GUserExchangeVars> {
  GUserExchangeReq._();

  factory GUserExchangeReq([Function(GUserExchangeReqBuilder b) updates]) =
      _$GUserExchangeReq;

  static void _initializeBuilder(GUserExchangeReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'UserExchange',
    )
    ..executeOnListen = true;

  @override
  _i3.GUserExchangeVars get vars;
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
  _i2.GUserExchangeData? Function(
    _i2.GUserExchangeData?,
    _i2.GUserExchangeData?,
  )? get updateResult;
  @override
  _i2.GUserExchangeData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GUserExchangeData? parseData(Map<String, dynamic> json) =>
      _i2.GUserExchangeData.fromJson(json);

  static Serializer<GUserExchangeReq> get serializer =>
      _$gUserExchangeReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUserExchangeReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserExchangeReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUserExchangeReq.serializer,
        json,
      );
}

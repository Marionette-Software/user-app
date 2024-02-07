// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/two_fa/__generated__/get_2fa_status.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/two_fa/__generated__/get_2fa_status.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/two_fa/__generated__/get_2fa_status.var.gql.dart'
    as _i3;

part 'get_2fa_status.req.gql.g.dart';

abstract class GGet2FaStatusReq
    implements
        Built<GGet2FaStatusReq, GGet2FaStatusReqBuilder>,
        _i1.OperationRequest<_i2.GGet2FaStatusData, _i3.GGet2FaStatusVars> {
  GGet2FaStatusReq._();

  factory GGet2FaStatusReq([Function(GGet2FaStatusReqBuilder b) updates]) =
      _$GGet2FaStatusReq;

  static void _initializeBuilder(GGet2FaStatusReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Get2FaStatus',
    )
    ..executeOnListen = true;

  @override
  _i3.GGet2FaStatusVars get vars;
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
  _i2.GGet2FaStatusData? Function(
    _i2.GGet2FaStatusData?,
    _i2.GGet2FaStatusData?,
  )? get updateResult;
  @override
  _i2.GGet2FaStatusData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGet2FaStatusData? parseData(Map<String, dynamic> json) =>
      _i2.GGet2FaStatusData.fromJson(json);

  static Serializer<GGet2FaStatusReq> get serializer =>
      _$gGet2FaStatusReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGet2FaStatusReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGet2FaStatusReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGet2FaStatusReq.serializer,
        json,
      );
}

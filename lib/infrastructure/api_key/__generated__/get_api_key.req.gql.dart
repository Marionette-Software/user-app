// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/api_key/__generated__/get_api_key.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/api_key/__generated__/get_api_key.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/api_key/__generated__/get_api_key.var.gql.dart'
    as _i3;

part 'get_api_key.req.gql.g.dart';

abstract class GGetApiKeysReq
    implements
        Built<GGetApiKeysReq, GGetApiKeysReqBuilder>,
        _i1.OperationRequest<_i2.GGetApiKeysData, _i3.GGetApiKeysVars> {
  GGetApiKeysReq._();

  factory GGetApiKeysReq([Function(GGetApiKeysReqBuilder b) updates]) =
      _$GGetApiKeysReq;

  static void _initializeBuilder(GGetApiKeysReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetApiKeys',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetApiKeysVars get vars;
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
  _i2.GGetApiKeysData? Function(
    _i2.GGetApiKeysData?,
    _i2.GGetApiKeysData?,
  )? get updateResult;
  @override
  _i2.GGetApiKeysData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GGetApiKeysData? parseData(Map<String, dynamic> json) =>
      _i2.GGetApiKeysData.fromJson(json);

  static Serializer<GGetApiKeysReq> get serializer =>
      _$gGetApiKeysReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetApiKeysReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetApiKeysReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetApiKeysReq.serializer,
        json,
      );
}

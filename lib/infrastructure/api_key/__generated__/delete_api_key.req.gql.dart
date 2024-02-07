// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/api_key/__generated__/delete_api_key.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/api_key/__generated__/delete_api_key.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/api_key/__generated__/delete_api_key.var.gql.dart'
    as _i3;

part 'delete_api_key.req.gql.g.dart';

abstract class GDeleteApiKeyActionReq
    implements
        Built<GDeleteApiKeyActionReq, GDeleteApiKeyActionReqBuilder>,
        _i1.OperationRequest<_i2.GDeleteApiKeyActionData,
            _i3.GDeleteApiKeyActionVars> {
  GDeleteApiKeyActionReq._();

  factory GDeleteApiKeyActionReq(
          [Function(GDeleteApiKeyActionReqBuilder b) updates]) =
      _$GDeleteApiKeyActionReq;

  static void _initializeBuilder(GDeleteApiKeyActionReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'DeleteApiKeyAction',
    )
    ..executeOnListen = true;

  @override
  _i3.GDeleteApiKeyActionVars get vars;
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
  _i2.GDeleteApiKeyActionData? Function(
    _i2.GDeleteApiKeyActionData?,
    _i2.GDeleteApiKeyActionData?,
  )? get updateResult;
  @override
  _i2.GDeleteApiKeyActionData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GDeleteApiKeyActionData? parseData(Map<String, dynamic> json) =>
      _i2.GDeleteApiKeyActionData.fromJson(json);

  static Serializer<GDeleteApiKeyActionReq> get serializer =>
      _$gDeleteApiKeyActionReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GDeleteApiKeyActionReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteApiKeyActionReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GDeleteApiKeyActionReq.serializer,
        json,
      );
}

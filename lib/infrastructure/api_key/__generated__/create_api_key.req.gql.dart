// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/api_key/__generated__/create_api_key.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/api_key/__generated__/create_api_key.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/api_key/__generated__/create_api_key.var.gql.dart'
    as _i3;

part 'create_api_key.req.gql.g.dart';

abstract class GCreateUserApiKeyReq
    implements
        Built<GCreateUserApiKeyReq, GCreateUserApiKeyReqBuilder>,
        _i1.OperationRequest<_i2.GCreateUserApiKeyData,
            _i3.GCreateUserApiKeyVars> {
  GCreateUserApiKeyReq._();

  factory GCreateUserApiKeyReq(
          [Function(GCreateUserApiKeyReqBuilder b) updates]) =
      _$GCreateUserApiKeyReq;

  static void _initializeBuilder(GCreateUserApiKeyReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CreateUserApiKey',
    )
    ..executeOnListen = true;

  @override
  _i3.GCreateUserApiKeyVars get vars;
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
  _i2.GCreateUserApiKeyData? Function(
    _i2.GCreateUserApiKeyData?,
    _i2.GCreateUserApiKeyData?,
  )? get updateResult;
  @override
  _i2.GCreateUserApiKeyData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GCreateUserApiKeyData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateUserApiKeyData.fromJson(json);

  static Serializer<GCreateUserApiKeyReq> get serializer =>
      _$gCreateUserApiKeyReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCreateUserApiKeyReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateUserApiKeyReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCreateUserApiKeyReq.serializer,
        json,
      );
}

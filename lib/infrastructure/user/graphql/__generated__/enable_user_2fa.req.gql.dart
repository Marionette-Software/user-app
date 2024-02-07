// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/user/graphql/__generated__/enable_user_2fa.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/user/graphql/__generated__/enable_user_2fa.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/user/graphql/__generated__/enable_user_2fa.var.gql.dart'
    as _i3;

part 'enable_user_2fa.req.gql.g.dart';

abstract class GTurnOn2FAReq
    implements
        Built<GTurnOn2FAReq, GTurnOn2FAReqBuilder>,
        _i1.OperationRequest<_i2.GTurnOn2FAData, _i3.GTurnOn2FAVars> {
  GTurnOn2FAReq._();

  factory GTurnOn2FAReq([Function(GTurnOn2FAReqBuilder b) updates]) =
      _$GTurnOn2FAReq;

  static void _initializeBuilder(GTurnOn2FAReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'TurnOn2FA',
    )
    ..executeOnListen = true;

  @override
  _i3.GTurnOn2FAVars get vars;
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
  _i2.GTurnOn2FAData? Function(
    _i2.GTurnOn2FAData?,
    _i2.GTurnOn2FAData?,
  )? get updateResult;
  @override
  _i2.GTurnOn2FAData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GTurnOn2FAData? parseData(Map<String, dynamic> json) =>
      _i2.GTurnOn2FAData.fromJson(json);

  static Serializer<GTurnOn2FAReq> get serializer => _$gTurnOn2FAReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GTurnOn2FAReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTurnOn2FAReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GTurnOn2FAReq.serializer,
        json,
      );
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/withdraw/__generated__/create_recipient_request.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/withdraw/__generated__/create_recipient_request.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/withdraw/__generated__/create_recipient_request.var.gql.dart'
    as _i3;

part 'create_recipient_request.req.gql.g.dart';

abstract class GCreateRecipientReq
    implements
        Built<GCreateRecipientReq, GCreateRecipientReqBuilder>,
        _i1.OperationRequest<_i2.GCreateRecipientData,
            _i3.GCreateRecipientVars> {
  GCreateRecipientReq._();

  factory GCreateRecipientReq(
      [Function(GCreateRecipientReqBuilder b) updates]) = _$GCreateRecipientReq;

  static void _initializeBuilder(GCreateRecipientReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CreateRecipient',
    )
    ..executeOnListen = true;

  @override
  _i3.GCreateRecipientVars get vars;
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
  _i2.GCreateRecipientData? Function(
    _i2.GCreateRecipientData?,
    _i2.GCreateRecipientData?,
  )? get updateResult;
  @override
  _i2.GCreateRecipientData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GCreateRecipientData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateRecipientData.fromJson(json);

  static Serializer<GCreateRecipientReq> get serializer =>
      _$gCreateRecipientReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCreateRecipientReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateRecipientReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCreateRecipientReq.serializer,
        json,
      );
}

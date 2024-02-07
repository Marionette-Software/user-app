// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/kyc/document_type/__generated__/document_type_request.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/kyc/document_type/__generated__/document_type_request.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/kyc/document_type/__generated__/document_type_request.var.gql.dart'
    as _i3;

part 'document_type_request.req.gql.g.dart';

abstract class GKYCDocumentTypesReq
    implements
        Built<GKYCDocumentTypesReq, GKYCDocumentTypesReqBuilder>,
        _i1.OperationRequest<_i2.GKYCDocumentTypesData,
            _i3.GKYCDocumentTypesVars> {
  GKYCDocumentTypesReq._();

  factory GKYCDocumentTypesReq(
          [Function(GKYCDocumentTypesReqBuilder b) updates]) =
      _$GKYCDocumentTypesReq;

  static void _initializeBuilder(GKYCDocumentTypesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'KYCDocumentTypes',
    )
    ..executeOnListen = true;

  @override
  _i3.GKYCDocumentTypesVars get vars;
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
  _i2.GKYCDocumentTypesData? Function(
    _i2.GKYCDocumentTypesData?,
    _i2.GKYCDocumentTypesData?,
  )? get updateResult;
  @override
  _i2.GKYCDocumentTypesData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GKYCDocumentTypesData? parseData(Map<String, dynamic> json) =>
      _i2.GKYCDocumentTypesData.fromJson(json);

  static Serializer<GKYCDocumentTypesReq> get serializer =>
      _$gKYCDocumentTypesReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GKYCDocumentTypesReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GKYCDocumentTypesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GKYCDocumentTypesReq.serializer,
        json,
      );
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/kyc/documents/__generated__/add_document_request.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/kyc/documents/__generated__/add_document_request.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/kyc/documents/__generated__/add_document_request.var.gql.dart'
    as _i3;

part 'add_document_request.req.gql.g.dart';

abstract class GAddUserDocumentReq
    implements
        Built<GAddUserDocumentReq, GAddUserDocumentReqBuilder>,
        _i1.OperationRequest<_i2.GAddUserDocumentData,
            _i3.GAddUserDocumentVars> {
  GAddUserDocumentReq._();

  factory GAddUserDocumentReq(
      [Function(GAddUserDocumentReqBuilder b) updates]) = _$GAddUserDocumentReq;

  static void _initializeBuilder(GAddUserDocumentReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'AddUserDocument',
    )
    ..executeOnListen = true;

  @override
  _i3.GAddUserDocumentVars get vars;
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
  _i2.GAddUserDocumentData? Function(
    _i2.GAddUserDocumentData?,
    _i2.GAddUserDocumentData?,
  )? get updateResult;
  @override
  _i2.GAddUserDocumentData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GAddUserDocumentData? parseData(Map<String, dynamic> json) =>
      _i2.GAddUserDocumentData.fromJson(json);

  static Serializer<GAddUserDocumentReq> get serializer =>
      _$gAddUserDocumentReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GAddUserDocumentReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddUserDocumentReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GAddUserDocumentReq.serializer,
        json,
      );
}

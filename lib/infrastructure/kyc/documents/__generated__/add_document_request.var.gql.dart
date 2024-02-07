// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:http/http.dart' as _i1;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i2;

part 'add_document_request.var.gql.g.dart';

abstract class GAddUserDocumentVars
    implements Built<GAddUserDocumentVars, GAddUserDocumentVarsBuilder> {
  GAddUserDocumentVars._();

  factory GAddUserDocumentVars(
          [Function(GAddUserDocumentVarsBuilder b) updates]) =
      _$GAddUserDocumentVars;

  String get doc_type;
  String get doc_number;
  _i1.MultipartFile get file;
  String get doc_expire;
  static Serializer<GAddUserDocumentVars> get serializer =>
      _$gAddUserDocumentVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GAddUserDocumentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddUserDocumentVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GAddUserDocumentVars.serializer,
        json,
      );
}

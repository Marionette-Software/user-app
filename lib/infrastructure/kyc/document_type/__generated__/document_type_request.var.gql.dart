// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'document_type_request.var.gql.g.dart';

abstract class GKYCDocumentTypesVars
    implements Built<GKYCDocumentTypesVars, GKYCDocumentTypesVarsBuilder> {
  GKYCDocumentTypesVars._();

  factory GKYCDocumentTypesVars(
          [Function(GKYCDocumentTypesVarsBuilder b) updates]) =
      _$GKYCDocumentTypesVars;

  static Serializer<GKYCDocumentTypesVars> get serializer =>
      _$gKYCDocumentTypesVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GKYCDocumentTypesVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GKYCDocumentTypesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GKYCDocumentTypesVars.serializer,
        json,
      );
}

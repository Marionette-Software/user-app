// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'document_type_request.data.gql.g.dart';

abstract class GKYCDocumentTypesData
    implements Built<GKYCDocumentTypesData, GKYCDocumentTypesDataBuilder> {
  GKYCDocumentTypesData._();

  factory GKYCDocumentTypesData(
          [Function(GKYCDocumentTypesDataBuilder b) updates]) =
      _$GKYCDocumentTypesData;

  static void _initializeBuilder(GKYCDocumentTypesDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<String?>? get KYCDocumentTypes;
  static Serializer<GKYCDocumentTypesData> get serializer =>
      _$gKYCDocumentTypesDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GKYCDocumentTypesData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GKYCDocumentTypesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GKYCDocumentTypesData.serializer,
        json,
      );
}

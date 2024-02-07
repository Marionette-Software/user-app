// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'add_document_request.data.gql.g.dart';

abstract class GAddUserDocumentData
    implements Built<GAddUserDocumentData, GAddUserDocumentDataBuilder> {
  GAddUserDocumentData._();

  factory GAddUserDocumentData(
          [Function(GAddUserDocumentDataBuilder b) updates]) =
      _$GAddUserDocumentData;

  static void _initializeBuilder(GAddUserDocumentDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get addDocument;
  static Serializer<GAddUserDocumentData> get serializer =>
      _$gAddUserDocumentDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddUserDocumentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddUserDocumentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddUserDocumentData.serializer,
        json,
      );
}

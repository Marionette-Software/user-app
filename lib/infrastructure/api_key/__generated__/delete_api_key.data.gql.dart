// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'delete_api_key.data.gql.g.dart';

abstract class GDeleteApiKeyActionData
    implements Built<GDeleteApiKeyActionData, GDeleteApiKeyActionDataBuilder> {
  GDeleteApiKeyActionData._();

  factory GDeleteApiKeyActionData(
          [Function(GDeleteApiKeyActionDataBuilder b) updates]) =
      _$GDeleteApiKeyActionData;

  static void _initializeBuilder(GDeleteApiKeyActionDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get deleteApiKey;
  static Serializer<GDeleteApiKeyActionData> get serializer =>
      _$gDeleteApiKeyActionDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteApiKeyActionData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteApiKeyActionData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteApiKeyActionData.serializer,
        json,
      );
}

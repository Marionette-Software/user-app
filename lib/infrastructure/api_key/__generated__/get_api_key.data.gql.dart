// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_api_key.data.gql.g.dart';

abstract class GGetApiKeysData
    implements Built<GGetApiKeysData, GGetApiKeysDataBuilder> {
  GGetApiKeysData._();

  factory GGetApiKeysData([Function(GGetApiKeysDataBuilder b) updates]) =
      _$GGetApiKeysData;

  static void _initializeBuilder(GGetApiKeysDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetApiKeysData_apiKeys?>? get apiKeys;
  static Serializer<GGetApiKeysData> get serializer =>
      _$gGetApiKeysDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetApiKeysData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetApiKeysData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetApiKeysData.serializer,
        json,
      );
}

abstract class GGetApiKeysData_apiKeys
    implements Built<GGetApiKeysData_apiKeys, GGetApiKeysData_apiKeysBuilder> {
  GGetApiKeysData_apiKeys._();

  factory GGetApiKeysData_apiKeys(
          [Function(GGetApiKeysData_apiKeysBuilder b) updates]) =
      _$GGetApiKeysData_apiKeys;

  static void _initializeBuilder(GGetApiKeysData_apiKeysBuilder b) =>
      b..G__typename = 'ApiKey';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get description;
  String? get scope;
  int? get expires;
  String? get token;
  static Serializer<GGetApiKeysData_apiKeys> get serializer =>
      _$gGetApiKeysDataApiKeysSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetApiKeysData_apiKeys.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetApiKeysData_apiKeys? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetApiKeysData_apiKeys.serializer,
        json,
      );
}

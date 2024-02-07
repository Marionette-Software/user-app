// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'create_api_key.data.gql.g.dart';

abstract class GCreateUserApiKeyData
    implements Built<GCreateUserApiKeyData, GCreateUserApiKeyDataBuilder> {
  GCreateUserApiKeyData._();

  factory GCreateUserApiKeyData(
          [Function(GCreateUserApiKeyDataBuilder b) updates]) =
      _$GCreateUserApiKeyData;

  static void _initializeBuilder(GCreateUserApiKeyDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateUserApiKeyData_createApiKey? get createApiKey;
  static Serializer<GCreateUserApiKeyData> get serializer =>
      _$gCreateUserApiKeyDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateUserApiKeyData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateUserApiKeyData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateUserApiKeyData.serializer,
        json,
      );
}

abstract class GCreateUserApiKeyData_createApiKey
    implements
        Built<GCreateUserApiKeyData_createApiKey,
            GCreateUserApiKeyData_createApiKeyBuilder> {
  GCreateUserApiKeyData_createApiKey._();

  factory GCreateUserApiKeyData_createApiKey(
          [Function(GCreateUserApiKeyData_createApiKeyBuilder b) updates]) =
      _$GCreateUserApiKeyData_createApiKey;

  static void _initializeBuilder(GCreateUserApiKeyData_createApiKeyBuilder b) =>
      b..G__typename = 'ApiKey';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get description;
  String? get scope;
  int? get expires;
  String? get token;
  static Serializer<GCreateUserApiKeyData_createApiKey> get serializer =>
      _$gCreateUserApiKeyDataCreateApiKeySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateUserApiKeyData_createApiKey.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateUserApiKeyData_createApiKey? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateUserApiKeyData_createApiKey.serializer,
        json,
      );
}

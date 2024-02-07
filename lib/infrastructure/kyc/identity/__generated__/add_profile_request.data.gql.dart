// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'add_profile_request.data.gql.g.dart';

abstract class GAddProfileData
    implements Built<GAddProfileData, GAddProfileDataBuilder> {
  GAddProfileData._();

  factory GAddProfileData([Function(GAddProfileDataBuilder b) updates]) =
      _$GAddProfileData;

  static void _initializeBuilder(GAddProfileDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get addProfile;
  static Serializer<GAddProfileData> get serializer =>
      _$gAddProfileDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddProfileData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddProfileData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddProfileData.serializer,
        json,
      );
}

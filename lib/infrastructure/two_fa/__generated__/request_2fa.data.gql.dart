// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'request_2fa.data.gql.g.dart';

abstract class GRequest2FAData
    implements Built<GRequest2FAData, GRequest2FADataBuilder> {
  GRequest2FAData._();

  factory GRequest2FAData([Function(GRequest2FADataBuilder b) updates]) =
      _$GRequest2FAData;

  static void _initializeBuilder(GRequest2FADataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get request2FA;
  static Serializer<GRequest2FAData> get serializer =>
      _$gRequest2FADataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRequest2FAData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRequest2FAData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRequest2FAData.serializer,
        json,
      );
}

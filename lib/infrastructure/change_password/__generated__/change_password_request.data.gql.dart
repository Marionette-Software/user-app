// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'change_password_request.data.gql.g.dart';

abstract class GChangeMyPasswordData
    implements Built<GChangeMyPasswordData, GChangeMyPasswordDataBuilder> {
  GChangeMyPasswordData._();

  factory GChangeMyPasswordData(
          [Function(GChangeMyPasswordDataBuilder b) updates]) =
      _$GChangeMyPasswordData;

  static void _initializeBuilder(GChangeMyPasswordDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get changePassword;
  static Serializer<GChangeMyPasswordData> get serializer =>
      _$gChangeMyPasswordDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GChangeMyPasswordData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GChangeMyPasswordData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GChangeMyPasswordData.serializer,
        json,
      );
}

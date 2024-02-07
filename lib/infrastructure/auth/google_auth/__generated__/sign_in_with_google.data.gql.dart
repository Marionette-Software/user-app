// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'sign_in_with_google.data.gql.g.dart';

abstract class GSignUpWithGoogleData
    implements Built<GSignUpWithGoogleData, GSignUpWithGoogleDataBuilder> {
  GSignUpWithGoogleData._();

  factory GSignUpWithGoogleData(
          [Function(GSignUpWithGoogleDataBuilder b) updates]) =
      _$GSignUpWithGoogleData;

  static void _initializeBuilder(GSignUpWithGoogleDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GSignUpWithGoogleData_signWithGoogle? get signWithGoogle;
  static Serializer<GSignUpWithGoogleData> get serializer =>
      _$gSignUpWithGoogleDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSignUpWithGoogleData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSignUpWithGoogleData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSignUpWithGoogleData.serializer,
        json,
      );
}

abstract class GSignUpWithGoogleData_signWithGoogle
    implements
        Built<GSignUpWithGoogleData_signWithGoogle,
            GSignUpWithGoogleData_signWithGoogleBuilder> {
  GSignUpWithGoogleData_signWithGoogle._();

  factory GSignUpWithGoogleData_signWithGoogle(
          [Function(GSignUpWithGoogleData_signWithGoogleBuilder b) updates]) =
      _$GSignUpWithGoogleData_signWithGoogle;

  static void _initializeBuilder(
          GSignUpWithGoogleData_signWithGoogleBuilder b) =>
      b..G__typename = 'User';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get token;
  String? get id;
  String? get email;
  static Serializer<GSignUpWithGoogleData_signWithGoogle> get serializer =>
      _$gSignUpWithGoogleDataSignWithGoogleSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSignUpWithGoogleData_signWithGoogle.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSignUpWithGoogleData_signWithGoogle? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSignUpWithGoogleData_signWithGoogle.serializer,
        json,
      );
}

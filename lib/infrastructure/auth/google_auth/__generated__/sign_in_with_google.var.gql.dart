// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'sign_in_with_google.var.gql.g.dart';

abstract class GSignUpWithGoogleVars
    implements Built<GSignUpWithGoogleVars, GSignUpWithGoogleVarsBuilder> {
  GSignUpWithGoogleVars._();

  factory GSignUpWithGoogleVars(
          [Function(GSignUpWithGoogleVarsBuilder b) updates]) =
      _$GSignUpWithGoogleVars;

  String get token;
  String? get code;
  String? get referralId;
  static Serializer<GSignUpWithGoogleVars> get serializer =>
      _$gSignUpWithGoogleVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSignUpWithGoogleVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSignUpWithGoogleVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSignUpWithGoogleVars.serializer,
        json,
      );
}

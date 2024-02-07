// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'add_user_profile.var.gql.g.dart';

abstract class GAddUserProfileVars
    implements Built<GAddUserProfileVars, GAddUserProfileVarsBuilder> {
  GAddUserProfileVars._();

  factory GAddUserProfileVars(
      [Function(GAddUserProfileVarsBuilder b) updates]) = _$GAddUserProfileVars;

  String get first_name;
  String get last_name;
  String get birth;
  String get address;
  String get city;
  String get country;
  String get postcode;
  static Serializer<GAddUserProfileVars> get serializer =>
      _$gAddUserProfileVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddUserProfileVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddUserProfileVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddUserProfileVars.serializer,
        json,
      );
}

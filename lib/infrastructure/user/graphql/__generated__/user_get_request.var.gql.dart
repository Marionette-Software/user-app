// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'user_get_request.var.gql.g.dart';

abstract class GGetUpdateUserVars
    implements Built<GGetUpdateUserVars, GGetUpdateUserVarsBuilder> {
  GGetUpdateUserVars._();

  factory GGetUpdateUserVars([Function(GGetUpdateUserVarsBuilder b) updates]) =
      _$GGetUpdateUserVars;

  String? get id;
  static Serializer<GGetUpdateUserVars> get serializer =>
      _$gGetUpdateUserVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUpdateUserVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUpdateUserVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUpdateUserVars.serializer,
        json,
      );
}

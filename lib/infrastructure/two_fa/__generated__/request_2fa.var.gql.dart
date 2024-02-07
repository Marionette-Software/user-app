// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'request_2fa.var.gql.g.dart';

abstract class GRequest2FAVars
    implements Built<GRequest2FAVars, GRequest2FAVarsBuilder> {
  GRequest2FAVars._();

  factory GRequest2FAVars([Function(GRequest2FAVarsBuilder b) updates]) =
      _$GRequest2FAVars;

  static Serializer<GRequest2FAVars> get serializer =>
      _$gRequest2FAVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRequest2FAVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRequest2FAVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRequest2FAVars.serializer,
        json,
      );
}

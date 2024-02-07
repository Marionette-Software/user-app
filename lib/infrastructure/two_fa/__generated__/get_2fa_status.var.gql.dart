// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_2fa_status.var.gql.g.dart';

abstract class GGet2FaStatusVars
    implements Built<GGet2FaStatusVars, GGet2FaStatusVarsBuilder> {
  GGet2FaStatusVars._();

  factory GGet2FaStatusVars([Function(GGet2FaStatusVarsBuilder b) updates]) =
      _$GGet2FaStatusVars;

  String? get id;
  static Serializer<GGet2FaStatusVars> get serializer =>
      _$gGet2FaStatusVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGet2FaStatusVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGet2FaStatusVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGet2FaStatusVars.serializer,
        json,
      );
}

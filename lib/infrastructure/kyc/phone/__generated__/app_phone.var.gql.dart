// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'app_phone.var.gql.g.dart';

abstract class GAddPhoneVars
    implements Built<GAddPhoneVars, GAddPhoneVarsBuilder> {
  GAddPhoneVars._();

  factory GAddPhoneVars([Function(GAddPhoneVarsBuilder b) updates]) =
      _$GAddPhoneVars;

  String get phone;
  static Serializer<GAddPhoneVars> get serializer => _$gAddPhoneVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddPhoneVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddPhoneVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddPhoneVars.serializer,
        json,
      );
}

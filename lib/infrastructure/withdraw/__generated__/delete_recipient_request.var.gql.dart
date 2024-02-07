// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'delete_recipient_request.var.gql.g.dart';

abstract class GDeleteRecipientVars
    implements Built<GDeleteRecipientVars, GDeleteRecipientVarsBuilder> {
  GDeleteRecipientVars._();

  factory GDeleteRecipientVars(
          [Function(GDeleteRecipientVarsBuilder b) updates]) =
      _$GDeleteRecipientVars;

  String get id;
  static Serializer<GDeleteRecipientVars> get serializer =>
      _$gDeleteRecipientVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteRecipientVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteRecipientVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteRecipientVars.serializer,
        json,
      );
}

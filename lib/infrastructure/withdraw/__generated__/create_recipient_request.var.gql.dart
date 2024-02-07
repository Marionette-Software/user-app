// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'create_recipient_request.var.gql.g.dart';

abstract class GCreateRecipientVars
    implements Built<GCreateRecipientVars, GCreateRecipientVarsBuilder> {
  GCreateRecipientVars._();

  factory GCreateRecipientVars(
          [Function(GCreateRecipientVarsBuilder b) updates]) =
      _$GCreateRecipientVars;

  String get paymentInterfaceId;
  String get currencyId;
  String get data;
  String get description;
  static Serializer<GCreateRecipientVars> get serializer =>
      _$gCreateRecipientVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateRecipientVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateRecipientVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateRecipientVars.serializer,
        json,
      );
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'create_recipient.var.gql.g.dart';

abstract class GCreateNonCustodialRecipientVars
    implements
        Built<GCreateNonCustodialRecipientVars,
            GCreateNonCustodialRecipientVarsBuilder> {
  GCreateNonCustodialRecipientVars._();

  factory GCreateNonCustodialRecipientVars(
          [Function(GCreateNonCustodialRecipientVarsBuilder b) updates]) =
      _$GCreateNonCustodialRecipientVars;

  String get paymentInterfaceId;
  String get currencyId;
  String get data;
  String get description;
  static Serializer<GCreateNonCustodialRecipientVars> get serializer =>
      _$gCreateNonCustodialRecipientVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateNonCustodialRecipientVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateNonCustodialRecipientVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateNonCustodialRecipientVars.serializer,
        json,
      );
}

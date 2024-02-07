// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'custodial_exchange_request.var.gql.g.dart';

abstract class GUserExchangeVars
    implements Built<GUserExchangeVars, GUserExchangeVarsBuilder> {
  GUserExchangeVars._();

  factory GUserExchangeVars([Function(GUserExchangeVarsBuilder b) updates]) =
      _$GUserExchangeVars;

  String get currencyFrom;
  String get currencyTo;
  double get amount;
  static Serializer<GUserExchangeVars> get serializer =>
      _$gUserExchangeVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserExchangeVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserExchangeVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserExchangeVars.serializer,
        json,
      );
}

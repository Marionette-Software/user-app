// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'init_non_custodial_classic.var.gql.g.dart';

abstract class GInitNonCustodialClassicVars
    implements
        Built<GInitNonCustodialClassicVars,
            GInitNonCustodialClassicVarsBuilder> {
  GInitNonCustodialClassicVars._();

  factory GInitNonCustodialClassicVars(
          [Function(GInitNonCustodialClassicVarsBuilder b) updates]) =
      _$GInitNonCustodialClassicVars;

  String get inPaymentInterfaceId;
  String get inCurrencyId;
  double get amount;
  String get recipientId;
  static Serializer<GInitNonCustodialClassicVars> get serializer =>
      _$gInitNonCustodialClassicVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GInitNonCustodialClassicVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GInitNonCustodialClassicVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GInitNonCustodialClassicVars.serializer,
        json,
      );
}

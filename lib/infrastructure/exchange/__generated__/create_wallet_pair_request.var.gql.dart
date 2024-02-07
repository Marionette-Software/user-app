// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'create_wallet_pair_request.var.gql.g.dart';

abstract class GInitiateNonCustodianExchangeVars
    implements
        Built<GInitiateNonCustodianExchangeVars,
            GInitiateNonCustodianExchangeVarsBuilder> {
  GInitiateNonCustodianExchangeVars._();

  factory GInitiateNonCustodianExchangeVars(
          [Function(GInitiateNonCustodianExchangeVarsBuilder b) updates]) =
      _$GInitiateNonCustodianExchangeVars;

  String? get currencyFrom;
  String? get paymentInterfaceFrom;
  String? get currencyTo;
  String? get paymentInterfaceTo;
  String? get paymentInterfaceToData;
  double? get amount;
  static Serializer<GInitiateNonCustodianExchangeVars> get serializer =>
      _$gInitiateNonCustodianExchangeVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GInitiateNonCustodianExchangeVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GInitiateNonCustodianExchangeVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GInitiateNonCustodianExchangeVars.serializer,
        json,
      );
}

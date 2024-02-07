// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'send_user_direct_deposit.var.gql.g.dart';

abstract class GsendUserDirectDepositVars
    implements
        Built<GsendUserDirectDepositVars, GsendUserDirectDepositVarsBuilder> {
  GsendUserDirectDepositVars._();

  factory GsendUserDirectDepositVars(
          [Function(GsendUserDirectDepositVarsBuilder b) updates]) =
      _$GsendUserDirectDepositVars;

  String get currencyPaymentInterfaceId;
  String get address;
  double get amount;
  static Serializer<GsendUserDirectDepositVars> get serializer =>
      _$gsendUserDirectDepositVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GsendUserDirectDepositVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GsendUserDirectDepositVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GsendUserDirectDepositVars.serializer,
        json,
      );
}

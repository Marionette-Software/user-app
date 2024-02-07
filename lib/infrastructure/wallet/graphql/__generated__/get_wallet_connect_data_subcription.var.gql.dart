// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_wallet_connect_data_subcription.var.gql.g.dart';

abstract class GconnectToWalletVars
    implements Built<GconnectToWalletVars, GconnectToWalletVarsBuilder> {
  GconnectToWalletVars._();

  factory GconnectToWalletVars(
          [Function(GconnectToWalletVarsBuilder b) updates]) =
      _$GconnectToWalletVars;

  String get token;
  static Serializer<GconnectToWalletVars> get serializer =>
      _$gconnectToWalletVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GconnectToWalletVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GconnectToWalletVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GconnectToWalletVars.serializer,
        json,
      );
}

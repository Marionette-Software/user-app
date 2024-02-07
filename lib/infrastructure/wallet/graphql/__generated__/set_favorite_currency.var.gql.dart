// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'set_favorite_currency.var.gql.g.dart';

abstract class GSetFavoriteWalletVars
    implements Built<GSetFavoriteWalletVars, GSetFavoriteWalletVarsBuilder> {
  GSetFavoriteWalletVars._();

  factory GSetFavoriteWalletVars(
          [Function(GSetFavoriteWalletVarsBuilder b) updates]) =
      _$GSetFavoriteWalletVars;

  String get currencyId;
  static Serializer<GSetFavoriteWalletVars> get serializer =>
      _$gSetFavoriteWalletVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSetFavoriteWalletVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSetFavoriteWalletVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSetFavoriteWalletVars.serializer,
        json,
      );
}

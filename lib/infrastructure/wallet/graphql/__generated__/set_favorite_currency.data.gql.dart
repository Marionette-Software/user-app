// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'set_favorite_currency.data.gql.g.dart';

abstract class GSetFavoriteWalletData
    implements Built<GSetFavoriteWalletData, GSetFavoriteWalletDataBuilder> {
  GSetFavoriteWalletData._();

  factory GSetFavoriteWalletData(
          [Function(GSetFavoriteWalletDataBuilder b) updates]) =
      _$GSetFavoriteWalletData;

  static void _initializeBuilder(GSetFavoriteWalletDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get setFavoriteCurrency;
  static Serializer<GSetFavoriteWalletData> get serializer =>
      _$gSetFavoriteWalletDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSetFavoriteWalletData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSetFavoriteWalletData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSetFavoriteWalletData.serializer,
        json,
      );
}

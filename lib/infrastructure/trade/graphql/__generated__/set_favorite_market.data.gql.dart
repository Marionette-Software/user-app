// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'set_favorite_market.data.gql.g.dart';

abstract class GsetFavoriteMarketData
    implements Built<GsetFavoriteMarketData, GsetFavoriteMarketDataBuilder> {
  GsetFavoriteMarketData._();

  factory GsetFavoriteMarketData(
          [Function(GsetFavoriteMarketDataBuilder b) updates]) =
      _$GsetFavoriteMarketData;

  static void _initializeBuilder(GsetFavoriteMarketDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get setFavoriteMarket;
  static Serializer<GsetFavoriteMarketData> get serializer =>
      _$gsetFavoriteMarketDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GsetFavoriteMarketData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GsetFavoriteMarketData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GsetFavoriteMarketData.serializer,
        json,
      );
}

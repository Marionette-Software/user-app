// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'create_stake.data.gql.g.dart';

abstract class GCreateCurrencyStateData
    implements
        Built<GCreateCurrencyStateData, GCreateCurrencyStateDataBuilder> {
  GCreateCurrencyStateData._();

  factory GCreateCurrencyStateData(
          [Function(GCreateCurrencyStateDataBuilder b) updates]) =
      _$GCreateCurrencyStateData;

  static void _initializeBuilder(GCreateCurrencyStateDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get createStake;
  static Serializer<GCreateCurrencyStateData> get serializer =>
      _$gCreateCurrencyStateDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateCurrencyStateData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateCurrencyStateData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateCurrencyStateData.serializer,
        json,
      );
}

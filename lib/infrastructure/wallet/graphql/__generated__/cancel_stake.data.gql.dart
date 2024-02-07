// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'cancel_stake.data.gql.g.dart';

abstract class GCancelCurrencyStateData
    implements
        Built<GCancelCurrencyStateData, GCancelCurrencyStateDataBuilder> {
  GCancelCurrencyStateData._();

  factory GCancelCurrencyStateData(
          [Function(GCancelCurrencyStateDataBuilder b) updates]) =
      _$GCancelCurrencyStateData;

  static void _initializeBuilder(GCancelCurrencyStateDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get cancelStake;
  static Serializer<GCancelCurrencyStateData> get serializer =>
      _$gCancelCurrencyStateDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCancelCurrencyStateData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCancelCurrencyStateData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCancelCurrencyStateData.serializer,
        json,
      );
}

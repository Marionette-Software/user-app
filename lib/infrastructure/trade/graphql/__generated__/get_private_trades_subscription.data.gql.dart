// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_private_trades_subscription.data.gql.g.dart';

abstract class GGetPrivateTradesData
    implements Built<GGetPrivateTradesData, GGetPrivateTradesDataBuilder> {
  GGetPrivateTradesData._();

  factory GGetPrivateTradesData(
          [Function(GGetPrivateTradesDataBuilder b) updates]) =
      _$GGetPrivateTradesData;

  static void _initializeBuilder(GGetPrivateTradesDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetPrivateTradesData_privateTrades? get privateTrades;
  static Serializer<GGetPrivateTradesData> get serializer =>
      _$gGetPrivateTradesDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPrivateTradesData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetPrivateTradesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPrivateTradesData.serializer,
        json,
      );
}

abstract class GGetPrivateTradesData_privateTrades
    implements
        Built<GGetPrivateTradesData_privateTrades,
            GGetPrivateTradesData_privateTradesBuilder> {
  GGetPrivateTradesData_privateTrades._();

  factory GGetPrivateTradesData_privateTrades(
          [Function(GGetPrivateTradesData_privateTradesBuilder b) updates]) =
      _$GGetPrivateTradesData_privateTrades;

  static void _initializeBuilder(
          GGetPrivateTradesData_privateTradesBuilder b) =>
      b..G__typename = 'PrivateTrade';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  double? get amount;
  double? get price;
  String? get side;
  String? get role;
  String? get createdAt;
  static Serializer<GGetPrivateTradesData_privateTrades> get serializer =>
      _$gGetPrivateTradesDataPrivateTradesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPrivateTradesData_privateTrades.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetPrivateTradesData_privateTrades? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPrivateTradesData_privateTrades.serializer,
        json,
      );
}

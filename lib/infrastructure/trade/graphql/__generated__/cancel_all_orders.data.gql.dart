// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'cancel_all_orders.data.gql.g.dart';

abstract class GCancelAllOrdersData
    implements Built<GCancelAllOrdersData, GCancelAllOrdersDataBuilder> {
  GCancelAllOrdersData._();

  factory GCancelAllOrdersData(
          [Function(GCancelAllOrdersDataBuilder b) updates]) =
      _$GCancelAllOrdersData;

  static void _initializeBuilder(GCancelAllOrdersDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get cancelAllOrders;
  static Serializer<GCancelAllOrdersData> get serializer =>
      _$gCancelAllOrdersDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCancelAllOrdersData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCancelAllOrdersData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCancelAllOrdersData.serializer,
        json,
      );
}

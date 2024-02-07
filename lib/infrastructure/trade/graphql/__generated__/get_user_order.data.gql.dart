// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_user_order.data.gql.g.dart';

abstract class GGetUserOrderData
    implements Built<GGetUserOrderData, GGetUserOrderDataBuilder> {
  GGetUserOrderData._();

  factory GGetUserOrderData([Function(GGetUserOrderDataBuilder b) updates]) =
      _$GGetUserOrderData;

  static void _initializeBuilder(GGetUserOrderDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetUserOrderData_userOrder? get userOrder;
  static Serializer<GGetUserOrderData> get serializer =>
      _$gGetUserOrderDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserOrderData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserOrderData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserOrderData.serializer,
        json,
      );
}

abstract class GGetUserOrderData_userOrder
    implements
        Built<GGetUserOrderData_userOrder, GGetUserOrderData_userOrderBuilder> {
  GGetUserOrderData_userOrder._();

  factory GGetUserOrderData_userOrder(
          [Function(GGetUserOrderData_userOrderBuilder b) updates]) =
      _$GGetUserOrderData_userOrder;

  static void _initializeBuilder(GGetUserOrderData_userOrderBuilder b) =>
      b..G__typename = 'Order';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get status;
  static Serializer<GGetUserOrderData_userOrder> get serializer =>
      _$gGetUserOrderDataUserOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserOrderData_userOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserOrderData_userOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserOrderData_userOrder.serializer,
        json,
      );
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'create_order.data.gql.g.dart';

abstract class GCreateOrderData
    implements Built<GCreateOrderData, GCreateOrderDataBuilder> {
  GCreateOrderData._();

  factory GCreateOrderData([Function(GCreateOrderDataBuilder b) updates]) =
      _$GCreateOrderData;

  static void _initializeBuilder(GCreateOrderDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateOrderData_openOrder? get openOrder;
  static Serializer<GCreateOrderData> get serializer =>
      _$gCreateOrderDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateOrderData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateOrderData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateOrderData.serializer,
        json,
      );
}

abstract class GCreateOrderData_openOrder
    implements
        Built<GCreateOrderData_openOrder, GCreateOrderData_openOrderBuilder> {
  GCreateOrderData_openOrder._();

  factory GCreateOrderData_openOrder(
          [Function(GCreateOrderData_openOrderBuilder b) updates]) =
      _$GCreateOrderData_openOrder;

  static void _initializeBuilder(GCreateOrderData_openOrderBuilder b) =>
      b..G__typename = 'Order';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get status;
  static Serializer<GCreateOrderData_openOrder> get serializer =>
      _$gCreateOrderDataOpenOrderSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateOrderData_openOrder.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateOrderData_openOrder? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateOrderData_openOrder.serializer,
        json,
      );
}

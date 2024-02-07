// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_currencies_request.data.gql.g.dart';

abstract class GGetCurrenciesData
    implements Built<GGetCurrenciesData, GGetCurrenciesDataBuilder> {
  GGetCurrenciesData._();

  factory GGetCurrenciesData([Function(GGetCurrenciesDataBuilder b) updates]) =
      _$GGetCurrenciesData;

  static void _initializeBuilder(GGetCurrenciesDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetCurrenciesData_currencies?>? get currencies;
  static Serializer<GGetCurrenciesData> get serializer =>
      _$gGetCurrenciesDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetCurrenciesData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetCurrenciesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetCurrenciesData.serializer,
        json,
      );
}

abstract class GGetCurrenciesData_currencies
    implements
        Built<GGetCurrenciesData_currencies,
            GGetCurrenciesData_currenciesBuilder> {
  GGetCurrenciesData_currencies._();

  factory GGetCurrenciesData_currencies(
          [Function(GGetCurrenciesData_currenciesBuilder b) updates]) =
      _$GGetCurrenciesData_currencies;

  static void _initializeBuilder(GGetCurrenciesData_currenciesBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get name;
  String? get icon_url;
  static Serializer<GGetCurrenciesData_currencies> get serializer =>
      _$gGetCurrenciesDataCurrenciesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetCurrenciesData_currencies.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetCurrenciesData_currencies? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetCurrenciesData_currencies.serializer,
        json,
      );
}

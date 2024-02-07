// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_currency_for_filter_history.data.gql.g.dart';

abstract class GGetCurrencyForFilterHistoryData
    implements
        Built<GGetCurrencyForFilterHistoryData,
            GGetCurrencyForFilterHistoryDataBuilder> {
  GGetCurrencyForFilterHistoryData._();

  factory GGetCurrencyForFilterHistoryData(
          [Function(GGetCurrencyForFilterHistoryDataBuilder b) updates]) =
      _$GGetCurrencyForFilterHistoryData;

  static void _initializeBuilder(GGetCurrencyForFilterHistoryDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetCurrencyForFilterHistoryData_user? get user;
  static Serializer<GGetCurrencyForFilterHistoryData> get serializer =>
      _$gGetCurrencyForFilterHistoryDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetCurrencyForFilterHistoryData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetCurrencyForFilterHistoryData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetCurrencyForFilterHistoryData.serializer,
        json,
      );
}

abstract class GGetCurrencyForFilterHistoryData_user
    implements
        Built<GGetCurrencyForFilterHistoryData_user,
            GGetCurrencyForFilterHistoryData_userBuilder> {
  GGetCurrencyForFilterHistoryData_user._();

  factory GGetCurrencyForFilterHistoryData_user(
          [Function(GGetCurrencyForFilterHistoryData_userBuilder b) updates]) =
      _$GGetCurrencyForFilterHistoryData_user;

  static void _initializeBuilder(
          GGetCurrencyForFilterHistoryData_userBuilder b) =>
      b..G__typename = 'User';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetCurrencyForFilterHistoryData_user_currencies?>? get currencies;
  static Serializer<GGetCurrencyForFilterHistoryData_user> get serializer =>
      _$gGetCurrencyForFilterHistoryDataUserSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetCurrencyForFilterHistoryData_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetCurrencyForFilterHistoryData_user? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetCurrencyForFilterHistoryData_user.serializer,
        json,
      );
}

abstract class GGetCurrencyForFilterHistoryData_user_currencies
    implements
        Built<GGetCurrencyForFilterHistoryData_user_currencies,
            GGetCurrencyForFilterHistoryData_user_currenciesBuilder> {
  GGetCurrencyForFilterHistoryData_user_currencies._();

  factory GGetCurrencyForFilterHistoryData_user_currencies(
      [Function(GGetCurrencyForFilterHistoryData_user_currenciesBuilder b)
          updates]) = _$GGetCurrencyForFilterHistoryData_user_currencies;

  static void _initializeBuilder(
          GGetCurrencyForFilterHistoryData_user_currenciesBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  static Serializer<GGetCurrencyForFilterHistoryData_user_currencies>
      get serializer =>
          _$gGetCurrencyForFilterHistoryDataUserCurrenciesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetCurrencyForFilterHistoryData_user_currencies.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetCurrencyForFilterHistoryData_user_currencies? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetCurrencyForFilterHistoryData_user_currencies.serializer,
        json,
      );
}

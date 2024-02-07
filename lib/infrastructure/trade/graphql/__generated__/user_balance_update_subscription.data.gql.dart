// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'user_balance_update_subscription.data.gql.g.dart';

abstract class GGetUserBalanceUpdatedData
    implements
        Built<GGetUserBalanceUpdatedData, GGetUserBalanceUpdatedDataBuilder> {
  GGetUserBalanceUpdatedData._();

  factory GGetUserBalanceUpdatedData(
          [Function(GGetUserBalanceUpdatedDataBuilder b) updates]) =
      _$GGetUserBalanceUpdatedData;

  static void _initializeBuilder(GGetUserBalanceUpdatedDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetUserBalanceUpdatedData_userBalanceUpdated? get userBalanceUpdated;
  static Serializer<GGetUserBalanceUpdatedData> get serializer =>
      _$gGetUserBalanceUpdatedDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserBalanceUpdatedData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserBalanceUpdatedData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserBalanceUpdatedData.serializer,
        json,
      );
}

abstract class GGetUserBalanceUpdatedData_userBalanceUpdated
    implements
        Built<GGetUserBalanceUpdatedData_userBalanceUpdated,
            GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder> {
  GGetUserBalanceUpdatedData_userBalanceUpdated._();

  factory GGetUserBalanceUpdatedData_userBalanceUpdated(
      [Function(GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder b)
          updates]) = _$GGetUserBalanceUpdatedData_userBalanceUpdated;

  static void _initializeBuilder(
          GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder b) =>
      b..G__typename = 'Balance';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get currencyId;
  double? get balance;
  double? get advancedTradingLockedBalance;
  double? get advancedTradingBalance;
  String? get ts;
  double? get lockedBalance;
  static Serializer<GGetUserBalanceUpdatedData_userBalanceUpdated>
      get serializer =>
          _$gGetUserBalanceUpdatedDataUserBalanceUpdatedSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserBalanceUpdatedData_userBalanceUpdated.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserBalanceUpdatedData_userBalanceUpdated? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserBalanceUpdatedData_userBalanceUpdated.serializer,
        json,
      );
}

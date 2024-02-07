// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_user_history.data.gql.g.dart';

abstract class GGetUserHistoryData
    implements Built<GGetUserHistoryData, GGetUserHistoryDataBuilder> {
  GGetUserHistoryData._();

  factory GGetUserHistoryData(
      [Function(GGetUserHistoryDataBuilder b) updates]) = _$GGetUserHistoryData;

  static void _initializeBuilder(GGetUserHistoryDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetUserHistoryData_history? get history;
  static Serializer<GGetUserHistoryData> get serializer =>
      _$gGetUserHistoryDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserHistoryData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserHistoryData.serializer,
        json,
      );
}

abstract class GGetUserHistoryData_history
    implements
        Built<GGetUserHistoryData_history, GGetUserHistoryData_historyBuilder> {
  GGetUserHistoryData_history._();

  factory GGetUserHistoryData_history(
          [Function(GGetUserHistoryData_historyBuilder b) updates]) =
      _$GGetUserHistoryData_history;

  static void _initializeBuilder(GGetUserHistoryData_historyBuilder b) =>
      b..G__typename = 'UserOperationsPaginated';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetUserHistoryData_history_result?>? get result;
  static Serializer<GGetUserHistoryData_history> get serializer =>
      _$gGetUserHistoryDataHistorySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserHistoryData_history.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryData_history? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserHistoryData_history.serializer,
        json,
      );
}

abstract class GGetUserHistoryData_history_result
    implements
        Built<GGetUserHistoryData_history_result,
            GGetUserHistoryData_history_resultBuilder> {
  GGetUserHistoryData_history_result._();

  factory GGetUserHistoryData_history_result(
          [Function(GGetUserHistoryData_history_resultBuilder b) updates]) =
      _$GGetUserHistoryData_history_result;

  static void _initializeBuilder(GGetUserHistoryData_history_resultBuilder b) =>
      b..G__typename = 'UserOperation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get createdAt;
  String? get status;
  String? get initiator_type;
  GGetUserHistoryData_history_result_initiator_currency? get initiator_currency;
  GGetUserHistoryData_history_result_initiator_payment_interface?
      get initiator_payment_interface;
  String? get initiator_payment_interface_id;
  String? get initiator_amount;
  String? get initiator_explorer_transaction;
  String? get initiator_txid;
  String? get result_txid;
  double? get initiator_fee;
  GGetUserHistoryData_history_result_result_currency? get result_currency;
  String? get result_payment_interface_id;
  String? get result_amount;
  static Serializer<GGetUserHistoryData_history_result> get serializer =>
      _$gGetUserHistoryDataHistoryResultSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserHistoryData_history_result.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryData_history_result? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserHistoryData_history_result.serializer,
        json,
      );
}

abstract class GGetUserHistoryData_history_result_initiator_currency
    implements
        Built<GGetUserHistoryData_history_result_initiator_currency,
            GGetUserHistoryData_history_result_initiator_currencyBuilder> {
  GGetUserHistoryData_history_result_initiator_currency._();

  factory GGetUserHistoryData_history_result_initiator_currency(
      [Function(GGetUserHistoryData_history_result_initiator_currencyBuilder b)
          updates]) = _$GGetUserHistoryData_history_result_initiator_currency;

  static void _initializeBuilder(
          GGetUserHistoryData_history_result_initiator_currencyBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  int? get precision;
  String? get icon_url;
  BuiltList<
          GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfaces?>?
      get currencyPaymentInterfaces;
  static Serializer<GGetUserHistoryData_history_result_initiator_currency>
      get serializer =>
          _$gGetUserHistoryDataHistoryResultInitiatorCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserHistoryData_history_result_initiator_currency.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryData_history_result_initiator_currency? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserHistoryData_history_result_initiator_currency.serializer,
        json,
      );
}

abstract class GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfaces
    implements
        Built<
            GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfaces,
            GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfacesBuilder> {
  GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfaces._();

  factory GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfaces(
          [Function(
                  GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfacesBuilder
                      b)
              updates]) =
      _$GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfaces;

  static void _initializeBuilder(
          GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfacesBuilder
              b) =>
      b..G__typename = 'CurrencyPaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get type;
  String? get paymentInterfaceId;
  static Serializer<
          GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfaces>
      get serializer =>
          _$gGetUserHistoryDataHistoryResultInitiatorCurrencyCurrencyPaymentInterfacesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfaces
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfaces?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfaces
                .serializer,
            json,
          );
}

abstract class GGetUserHistoryData_history_result_initiator_payment_interface
    implements
        Built<GGetUserHistoryData_history_result_initiator_payment_interface,
            GGetUserHistoryData_history_result_initiator_payment_interfaceBuilder> {
  GGetUserHistoryData_history_result_initiator_payment_interface._();

  factory GGetUserHistoryData_history_result_initiator_payment_interface(
          [Function(
                  GGetUserHistoryData_history_result_initiator_payment_interfaceBuilder
                      b)
              updates]) =
      _$GGetUserHistoryData_history_result_initiator_payment_interface;

  static void _initializeBuilder(
          GGetUserHistoryData_history_result_initiator_payment_interfaceBuilder
              b) =>
      b..G__typename = 'PaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get title;
  String? get subtitle;
  static Serializer<
          GGetUserHistoryData_history_result_initiator_payment_interface>
      get serializer =>
          _$gGetUserHistoryDataHistoryResultInitiatorPaymentInterfaceSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserHistoryData_history_result_initiator_payment_interface
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryData_history_result_initiator_payment_interface?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetUserHistoryData_history_result_initiator_payment_interface
                .serializer,
            json,
          );
}

abstract class GGetUserHistoryData_history_result_result_currency
    implements
        Built<GGetUserHistoryData_history_result_result_currency,
            GGetUserHistoryData_history_result_result_currencyBuilder> {
  GGetUserHistoryData_history_result_result_currency._();

  factory GGetUserHistoryData_history_result_result_currency(
      [Function(GGetUserHistoryData_history_result_result_currencyBuilder b)
          updates]) = _$GGetUserHistoryData_history_result_result_currency;

  static void _initializeBuilder(
          GGetUserHistoryData_history_result_result_currencyBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  int? get precision;
  String? get icon_url;
  int? get position;
  static Serializer<GGetUserHistoryData_history_result_result_currency>
      get serializer =>
          _$gGetUserHistoryDataHistoryResultResultCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserHistoryData_history_result_result_currency.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryData_history_result_result_currency? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserHistoryData_history_result_result_currency.serializer,
        json,
      );
}

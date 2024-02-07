// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_history_by_wallet.data.gql.g.dart';

abstract class GGetUserHistoryByIdData
    implements Built<GGetUserHistoryByIdData, GGetUserHistoryByIdDataBuilder> {
  GGetUserHistoryByIdData._();

  factory GGetUserHistoryByIdData(
          [Function(GGetUserHistoryByIdDataBuilder b) updates]) =
      _$GGetUserHistoryByIdData;

  static void _initializeBuilder(GGetUserHistoryByIdDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetUserHistoryByIdData_history? get history;
  static Serializer<GGetUserHistoryByIdData> get serializer =>
      _$gGetUserHistoryByIdDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserHistoryByIdData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryByIdData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserHistoryByIdData.serializer,
        json,
      );
}

abstract class GGetUserHistoryByIdData_history
    implements
        Built<GGetUserHistoryByIdData_history,
            GGetUserHistoryByIdData_historyBuilder> {
  GGetUserHistoryByIdData_history._();

  factory GGetUserHistoryByIdData_history(
          [Function(GGetUserHistoryByIdData_historyBuilder b) updates]) =
      _$GGetUserHistoryByIdData_history;

  static void _initializeBuilder(GGetUserHistoryByIdData_historyBuilder b) =>
      b..G__typename = 'UserOperationsPaginated';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetUserHistoryByIdData_history_result?>? get result;
  static Serializer<GGetUserHistoryByIdData_history> get serializer =>
      _$gGetUserHistoryByIdDataHistorySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserHistoryByIdData_history.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryByIdData_history? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserHistoryByIdData_history.serializer,
        json,
      );
}

abstract class GGetUserHistoryByIdData_history_result
    implements
        Built<GGetUserHistoryByIdData_history_result,
            GGetUserHistoryByIdData_history_resultBuilder> {
  GGetUserHistoryByIdData_history_result._();

  factory GGetUserHistoryByIdData_history_result(
          [Function(GGetUserHistoryByIdData_history_resultBuilder b) updates]) =
      _$GGetUserHistoryByIdData_history_result;

  static void _initializeBuilder(
          GGetUserHistoryByIdData_history_resultBuilder b) =>
      b..G__typename = 'UserOperation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get createdAt;
  String? get status;
  String? get initiator_type;
  GGetUserHistoryByIdData_history_result_initiator_currency?
      get initiator_currency;
  GGetUserHistoryByIdData_history_result_initiator_payment_interface?
      get initiator_payment_interface;
  String? get initiator_payment_interface_id;
  String? get initiator_amount;
  String? get initiator_explorer_transaction;
  String? get initiator_txid;
  String? get result_txid;
  double? get initiator_fee;
  GGetUserHistoryByIdData_history_result_result_currency? get result_currency;
  String? get result_payment_interface_id;
  String? get result_amount;
  static Serializer<GGetUserHistoryByIdData_history_result> get serializer =>
      _$gGetUserHistoryByIdDataHistoryResultSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserHistoryByIdData_history_result.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryByIdData_history_result? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserHistoryByIdData_history_result.serializer,
        json,
      );
}

abstract class GGetUserHistoryByIdData_history_result_initiator_currency
    implements
        Built<GGetUserHistoryByIdData_history_result_initiator_currency,
            GGetUserHistoryByIdData_history_result_initiator_currencyBuilder> {
  GGetUserHistoryByIdData_history_result_initiator_currency._();

  factory GGetUserHistoryByIdData_history_result_initiator_currency(
      [Function(
              GGetUserHistoryByIdData_history_result_initiator_currencyBuilder
                  b)
          updates]) = _$GGetUserHistoryByIdData_history_result_initiator_currency;

  static void _initializeBuilder(
          GGetUserHistoryByIdData_history_result_initiator_currencyBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  int? get precision;
  String? get icon_url;
  BuiltList<
          GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces?>?
      get currencyPaymentInterfaces;
  static Serializer<GGetUserHistoryByIdData_history_result_initiator_currency>
      get serializer =>
          _$gGetUserHistoryByIdDataHistoryResultInitiatorCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserHistoryByIdData_history_result_initiator_currency.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryByIdData_history_result_initiator_currency? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserHistoryByIdData_history_result_initiator_currency.serializer,
        json,
      );
}

abstract class GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces
    implements
        Built<
            GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces,
            GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfacesBuilder> {
  GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces._();

  factory GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces(
          [Function(
                  GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfacesBuilder
                      b)
              updates]) =
      _$GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces;

  static void _initializeBuilder(
          GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfacesBuilder
              b) =>
      b..G__typename = 'CurrencyPaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get type;
  String? get paymentInterfaceId;
  static Serializer<
          GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces>
      get serializer =>
          _$gGetUserHistoryByIdDataHistoryResultInitiatorCurrencyCurrencyPaymentInterfacesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces
                .serializer,
            json,
          );
}

abstract class GGetUserHistoryByIdData_history_result_initiator_payment_interface
    implements
        Built<
            GGetUserHistoryByIdData_history_result_initiator_payment_interface,
            GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder> {
  GGetUserHistoryByIdData_history_result_initiator_payment_interface._();

  factory GGetUserHistoryByIdData_history_result_initiator_payment_interface(
          [Function(
                  GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder
                      b)
              updates]) =
      _$GGetUserHistoryByIdData_history_result_initiator_payment_interface;

  static void _initializeBuilder(
          GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder
              b) =>
      b..G__typename = 'PaymentInterface';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get title;
  String? get subtitle;
  static Serializer<
          GGetUserHistoryByIdData_history_result_initiator_payment_interface>
      get serializer =>
          _$gGetUserHistoryByIdDataHistoryResultInitiatorPaymentInterfaceSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserHistoryByIdData_history_result_initiator_payment_interface
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryByIdData_history_result_initiator_payment_interface?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetUserHistoryByIdData_history_result_initiator_payment_interface
                .serializer,
            json,
          );
}

abstract class GGetUserHistoryByIdData_history_result_result_currency
    implements
        Built<GGetUserHistoryByIdData_history_result_result_currency,
            GGetUserHistoryByIdData_history_result_result_currencyBuilder> {
  GGetUserHistoryByIdData_history_result_result_currency._();

  factory GGetUserHistoryByIdData_history_result_result_currency(
      [Function(GGetUserHistoryByIdData_history_result_result_currencyBuilder b)
          updates]) = _$GGetUserHistoryByIdData_history_result_result_currency;

  static void _initializeBuilder(
          GGetUserHistoryByIdData_history_result_result_currencyBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  int? get precision;
  String? get icon_url;
  int? get position;
  static Serializer<GGetUserHistoryByIdData_history_result_result_currency>
      get serializer =>
          _$gGetUserHistoryByIdDataHistoryResultResultCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserHistoryByIdData_history_result_result_currency.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryByIdData_history_result_result_currency? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserHistoryByIdData_history_result_result_currency.serializer,
        json,
      );
}

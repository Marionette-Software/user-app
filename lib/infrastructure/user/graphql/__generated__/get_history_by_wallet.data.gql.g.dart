// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_history_by_wallet.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetUserHistoryByIdData> _$gGetUserHistoryByIdDataSerializer =
    new _$GGetUserHistoryByIdDataSerializer();
Serializer<GGetUserHistoryByIdData_history>
    _$gGetUserHistoryByIdDataHistorySerializer =
    new _$GGetUserHistoryByIdData_historySerializer();
Serializer<GGetUserHistoryByIdData_history_result>
    _$gGetUserHistoryByIdDataHistoryResultSerializer =
    new _$GGetUserHistoryByIdData_history_resultSerializer();
Serializer<GGetUserHistoryByIdData_history_result_initiator_currency>
    _$gGetUserHistoryByIdDataHistoryResultInitiatorCurrencySerializer =
    new _$GGetUserHistoryByIdData_history_result_initiator_currencySerializer();
Serializer<
        GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces>
    _$gGetUserHistoryByIdDataHistoryResultInitiatorCurrencyCurrencyPaymentInterfacesSerializer =
    new _$GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfacesSerializer();
Serializer<GGetUserHistoryByIdData_history_result_initiator_payment_interface>
    _$gGetUserHistoryByIdDataHistoryResultInitiatorPaymentInterfaceSerializer =
    new _$GGetUserHistoryByIdData_history_result_initiator_payment_interfaceSerializer();
Serializer<GGetUserHistoryByIdData_history_result_result_currency>
    _$gGetUserHistoryByIdDataHistoryResultResultCurrencySerializer =
    new _$GGetUserHistoryByIdData_history_result_result_currencySerializer();

class _$GGetUserHistoryByIdDataSerializer
    implements StructuredSerializer<GGetUserHistoryByIdData> {
  @override
  final Iterable<Type> types = const [
    GGetUserHistoryByIdData,
    _$GGetUserHistoryByIdData
  ];
  @override
  final String wireName = 'GGetUserHistoryByIdData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserHistoryByIdData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.history;
    if (value != null) {
      result
        ..add('history')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GGetUserHistoryByIdData_history)));
    }
    return result;
  }

  @override
  GGetUserHistoryByIdData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserHistoryByIdDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'history':
          result.history.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetUserHistoryByIdData_history))!
              as GGetUserHistoryByIdData_history);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserHistoryByIdData_historySerializer
    implements StructuredSerializer<GGetUserHistoryByIdData_history> {
  @override
  final Iterable<Type> types = const [
    GGetUserHistoryByIdData_history,
    _$GGetUserHistoryByIdData_history
  ];
  @override
  final String wireName = 'GGetUserHistoryByIdData_history';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserHistoryByIdData_history object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.result;
    if (value != null) {
      result
        ..add('result')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GGetUserHistoryByIdData_history_result)
            ])));
    }
    return result;
  }

  @override
  GGetUserHistoryByIdData_history deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserHistoryByIdData_historyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'result':
          result.result.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GGetUserHistoryByIdData_history_result)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserHistoryByIdData_history_resultSerializer
    implements StructuredSerializer<GGetUserHistoryByIdData_history_result> {
  @override
  final Iterable<Type> types = const [
    GGetUserHistoryByIdData_history_result,
    _$GGetUserHistoryByIdData_history_result
  ];
  @override
  final String wireName = 'GGetUserHistoryByIdData_history_result';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserHistoryByIdData_history_result object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.initiator_type;
    if (value != null) {
      result
        ..add('initiator_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.initiator_currency;
    if (value != null) {
      result
        ..add('initiator_currency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetUserHistoryByIdData_history_result_initiator_currency)));
    }
    value = object.initiator_payment_interface;
    if (value != null) {
      result
        ..add('initiator_payment_interface')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetUserHistoryByIdData_history_result_initiator_payment_interface)));
    }
    value = object.initiator_payment_interface_id;
    if (value != null) {
      result
        ..add('initiator_payment_interface_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.initiator_amount;
    if (value != null) {
      result
        ..add('initiator_amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.initiator_explorer_transaction;
    if (value != null) {
      result
        ..add('initiator_explorer_transaction')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.initiator_txid;
    if (value != null) {
      result
        ..add('initiator_txid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.result_txid;
    if (value != null) {
      result
        ..add('result_txid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.initiator_fee;
    if (value != null) {
      result
        ..add('initiator_fee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.result_currency;
    if (value != null) {
      result
        ..add('result_currency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetUserHistoryByIdData_history_result_result_currency)));
    }
    value = object.result_payment_interface_id;
    if (value != null) {
      result
        ..add('result_payment_interface_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.result_amount;
    if (value != null) {
      result
        ..add('result_amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetUserHistoryByIdData_history_result deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserHistoryByIdData_history_resultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'initiator_type':
          result.initiator_type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'initiator_currency':
          result.initiator_currency.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetUserHistoryByIdData_history_result_initiator_currency))!
              as GGetUserHistoryByIdData_history_result_initiator_currency);
          break;
        case 'initiator_payment_interface':
          result.initiator_payment_interface.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      GGetUserHistoryByIdData_history_result_initiator_payment_interface))!
              as GGetUserHistoryByIdData_history_result_initiator_payment_interface);
          break;
        case 'initiator_payment_interface_id':
          result.initiator_payment_interface_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'initiator_amount':
          result.initiator_amount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'initiator_explorer_transaction':
          result.initiator_explorer_transaction = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'initiator_txid':
          result.initiator_txid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'result_txid':
          result.result_txid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'initiator_fee':
          result.initiator_fee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'result_currency':
          result.result_currency.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetUserHistoryByIdData_history_result_result_currency))!
              as GGetUserHistoryByIdData_history_result_result_currency);
          break;
        case 'result_payment_interface_id':
          result.result_payment_interface_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'result_amount':
          result.result_amount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserHistoryByIdData_history_result_initiator_currencySerializer
    implements
        StructuredSerializer<
            GGetUserHistoryByIdData_history_result_initiator_currency> {
  @override
  final Iterable<Type> types = const [
    GGetUserHistoryByIdData_history_result_initiator_currency,
    _$GGetUserHistoryByIdData_history_result_initiator_currency
  ];
  @override
  final String wireName =
      'GGetUserHistoryByIdData_history_result_initiator_currency';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetUserHistoryByIdData_history_result_initiator_currency object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.precision;
    if (value != null) {
      result
        ..add('precision')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.icon_url;
    if (value != null) {
      result
        ..add('icon_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.currencyPaymentInterfaces;
    if (value != null) {
      result
        ..add('currencyPaymentInterfaces')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces)
            ])));
    }
    return result;
  }

  @override
  GGetUserHistoryByIdData_history_result_initiator_currency deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetUserHistoryByIdData_history_result_initiator_currencyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'precision':
          result.precision = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'icon_url':
          result.icon_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'currencyPaymentInterfaces':
          result.currencyPaymentInterfaces
              .replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType.nullable(
                        GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces)
                  ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfacesSerializer
    implements
        StructuredSerializer<
            GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces> {
  @override
  final Iterable<Type> types = const [
    GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces,
    _$GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces
  ];
  @override
  final String wireName =
      'GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentInterfaceId;
    if (value != null) {
      result
        ..add('paymentInterfaceId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfacesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'paymentInterfaceId':
          result.paymentInterfaceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserHistoryByIdData_history_result_initiator_payment_interfaceSerializer
    implements
        StructuredSerializer<
            GGetUserHistoryByIdData_history_result_initiator_payment_interface> {
  @override
  final Iterable<Type> types = const [
    GGetUserHistoryByIdData_history_result_initiator_payment_interface,
    _$GGetUserHistoryByIdData_history_result_initiator_payment_interface
  ];
  @override
  final String wireName =
      'GGetUserHistoryByIdData_history_result_initiator_payment_interface';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetUserHistoryByIdData_history_result_initiator_payment_interface object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subtitle;
    if (value != null) {
      result
        ..add('subtitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetUserHistoryByIdData_history_result_initiator_payment_interface
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'subtitle':
          result.subtitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserHistoryByIdData_history_result_result_currencySerializer
    implements
        StructuredSerializer<
            GGetUserHistoryByIdData_history_result_result_currency> {
  @override
  final Iterable<Type> types = const [
    GGetUserHistoryByIdData_history_result_result_currency,
    _$GGetUserHistoryByIdData_history_result_result_currency
  ];
  @override
  final String wireName =
      'GGetUserHistoryByIdData_history_result_result_currency';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetUserHistoryByIdData_history_result_result_currency object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.precision;
    if (value != null) {
      result
        ..add('precision')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.icon_url;
    if (value != null) {
      result
        ..add('icon_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.position;
    if (value != null) {
      result
        ..add('position')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GGetUserHistoryByIdData_history_result_result_currency deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetUserHistoryByIdData_history_result_result_currencyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'precision':
          result.precision = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'icon_url':
          result.icon_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'position':
          result.position = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserHistoryByIdData extends GGetUserHistoryByIdData {
  @override
  final String G__typename;
  @override
  final GGetUserHistoryByIdData_history? history;

  factory _$GGetUserHistoryByIdData(
          [void Function(GGetUserHistoryByIdDataBuilder)? updates]) =>
      (new GGetUserHistoryByIdDataBuilder()..update(updates))._build();

  _$GGetUserHistoryByIdData._({required this.G__typename, this.history})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUserHistoryByIdData', 'G__typename');
  }

  @override
  GGetUserHistoryByIdData rebuild(
          void Function(GGetUserHistoryByIdDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserHistoryByIdDataBuilder toBuilder() =>
      new GGetUserHistoryByIdDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserHistoryByIdData &&
        G__typename == other.G__typename &&
        history == other.history;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, history.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserHistoryByIdData')
          ..add('G__typename', G__typename)
          ..add('history', history))
        .toString();
  }
}

class GGetUserHistoryByIdDataBuilder
    implements
        Builder<GGetUserHistoryByIdData, GGetUserHistoryByIdDataBuilder> {
  _$GGetUserHistoryByIdData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetUserHistoryByIdData_historyBuilder? _history;
  GGetUserHistoryByIdData_historyBuilder get history =>
      _$this._history ??= new GGetUserHistoryByIdData_historyBuilder();
  set history(GGetUserHistoryByIdData_historyBuilder? history) =>
      _$this._history = history;

  GGetUserHistoryByIdDataBuilder() {
    GGetUserHistoryByIdData._initializeBuilder(this);
  }

  GGetUserHistoryByIdDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _history = $v.history?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserHistoryByIdData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserHistoryByIdData;
  }

  @override
  void update(void Function(GGetUserHistoryByIdDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserHistoryByIdData build() => _build();

  _$GGetUserHistoryByIdData _build() {
    _$GGetUserHistoryByIdData _$result;
    try {
      _$result = _$v ??
          new _$GGetUserHistoryByIdData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetUserHistoryByIdData', 'G__typename'),
              history: _history?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'history';
        _history?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUserHistoryByIdData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserHistoryByIdData_history
    extends GGetUserHistoryByIdData_history {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetUserHistoryByIdData_history_result?>? result;

  factory _$GGetUserHistoryByIdData_history(
          [void Function(GGetUserHistoryByIdData_historyBuilder)? updates]) =>
      (new GGetUserHistoryByIdData_historyBuilder()..update(updates))._build();

  _$GGetUserHistoryByIdData_history._({required this.G__typename, this.result})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUserHistoryByIdData_history', 'G__typename');
  }

  @override
  GGetUserHistoryByIdData_history rebuild(
          void Function(GGetUserHistoryByIdData_historyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserHistoryByIdData_historyBuilder toBuilder() =>
      new GGetUserHistoryByIdData_historyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserHistoryByIdData_history &&
        G__typename == other.G__typename &&
        result == other.result;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, result.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserHistoryByIdData_history')
          ..add('G__typename', G__typename)
          ..add('result', result))
        .toString();
  }
}

class GGetUserHistoryByIdData_historyBuilder
    implements
        Builder<GGetUserHistoryByIdData_history,
            GGetUserHistoryByIdData_historyBuilder> {
  _$GGetUserHistoryByIdData_history? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetUserHistoryByIdData_history_result?>? _result;
  ListBuilder<GGetUserHistoryByIdData_history_result?> get result =>
      _$this._result ??=
          new ListBuilder<GGetUserHistoryByIdData_history_result?>();
  set result(ListBuilder<GGetUserHistoryByIdData_history_result?>? result) =>
      _$this._result = result;

  GGetUserHistoryByIdData_historyBuilder() {
    GGetUserHistoryByIdData_history._initializeBuilder(this);
  }

  GGetUserHistoryByIdData_historyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _result = $v.result?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserHistoryByIdData_history other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserHistoryByIdData_history;
  }

  @override
  void update(void Function(GGetUserHistoryByIdData_historyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserHistoryByIdData_history build() => _build();

  _$GGetUserHistoryByIdData_history _build() {
    _$GGetUserHistoryByIdData_history _$result;
    try {
      _$result = _$v ??
          new _$GGetUserHistoryByIdData_history._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetUserHistoryByIdData_history', 'G__typename'),
              result: _result?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'result';
        _result?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUserHistoryByIdData_history', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserHistoryByIdData_history_result
    extends GGetUserHistoryByIdData_history_result {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? createdAt;
  @override
  final String? status;
  @override
  final String? initiator_type;
  @override
  final GGetUserHistoryByIdData_history_result_initiator_currency?
      initiator_currency;
  @override
  final GGetUserHistoryByIdData_history_result_initiator_payment_interface?
      initiator_payment_interface;
  @override
  final String? initiator_payment_interface_id;
  @override
  final String? initiator_amount;
  @override
  final String? initiator_explorer_transaction;
  @override
  final String? initiator_txid;
  @override
  final String? result_txid;
  @override
  final double? initiator_fee;
  @override
  final GGetUserHistoryByIdData_history_result_result_currency? result_currency;
  @override
  final String? result_payment_interface_id;
  @override
  final String? result_amount;

  factory _$GGetUserHistoryByIdData_history_result(
          [void Function(GGetUserHistoryByIdData_history_resultBuilder)?
              updates]) =>
      (new GGetUserHistoryByIdData_history_resultBuilder()..update(updates))
          ._build();

  _$GGetUserHistoryByIdData_history_result._(
      {required this.G__typename,
      this.id,
      this.createdAt,
      this.status,
      this.initiator_type,
      this.initiator_currency,
      this.initiator_payment_interface,
      this.initiator_payment_interface_id,
      this.initiator_amount,
      this.initiator_explorer_transaction,
      this.initiator_txid,
      this.result_txid,
      this.initiator_fee,
      this.result_currency,
      this.result_payment_interface_id,
      this.result_amount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUserHistoryByIdData_history_result', 'G__typename');
  }

  @override
  GGetUserHistoryByIdData_history_result rebuild(
          void Function(GGetUserHistoryByIdData_history_resultBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserHistoryByIdData_history_resultBuilder toBuilder() =>
      new GGetUserHistoryByIdData_history_resultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserHistoryByIdData_history_result &&
        G__typename == other.G__typename &&
        id == other.id &&
        createdAt == other.createdAt &&
        status == other.status &&
        initiator_type == other.initiator_type &&
        initiator_currency == other.initiator_currency &&
        initiator_payment_interface == other.initiator_payment_interface &&
        initiator_payment_interface_id ==
            other.initiator_payment_interface_id &&
        initiator_amount == other.initiator_amount &&
        initiator_explorer_transaction ==
            other.initiator_explorer_transaction &&
        initiator_txid == other.initiator_txid &&
        result_txid == other.result_txid &&
        initiator_fee == other.initiator_fee &&
        result_currency == other.result_currency &&
        result_payment_interface_id == other.result_payment_interface_id &&
        result_amount == other.result_amount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, initiator_type.hashCode);
    _$hash = $jc(_$hash, initiator_currency.hashCode);
    _$hash = $jc(_$hash, initiator_payment_interface.hashCode);
    _$hash = $jc(_$hash, initiator_payment_interface_id.hashCode);
    _$hash = $jc(_$hash, initiator_amount.hashCode);
    _$hash = $jc(_$hash, initiator_explorer_transaction.hashCode);
    _$hash = $jc(_$hash, initiator_txid.hashCode);
    _$hash = $jc(_$hash, result_txid.hashCode);
    _$hash = $jc(_$hash, initiator_fee.hashCode);
    _$hash = $jc(_$hash, result_currency.hashCode);
    _$hash = $jc(_$hash, result_payment_interface_id.hashCode);
    _$hash = $jc(_$hash, result_amount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetUserHistoryByIdData_history_result')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('status', status)
          ..add('initiator_type', initiator_type)
          ..add('initiator_currency', initiator_currency)
          ..add('initiator_payment_interface', initiator_payment_interface)
          ..add(
              'initiator_payment_interface_id', initiator_payment_interface_id)
          ..add('initiator_amount', initiator_amount)
          ..add(
              'initiator_explorer_transaction', initiator_explorer_transaction)
          ..add('initiator_txid', initiator_txid)
          ..add('result_txid', result_txid)
          ..add('initiator_fee', initiator_fee)
          ..add('result_currency', result_currency)
          ..add('result_payment_interface_id', result_payment_interface_id)
          ..add('result_amount', result_amount))
        .toString();
  }
}

class GGetUserHistoryByIdData_history_resultBuilder
    implements
        Builder<GGetUserHistoryByIdData_history_result,
            GGetUserHistoryByIdData_history_resultBuilder> {
  _$GGetUserHistoryByIdData_history_result? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _initiator_type;
  String? get initiator_type => _$this._initiator_type;
  set initiator_type(String? initiator_type) =>
      _$this._initiator_type = initiator_type;

  GGetUserHistoryByIdData_history_result_initiator_currencyBuilder?
      _initiator_currency;
  GGetUserHistoryByIdData_history_result_initiator_currencyBuilder
      get initiator_currency => _$this._initiator_currency ??=
          new GGetUserHistoryByIdData_history_result_initiator_currencyBuilder();
  set initiator_currency(
          GGetUserHistoryByIdData_history_result_initiator_currencyBuilder?
              initiator_currency) =>
      _$this._initiator_currency = initiator_currency;

  GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder?
      _initiator_payment_interface;
  GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder
      get initiator_payment_interface => _$this._initiator_payment_interface ??=
          new GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder();
  set initiator_payment_interface(
          GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder?
              initiator_payment_interface) =>
      _$this._initiator_payment_interface = initiator_payment_interface;

  String? _initiator_payment_interface_id;
  String? get initiator_payment_interface_id =>
      _$this._initiator_payment_interface_id;
  set initiator_payment_interface_id(String? initiator_payment_interface_id) =>
      _$this._initiator_payment_interface_id = initiator_payment_interface_id;

  String? _initiator_amount;
  String? get initiator_amount => _$this._initiator_amount;
  set initiator_amount(String? initiator_amount) =>
      _$this._initiator_amount = initiator_amount;

  String? _initiator_explorer_transaction;
  String? get initiator_explorer_transaction =>
      _$this._initiator_explorer_transaction;
  set initiator_explorer_transaction(String? initiator_explorer_transaction) =>
      _$this._initiator_explorer_transaction = initiator_explorer_transaction;

  String? _initiator_txid;
  String? get initiator_txid => _$this._initiator_txid;
  set initiator_txid(String? initiator_txid) =>
      _$this._initiator_txid = initiator_txid;

  String? _result_txid;
  String? get result_txid => _$this._result_txid;
  set result_txid(String? result_txid) => _$this._result_txid = result_txid;

  double? _initiator_fee;
  double? get initiator_fee => _$this._initiator_fee;
  set initiator_fee(double? initiator_fee) =>
      _$this._initiator_fee = initiator_fee;

  GGetUserHistoryByIdData_history_result_result_currencyBuilder?
      _result_currency;
  GGetUserHistoryByIdData_history_result_result_currencyBuilder
      get result_currency => _$this._result_currency ??=
          new GGetUserHistoryByIdData_history_result_result_currencyBuilder();
  set result_currency(
          GGetUserHistoryByIdData_history_result_result_currencyBuilder?
              result_currency) =>
      _$this._result_currency = result_currency;

  String? _result_payment_interface_id;
  String? get result_payment_interface_id =>
      _$this._result_payment_interface_id;
  set result_payment_interface_id(String? result_payment_interface_id) =>
      _$this._result_payment_interface_id = result_payment_interface_id;

  String? _result_amount;
  String? get result_amount => _$this._result_amount;
  set result_amount(String? result_amount) =>
      _$this._result_amount = result_amount;

  GGetUserHistoryByIdData_history_resultBuilder() {
    GGetUserHistoryByIdData_history_result._initializeBuilder(this);
  }

  GGetUserHistoryByIdData_history_resultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _status = $v.status;
      _initiator_type = $v.initiator_type;
      _initiator_currency = $v.initiator_currency?.toBuilder();
      _initiator_payment_interface =
          $v.initiator_payment_interface?.toBuilder();
      _initiator_payment_interface_id = $v.initiator_payment_interface_id;
      _initiator_amount = $v.initiator_amount;
      _initiator_explorer_transaction = $v.initiator_explorer_transaction;
      _initiator_txid = $v.initiator_txid;
      _result_txid = $v.result_txid;
      _initiator_fee = $v.initiator_fee;
      _result_currency = $v.result_currency?.toBuilder();
      _result_payment_interface_id = $v.result_payment_interface_id;
      _result_amount = $v.result_amount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserHistoryByIdData_history_result other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserHistoryByIdData_history_result;
  }

  @override
  void update(
      void Function(GGetUserHistoryByIdData_history_resultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserHistoryByIdData_history_result build() => _build();

  _$GGetUserHistoryByIdData_history_result _build() {
    _$GGetUserHistoryByIdData_history_result _$result;
    try {
      _$result = _$v ??
          new _$GGetUserHistoryByIdData_history_result._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetUserHistoryByIdData_history_result', 'G__typename'),
              id: id,
              createdAt: createdAt,
              status: status,
              initiator_type: initiator_type,
              initiator_currency: _initiator_currency?.build(),
              initiator_payment_interface:
                  _initiator_payment_interface?.build(),
              initiator_payment_interface_id: initiator_payment_interface_id,
              initiator_amount: initiator_amount,
              initiator_explorer_transaction: initiator_explorer_transaction,
              initiator_txid: initiator_txid,
              result_txid: result_txid,
              initiator_fee: initiator_fee,
              result_currency: _result_currency?.build(),
              result_payment_interface_id: result_payment_interface_id,
              result_amount: result_amount);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'initiator_currency';
        _initiator_currency?.build();
        _$failedField = 'initiator_payment_interface';
        _initiator_payment_interface?.build();

        _$failedField = 'result_currency';
        _result_currency?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUserHistoryByIdData_history_result',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserHistoryByIdData_history_result_initiator_currency
    extends GGetUserHistoryByIdData_history_result_initiator_currency {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final int? precision;
  @override
  final String? icon_url;
  @override
  final BuiltList<
          GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces?>?
      currencyPaymentInterfaces;

  factory _$GGetUserHistoryByIdData_history_result_initiator_currency(
          [void Function(
                  GGetUserHistoryByIdData_history_result_initiator_currencyBuilder)?
              updates]) =>
      (new GGetUserHistoryByIdData_history_result_initiator_currencyBuilder()
            ..update(updates))
          ._build();

  _$GGetUserHistoryByIdData_history_result_initiator_currency._(
      {required this.G__typename,
      this.id,
      this.precision,
      this.icon_url,
      this.currencyPaymentInterfaces})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetUserHistoryByIdData_history_result_initiator_currency',
        'G__typename');
  }

  @override
  GGetUserHistoryByIdData_history_result_initiator_currency rebuild(
          void Function(
                  GGetUserHistoryByIdData_history_result_initiator_currencyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserHistoryByIdData_history_result_initiator_currencyBuilder
      toBuilder() =>
          new GGetUserHistoryByIdData_history_result_initiator_currencyBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserHistoryByIdData_history_result_initiator_currency &&
        G__typename == other.G__typename &&
        id == other.id &&
        precision == other.precision &&
        icon_url == other.icon_url &&
        currencyPaymentInterfaces == other.currencyPaymentInterfaces;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, precision.hashCode);
    _$hash = $jc(_$hash, icon_url.hashCode);
    _$hash = $jc(_$hash, currencyPaymentInterfaces.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetUserHistoryByIdData_history_result_initiator_currency')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('precision', precision)
          ..add('icon_url', icon_url)
          ..add('currencyPaymentInterfaces', currencyPaymentInterfaces))
        .toString();
  }
}

class GGetUserHistoryByIdData_history_result_initiator_currencyBuilder
    implements
        Builder<GGetUserHistoryByIdData_history_result_initiator_currency,
            GGetUserHistoryByIdData_history_result_initiator_currencyBuilder> {
  _$GGetUserHistoryByIdData_history_result_initiator_currency? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _precision;
  int? get precision => _$this._precision;
  set precision(int? precision) => _$this._precision = precision;

  String? _icon_url;
  String? get icon_url => _$this._icon_url;
  set icon_url(String? icon_url) => _$this._icon_url = icon_url;

  ListBuilder<
          GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces?>?
      _currencyPaymentInterfaces;
  ListBuilder<
          GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces?>
      get currencyPaymentInterfaces =>
          _$this._currencyPaymentInterfaces ??= new ListBuilder<
              GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces?>();
  set currencyPaymentInterfaces(
          ListBuilder<
                  GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces?>?
              currencyPaymentInterfaces) =>
      _$this._currencyPaymentInterfaces = currencyPaymentInterfaces;

  GGetUserHistoryByIdData_history_result_initiator_currencyBuilder() {
    GGetUserHistoryByIdData_history_result_initiator_currency
        ._initializeBuilder(this);
  }

  GGetUserHistoryByIdData_history_result_initiator_currencyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _precision = $v.precision;
      _icon_url = $v.icon_url;
      _currencyPaymentInterfaces = $v.currencyPaymentInterfaces?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetUserHistoryByIdData_history_result_initiator_currency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserHistoryByIdData_history_result_initiator_currency;
  }

  @override
  void update(
      void Function(
              GGetUserHistoryByIdData_history_result_initiator_currencyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserHistoryByIdData_history_result_initiator_currency build() => _build();

  _$GGetUserHistoryByIdData_history_result_initiator_currency _build() {
    _$GGetUserHistoryByIdData_history_result_initiator_currency _$result;
    try {
      _$result = _$v ??
          new _$GGetUserHistoryByIdData_history_result_initiator_currency._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetUserHistoryByIdData_history_result_initiator_currency',
                  'G__typename'),
              id: id,
              precision: precision,
              icon_url: icon_url,
              currencyPaymentInterfaces: _currencyPaymentInterfaces?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currencyPaymentInterfaces';
        _currencyPaymentInterfaces?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUserHistoryByIdData_history_result_initiator_currency',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces
    extends GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces {
  @override
  final String G__typename;
  @override
  final String? type;
  @override
  final String? paymentInterfaceId;

  factory _$GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces(
          [void Function(
                  GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfacesBuilder)?
              updates]) =>
      (new GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfacesBuilder()
            ..update(updates))
          ._build();

  _$GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces._(
      {required this.G__typename, this.type, this.paymentInterfaceId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces',
        'G__typename');
  }

  @override
  GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces
      rebuild(
              void Function(
                      GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfacesBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfacesBuilder
      toBuilder() =>
          new GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfacesBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces &&
        G__typename == other.G__typename &&
        type == other.type &&
        paymentInterfaceId == other.paymentInterfaceId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, paymentInterfaceId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('paymentInterfaceId', paymentInterfaceId))
        .toString();
  }
}

class GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfacesBuilder
    implements
        Builder<
            GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces,
            GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfacesBuilder> {
  _$GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _paymentInterfaceId;
  String? get paymentInterfaceId => _$this._paymentInterfaceId;
  set paymentInterfaceId(String? paymentInterfaceId) =>
      _$this._paymentInterfaceId = paymentInterfaceId;

  GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfacesBuilder() {
    GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces
        ._initializeBuilder(this);
  }

  GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfacesBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _paymentInterfaceId = $v.paymentInterfaceId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces;
  }

  @override
  void update(
      void Function(
              GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfacesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces
      build() => _build();

  _$GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces
      _build() {
    final _$result = _$v ??
        new _$GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces',
                'G__typename'),
            type: type,
            paymentInterfaceId: paymentInterfaceId);
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserHistoryByIdData_history_result_initiator_payment_interface
    extends GGetUserHistoryByIdData_history_result_initiator_payment_interface {
  @override
  final String G__typename;
  @override
  final String? title;
  @override
  final String? subtitle;

  factory _$GGetUserHistoryByIdData_history_result_initiator_payment_interface(
          [void Function(
                  GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder)?
              updates]) =>
      (new GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder()
            ..update(updates))
          ._build();

  _$GGetUserHistoryByIdData_history_result_initiator_payment_interface._(
      {required this.G__typename, this.title, this.subtitle})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetUserHistoryByIdData_history_result_initiator_payment_interface',
        'G__typename');
  }

  @override
  GGetUserHistoryByIdData_history_result_initiator_payment_interface rebuild(
          void Function(
                  GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder
      toBuilder() =>
          new GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetUserHistoryByIdData_history_result_initiator_payment_interface &&
        G__typename == other.G__typename &&
        title == other.title &&
        subtitle == other.subtitle;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, subtitle.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetUserHistoryByIdData_history_result_initiator_payment_interface')
          ..add('G__typename', G__typename)
          ..add('title', title)
          ..add('subtitle', subtitle))
        .toString();
  }
}

class GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder
    implements
        Builder<
            GGetUserHistoryByIdData_history_result_initiator_payment_interface,
            GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder> {
  _$GGetUserHistoryByIdData_history_result_initiator_payment_interface? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _subtitle;
  String? get subtitle => _$this._subtitle;
  set subtitle(String? subtitle) => _$this._subtitle = subtitle;

  GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder() {
    GGetUserHistoryByIdData_history_result_initiator_payment_interface
        ._initializeBuilder(this);
  }

  GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _title = $v.title;
      _subtitle = $v.subtitle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetUserHistoryByIdData_history_result_initiator_payment_interface
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetUserHistoryByIdData_history_result_initiator_payment_interface;
  }

  @override
  void update(
      void Function(
              GGetUserHistoryByIdData_history_result_initiator_payment_interfaceBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserHistoryByIdData_history_result_initiator_payment_interface build() =>
      _build();

  _$GGetUserHistoryByIdData_history_result_initiator_payment_interface
      _build() {
    final _$result = _$v ??
        new _$GGetUserHistoryByIdData_history_result_initiator_payment_interface
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetUserHistoryByIdData_history_result_initiator_payment_interface',
                'G__typename'),
            title: title,
            subtitle: subtitle);
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserHistoryByIdData_history_result_result_currency
    extends GGetUserHistoryByIdData_history_result_result_currency {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final int? precision;
  @override
  final String? icon_url;
  @override
  final int? position;

  factory _$GGetUserHistoryByIdData_history_result_result_currency(
          [void Function(
                  GGetUserHistoryByIdData_history_result_result_currencyBuilder)?
              updates]) =>
      (new GGetUserHistoryByIdData_history_result_result_currencyBuilder()
            ..update(updates))
          ._build();

  _$GGetUserHistoryByIdData_history_result_result_currency._(
      {required this.G__typename,
      this.id,
      this.precision,
      this.icon_url,
      this.position})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetUserHistoryByIdData_history_result_result_currency',
        'G__typename');
  }

  @override
  GGetUserHistoryByIdData_history_result_result_currency rebuild(
          void Function(
                  GGetUserHistoryByIdData_history_result_result_currencyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserHistoryByIdData_history_result_result_currencyBuilder toBuilder() =>
      new GGetUserHistoryByIdData_history_result_result_currencyBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserHistoryByIdData_history_result_result_currency &&
        G__typename == other.G__typename &&
        id == other.id &&
        precision == other.precision &&
        icon_url == other.icon_url &&
        position == other.position;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, precision.hashCode);
    _$hash = $jc(_$hash, icon_url.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetUserHistoryByIdData_history_result_result_currency')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('precision', precision)
          ..add('icon_url', icon_url)
          ..add('position', position))
        .toString();
  }
}

class GGetUserHistoryByIdData_history_result_result_currencyBuilder
    implements
        Builder<GGetUserHistoryByIdData_history_result_result_currency,
            GGetUserHistoryByIdData_history_result_result_currencyBuilder> {
  _$GGetUserHistoryByIdData_history_result_result_currency? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _precision;
  int? get precision => _$this._precision;
  set precision(int? precision) => _$this._precision = precision;

  String? _icon_url;
  String? get icon_url => _$this._icon_url;
  set icon_url(String? icon_url) => _$this._icon_url = icon_url;

  int? _position;
  int? get position => _$this._position;
  set position(int? position) => _$this._position = position;

  GGetUserHistoryByIdData_history_result_result_currencyBuilder() {
    GGetUserHistoryByIdData_history_result_result_currency._initializeBuilder(
        this);
  }

  GGetUserHistoryByIdData_history_result_result_currencyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _precision = $v.precision;
      _icon_url = $v.icon_url;
      _position = $v.position;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserHistoryByIdData_history_result_result_currency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserHistoryByIdData_history_result_result_currency;
  }

  @override
  void update(
      void Function(
              GGetUserHistoryByIdData_history_result_result_currencyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserHistoryByIdData_history_result_result_currency build() => _build();

  _$GGetUserHistoryByIdData_history_result_result_currency _build() {
    final _$result = _$v ??
        new _$GGetUserHistoryByIdData_history_result_result_currency._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetUserHistoryByIdData_history_result_result_currency',
                'G__typename'),
            id: id,
            precision: precision,
            icon_url: icon_url,
            position: position);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

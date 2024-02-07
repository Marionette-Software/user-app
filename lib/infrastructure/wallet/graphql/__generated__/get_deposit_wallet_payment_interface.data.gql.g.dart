// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_deposit_wallet_payment_interface.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetDepositWalletPaymentInterfaceData>
    _$gGetDepositWalletPaymentInterfaceDataSerializer =
    new _$GGetDepositWalletPaymentInterfaceDataSerializer();
Serializer<GGetDepositWalletPaymentInterfaceData_currency>
    _$gGetDepositWalletPaymentInterfaceDataCurrencySerializer =
    new _$GGetDepositWalletPaymentInterfaceData_currencySerializer();
Serializer<
        GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces>
    _$gGetDepositWalletPaymentInterfaceDataCurrencyCurrencyPaymentInterfacesSerializer =
    new _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfacesSerializer();
Serializer<
        GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface>
    _$gGetDepositWalletPaymentInterfaceDataCurrencyCurrencyPaymentInterfacesPaymentInterfaceSerializer =
    new _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceSerializer();
Serializer<
        GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency>
    _$gGetDepositWalletPaymentInterfaceDataCurrencyCurrencyPaymentInterfacesCurrencySerializer =
    new _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencySerializer();

class _$GGetDepositWalletPaymentInterfaceDataSerializer
    implements StructuredSerializer<GGetDepositWalletPaymentInterfaceData> {
  @override
  final Iterable<Type> types = const [
    GGetDepositWalletPaymentInterfaceData,
    _$GGetDepositWalletPaymentInterfaceData
  ];
  @override
  final String wireName = 'GGetDepositWalletPaymentInterfaceData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetDepositWalletPaymentInterfaceData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.currency;
    if (value != null) {
      result
        ..add('currency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetDepositWalletPaymentInterfaceData_currency)));
    }
    return result;
  }

  @override
  GGetDepositWalletPaymentInterfaceData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetDepositWalletPaymentInterfaceDataBuilder();

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
        case 'currency':
          result.currency.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetDepositWalletPaymentInterfaceData_currency))!
              as GGetDepositWalletPaymentInterfaceData_currency);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDepositWalletPaymentInterfaceData_currencySerializer
    implements
        StructuredSerializer<GGetDepositWalletPaymentInterfaceData_currency> {
  @override
  final Iterable<Type> types = const [
    GGetDepositWalletPaymentInterfaceData_currency,
    _$GGetDepositWalletPaymentInterfaceData_currency
  ];
  @override
  final String wireName = 'GGetDepositWalletPaymentInterfaceData_currency';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetDepositWalletPaymentInterfaceData_currency object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.currencyPaymentInterfaces;
    if (value != null) {
      result
        ..add('currencyPaymentInterfaces')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces)
            ])));
    }
    return result;
  }

  @override
  GGetDepositWalletPaymentInterfaceData_currency deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetDepositWalletPaymentInterfaceData_currencyBuilder();

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
        case 'currencyPaymentInterfaces':
          result.currencyPaymentInterfaces
              .replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType.nullable(
                        GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces)
                  ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfacesSerializer
    implements
        StructuredSerializer<
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces> {
  @override
  final Iterable<Type> types = const [
    GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces,
    _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces
  ];
  @override
  final String wireName =
      'GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.userDepositEnable;
    if (value != null) {
      result
        ..add('userDepositEnable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.userDirectDepositEnabled;
    if (value != null) {
      result
        ..add('userDirectDepositEnabled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.enable;
    if (value != null) {
      result
        ..add('enable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.minDirectDepositAmount;
    if (value != null) {
      result
        ..add('minDirectDepositAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentInterface;
    if (value != null) {
      result
        ..add('paymentInterface')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface)));
    }
    value = object.currency;
    if (value != null) {
      result
        ..add('currency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency)));
    }
    return result;
  }

  @override
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfacesBuilder();

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
        case 'userDepositEnable':
          result.userDepositEnable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'userDirectDepositEnabled':
          result.userDirectDepositEnabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'enable':
          result.enable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'minDirectDepositAmount':
          result.minDirectDepositAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'paymentInterface':
          result.paymentInterface.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface))!
              as GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface);
          break;
        case 'currency':
          result.currency.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency))!
              as GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceSerializer
    implements
        StructuredSerializer<
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface> {
  @override
  final Iterable<Type> types = const [
    GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface,
    _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface
  ];
  @override
  final String wireName =
      'GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface
          object,
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
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logoUrl;
    if (value != null) {
      result
        ..add('logoUrl')
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
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'logoUrl':
          result.logoUrl = serializers.deserialize(value,
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

class _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencySerializer
    implements
        StructuredSerializer<
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency> {
  @override
  final Iterable<Type> types = const [
    GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency,
    _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency
  ];
  @override
  final String wireName =
      'GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency
          object,
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
    value = object.icon_url;
    if (value != null) {
      result
        ..add('icon_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder();

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
        case 'icon_url':
          result.icon_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDepositWalletPaymentInterfaceData
    extends GGetDepositWalletPaymentInterfaceData {
  @override
  final String G__typename;
  @override
  final GGetDepositWalletPaymentInterfaceData_currency? currency;

  factory _$GGetDepositWalletPaymentInterfaceData(
          [void Function(GGetDepositWalletPaymentInterfaceDataBuilder)?
              updates]) =>
      (new GGetDepositWalletPaymentInterfaceDataBuilder()..update(updates))
          ._build();

  _$GGetDepositWalletPaymentInterfaceData._(
      {required this.G__typename, this.currency})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetDepositWalletPaymentInterfaceData', 'G__typename');
  }

  @override
  GGetDepositWalletPaymentInterfaceData rebuild(
          void Function(GGetDepositWalletPaymentInterfaceDataBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDepositWalletPaymentInterfaceDataBuilder toBuilder() =>
      new GGetDepositWalletPaymentInterfaceDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetDepositWalletPaymentInterfaceData &&
        G__typename == other.G__typename &&
        currency == other.currency;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetDepositWalletPaymentInterfaceData')
          ..add('G__typename', G__typename)
          ..add('currency', currency))
        .toString();
  }
}

class GGetDepositWalletPaymentInterfaceDataBuilder
    implements
        Builder<GGetDepositWalletPaymentInterfaceData,
            GGetDepositWalletPaymentInterfaceDataBuilder> {
  _$GGetDepositWalletPaymentInterfaceData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetDepositWalletPaymentInterfaceData_currencyBuilder? _currency;
  GGetDepositWalletPaymentInterfaceData_currencyBuilder get currency =>
      _$this._currency ??=
          new GGetDepositWalletPaymentInterfaceData_currencyBuilder();
  set currency(
          GGetDepositWalletPaymentInterfaceData_currencyBuilder? currency) =>
      _$this._currency = currency;

  GGetDepositWalletPaymentInterfaceDataBuilder() {
    GGetDepositWalletPaymentInterfaceData._initializeBuilder(this);
  }

  GGetDepositWalletPaymentInterfaceDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _currency = $v.currency?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetDepositWalletPaymentInterfaceData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDepositWalletPaymentInterfaceData;
  }

  @override
  void update(
      void Function(GGetDepositWalletPaymentInterfaceDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDepositWalletPaymentInterfaceData build() => _build();

  _$GGetDepositWalletPaymentInterfaceData _build() {
    _$GGetDepositWalletPaymentInterfaceData _$result;
    try {
      _$result = _$v ??
          new _$GGetDepositWalletPaymentInterfaceData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetDepositWalletPaymentInterfaceData', 'G__typename'),
              currency: _currency?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currency';
        _currency?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetDepositWalletPaymentInterfaceData',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetDepositWalletPaymentInterfaceData_currency
    extends GGetDepositWalletPaymentInterfaceData_currency {
  @override
  final String G__typename;
  @override
  final BuiltList<
          GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces?>?
      currencyPaymentInterfaces;

  factory _$GGetDepositWalletPaymentInterfaceData_currency(
          [void Function(GGetDepositWalletPaymentInterfaceData_currencyBuilder)?
              updates]) =>
      (new GGetDepositWalletPaymentInterfaceData_currencyBuilder()
            ..update(updates))
          ._build();

  _$GGetDepositWalletPaymentInterfaceData_currency._(
      {required this.G__typename, this.currencyPaymentInterfaces})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetDepositWalletPaymentInterfaceData_currency', 'G__typename');
  }

  @override
  GGetDepositWalletPaymentInterfaceData_currency rebuild(
          void Function(GGetDepositWalletPaymentInterfaceData_currencyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDepositWalletPaymentInterfaceData_currencyBuilder toBuilder() =>
      new GGetDepositWalletPaymentInterfaceData_currencyBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetDepositWalletPaymentInterfaceData_currency &&
        G__typename == other.G__typename &&
        currencyPaymentInterfaces == other.currencyPaymentInterfaces;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, currencyPaymentInterfaces.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetDepositWalletPaymentInterfaceData_currency')
          ..add('G__typename', G__typename)
          ..add('currencyPaymentInterfaces', currencyPaymentInterfaces))
        .toString();
  }
}

class GGetDepositWalletPaymentInterfaceData_currencyBuilder
    implements
        Builder<GGetDepositWalletPaymentInterfaceData_currency,
            GGetDepositWalletPaymentInterfaceData_currencyBuilder> {
  _$GGetDepositWalletPaymentInterfaceData_currency? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<
          GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces?>?
      _currencyPaymentInterfaces;
  ListBuilder<
          GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces?>
      get currencyPaymentInterfaces =>
          _$this._currencyPaymentInterfaces ??= new ListBuilder<
              GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces?>();
  set currencyPaymentInterfaces(
          ListBuilder<
                  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces?>?
              currencyPaymentInterfaces) =>
      _$this._currencyPaymentInterfaces = currencyPaymentInterfaces;

  GGetDepositWalletPaymentInterfaceData_currencyBuilder() {
    GGetDepositWalletPaymentInterfaceData_currency._initializeBuilder(this);
  }

  GGetDepositWalletPaymentInterfaceData_currencyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _currencyPaymentInterfaces = $v.currencyPaymentInterfaces?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetDepositWalletPaymentInterfaceData_currency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDepositWalletPaymentInterfaceData_currency;
  }

  @override
  void update(
      void Function(GGetDepositWalletPaymentInterfaceData_currencyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDepositWalletPaymentInterfaceData_currency build() => _build();

  _$GGetDepositWalletPaymentInterfaceData_currency _build() {
    _$GGetDepositWalletPaymentInterfaceData_currency _$result;
    try {
      _$result = _$v ??
          new _$GGetDepositWalletPaymentInterfaceData_currency._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetDepositWalletPaymentInterfaceData_currency',
                  'G__typename'),
              currencyPaymentInterfaces: _currencyPaymentInterfaces?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currencyPaymentInterfaces';
        _currencyPaymentInterfaces?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetDepositWalletPaymentInterfaceData_currency',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces
    extends GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces {
  @override
  final String G__typename;
  @override
  final bool? userDepositEnable;
  @override
  final bool? userDirectDepositEnabled;
  @override
  final bool? enable;
  @override
  final String? id;
  @override
  final double? minDirectDepositAmount;
  @override
  final String? type;
  @override
  final GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface?
      paymentInterface;
  @override
  final GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency?
      currency;

  factory _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces(
          [void Function(
                  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfacesBuilder)?
              updates]) =>
      (new GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfacesBuilder()
            ..update(updates))
          ._build();

  _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces._(
      {required this.G__typename,
      this.userDepositEnable,
      this.userDirectDepositEnabled,
      this.enable,
      this.id,
      this.minDirectDepositAmount,
      this.type,
      this.paymentInterface,
      this.currency})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces',
        'G__typename');
  }

  @override
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces rebuild(
          void Function(
                  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfacesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfacesBuilder
      toBuilder() =>
          new GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfacesBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces &&
        G__typename == other.G__typename &&
        userDepositEnable == other.userDepositEnable &&
        userDirectDepositEnabled == other.userDirectDepositEnabled &&
        enable == other.enable &&
        id == other.id &&
        minDirectDepositAmount == other.minDirectDepositAmount &&
        type == other.type &&
        paymentInterface == other.paymentInterface &&
        currency == other.currency;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, userDepositEnable.hashCode);
    _$hash = $jc(_$hash, userDirectDepositEnabled.hashCode);
    _$hash = $jc(_$hash, enable.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, minDirectDepositAmount.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, paymentInterface.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces')
          ..add('G__typename', G__typename)
          ..add('userDepositEnable', userDepositEnable)
          ..add('userDirectDepositEnabled', userDirectDepositEnabled)
          ..add('enable', enable)
          ..add('id', id)
          ..add('minDirectDepositAmount', minDirectDepositAmount)
          ..add('type', type)
          ..add('paymentInterface', paymentInterface)
          ..add('currency', currency))
        .toString();
  }
}

class GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfacesBuilder
    implements
        Builder<
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces,
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfacesBuilder> {
  _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _userDepositEnable;
  bool? get userDepositEnable => _$this._userDepositEnable;
  set userDepositEnable(bool? userDepositEnable) =>
      _$this._userDepositEnable = userDepositEnable;

  bool? _userDirectDepositEnabled;
  bool? get userDirectDepositEnabled => _$this._userDirectDepositEnabled;
  set userDirectDepositEnabled(bool? userDirectDepositEnabled) =>
      _$this._userDirectDepositEnabled = userDirectDepositEnabled;

  bool? _enable;
  bool? get enable => _$this._enable;
  set enable(bool? enable) => _$this._enable = enable;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  double? _minDirectDepositAmount;
  double? get minDirectDepositAmount => _$this._minDirectDepositAmount;
  set minDirectDepositAmount(double? minDirectDepositAmount) =>
      _$this._minDirectDepositAmount = minDirectDepositAmount;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder?
      _paymentInterface;
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
      get paymentInterface => _$this._paymentInterface ??=
          new GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder();
  set paymentInterface(
          GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder?
              paymentInterface) =>
      _$this._paymentInterface = paymentInterface;

  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder?
      _currency;
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder
      get currency => _$this._currency ??=
          new GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder();
  set currency(
          GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder?
              currency) =>
      _$this._currency = currency;

  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfacesBuilder() {
    GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces
        ._initializeBuilder(this);
  }

  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfacesBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userDepositEnable = $v.userDepositEnable;
      _userDirectDepositEnabled = $v.userDirectDepositEnabled;
      _enable = $v.enable;
      _id = $v.id;
      _minDirectDepositAmount = $v.minDirectDepositAmount;
      _type = $v.type;
      _paymentInterface = $v.paymentInterface?.toBuilder();
      _currency = $v.currency?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces;
  }

  @override
  void update(
      void Function(
              GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfacesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces
      build() => _build();

  _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces
      _build() {
    _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces
        _$result;
    try {
      _$result = _$v ??
          new _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces
                  ._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces',
                  'G__typename'),
              userDepositEnable: userDepositEnable,
              userDirectDepositEnabled: userDirectDepositEnabled,
              enable: enable,
              id: id,
              minDirectDepositAmount: minDirectDepositAmount,
              type: type,
              paymentInterface: _paymentInterface?.build(),
              currency: _currency?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'paymentInterface';
        _paymentInterface?.build();
        _$failedField = 'currency';
        _currency?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface
    extends GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? logoUrl;
  @override
  final String? subtitle;

  factory _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface(
          [void Function(
                  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder)?
              updates]) =>
      (new GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder()
            ..update(updates))
          ._build();

  _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface._(
      {required this.G__typename,
      this.id,
      this.title,
      this.logoUrl,
      this.subtitle})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface',
        'G__typename');
  }

  @override
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface
      rebuild(
              void Function(
                      GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
      toBuilder() =>
          new GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        logoUrl == other.logoUrl &&
        subtitle == other.subtitle;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, logoUrl.hashCode);
    _$hash = $jc(_$hash, subtitle.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('logoUrl', logoUrl)
          ..add('subtitle', subtitle))
        .toString();
  }
}

class GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
    implements
        Builder<
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface,
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder> {
  _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _logoUrl;
  String? get logoUrl => _$this._logoUrl;
  set logoUrl(String? logoUrl) => _$this._logoUrl = logoUrl;

  String? _subtitle;
  String? get subtitle => _$this._subtitle;
  set subtitle(String? subtitle) => _$this._subtitle = subtitle;

  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder() {
    GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface
        ._initializeBuilder(this);
  }

  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _logoUrl = $v.logoUrl;
      _subtitle = $v.subtitle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface;
  }

  @override
  void update(
      void Function(
              GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterfaceBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface
      build() => _build();

  _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface
      _build() {
    final _$result = _$v ??
        new _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface',
                'G__typename'),
            id: id,
            title: title,
            logoUrl: logoUrl,
            subtitle: subtitle);
    replace(_$result);
    return _$result;
  }
}

class _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency
    extends GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? icon_url;

  factory _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency(
          [void Function(
                  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder)?
              updates]) =>
      (new GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder()
            ..update(updates))
          ._build();

  _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency._(
      {required this.G__typename, this.id, this.icon_url})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency',
        'G__typename');
  }

  @override
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency
      rebuild(
              void Function(
                      GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder
      toBuilder() =>
          new GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency &&
        G__typename == other.G__typename &&
        id == other.id &&
        icon_url == other.icon_url;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, icon_url.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('icon_url', icon_url))
        .toString();
  }
}

class GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder
    implements
        Builder<
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency,
            GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder> {
  _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _icon_url;
  String? get icon_url => _$this._icon_url;
  set icon_url(String? icon_url) => _$this._icon_url = icon_url;

  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder() {
    GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency
        ._initializeBuilder(this);
  }

  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _icon_url = $v.icon_url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency;
  }

  @override
  void update(
      void Function(
              GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currencyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency
      build() => _build();

  _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency
      _build() {
    final _$result = _$v ??
        new _$GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency',
                'G__typename'),
            id: id,
            icon_url: icon_url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

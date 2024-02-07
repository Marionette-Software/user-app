// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_currency_chains_by_id.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetCurrencyChainsDataData> _$gGetCurrencyChainsDataDataSerializer =
    new _$GGetCurrencyChainsDataDataSerializer();
Serializer<GGetCurrencyChainsDataData_currencyChains>
    _$gGetCurrencyChainsDataDataCurrencyChainsSerializer =
    new _$GGetCurrencyChainsDataData_currencyChainsSerializer();
Serializer<GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces>
    _$gGetCurrencyChainsDataDataCurrencyChainsCurrencyPaymentInterfacesSerializer =
    new _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfacesSerializer();
Serializer<
        GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface>
    _$gGetCurrencyChainsDataDataCurrencyChainsCurrencyPaymentInterfacesPaymentInterfaceSerializer =
    new _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceSerializer();

class _$GGetCurrencyChainsDataDataSerializer
    implements StructuredSerializer<GGetCurrencyChainsDataData> {
  @override
  final Iterable<Type> types = const [
    GGetCurrencyChainsDataData,
    _$GGetCurrencyChainsDataData
  ];
  @override
  final String wireName = 'GGetCurrencyChainsDataData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetCurrencyChainsDataData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.currencyChains;
    if (value != null) {
      result
        ..add('currencyChains')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GGetCurrencyChainsDataData_currencyChains)
            ])));
    }
    return result;
  }

  @override
  GGetCurrencyChainsDataData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetCurrencyChainsDataDataBuilder();

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
        case 'currencyChains':
          result.currencyChains.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GGetCurrencyChainsDataData_currencyChains)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetCurrencyChainsDataData_currencyChainsSerializer
    implements StructuredSerializer<GGetCurrencyChainsDataData_currencyChains> {
  @override
  final Iterable<Type> types = const [
    GGetCurrencyChainsDataData_currencyChains,
    _$GGetCurrencyChainsDataData_currencyChains
  ];
  @override
  final String wireName = 'GGetCurrencyChainsDataData_currencyChains';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetCurrencyChainsDataData_currencyChains object,
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
    value = object.subtitle;
    if (value != null) {
      result
        ..add('subtitle')
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
                  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces)
            ])));
    }
    return result;
  }

  @override
  GGetCurrencyChainsDataData_currencyChains deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetCurrencyChainsDataData_currencyChainsBuilder();

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
        case 'subtitle':
          result.subtitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'currencyPaymentInterfaces':
          result.currencyPaymentInterfaces
              .replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType.nullable(
                        GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces)
                  ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfacesSerializer
    implements
        StructuredSerializer<
            GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces> {
  @override
  final Iterable<Type> types = const [
    GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces,
    _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces
  ];
  @override
  final String wireName =
      'GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces
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
    value = object.minDirectDepositAmount;
    if (value != null) {
      result
        ..add('minDirectDepositAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.directDepositFee;
    if (value != null) {
      result
        ..add('directDepositFee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minDirectDepositFee;
    if (value != null) {
      result
        ..add('minDirectDepositFee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxDirectDepositFee;
    if (value != null) {
      result
        ..add('maxDirectDepositFee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.paymentInterface;
    if (value != null) {
      result
        ..add('paymentInterface')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface)));
    }
    return result;
  }

  @override
  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfacesBuilder();

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
        case 'minDirectDepositAmount':
          result.minDirectDepositAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'directDepositFee':
          result.directDepositFee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minDirectDepositFee':
          result.minDirectDepositFee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxDirectDepositFee':
          result.maxDirectDepositFee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'paymentInterface':
          result.paymentInterface.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface))!
              as GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceSerializer
    implements
        StructuredSerializer<
            GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface> {
  @override
  final Iterable<Type> types = const [
    GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface,
    _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface
  ];
  @override
  final String wireName =
      'GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.logoUrl;
    if (value != null) {
      result
        ..add('logoUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder();

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
        case 'logoUrl':
          result.logoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$GGetCurrencyChainsDataData extends GGetCurrencyChainsDataData {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetCurrencyChainsDataData_currencyChains?>? currencyChains;

  factory _$GGetCurrencyChainsDataData(
          [void Function(GGetCurrencyChainsDataDataBuilder)? updates]) =>
      (new GGetCurrencyChainsDataDataBuilder()..update(updates))._build();

  _$GGetCurrencyChainsDataData._(
      {required this.G__typename, this.currencyChains})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetCurrencyChainsDataData', 'G__typename');
  }

  @override
  GGetCurrencyChainsDataData rebuild(
          void Function(GGetCurrencyChainsDataDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetCurrencyChainsDataDataBuilder toBuilder() =>
      new GGetCurrencyChainsDataDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetCurrencyChainsDataData &&
        G__typename == other.G__typename &&
        currencyChains == other.currencyChains;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, currencyChains.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetCurrencyChainsDataData')
          ..add('G__typename', G__typename)
          ..add('currencyChains', currencyChains))
        .toString();
  }
}

class GGetCurrencyChainsDataDataBuilder
    implements
        Builder<GGetCurrencyChainsDataData, GGetCurrencyChainsDataDataBuilder> {
  _$GGetCurrencyChainsDataData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetCurrencyChainsDataData_currencyChains?>? _currencyChains;
  ListBuilder<GGetCurrencyChainsDataData_currencyChains?> get currencyChains =>
      _$this._currencyChains ??=
          new ListBuilder<GGetCurrencyChainsDataData_currencyChains?>();
  set currencyChains(
          ListBuilder<GGetCurrencyChainsDataData_currencyChains?>?
              currencyChains) =>
      _$this._currencyChains = currencyChains;

  GGetCurrencyChainsDataDataBuilder() {
    GGetCurrencyChainsDataData._initializeBuilder(this);
  }

  GGetCurrencyChainsDataDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _currencyChains = $v.currencyChains?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetCurrencyChainsDataData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetCurrencyChainsDataData;
  }

  @override
  void update(void Function(GGetCurrencyChainsDataDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetCurrencyChainsDataData build() => _build();

  _$GGetCurrencyChainsDataData _build() {
    _$GGetCurrencyChainsDataData _$result;
    try {
      _$result = _$v ??
          new _$GGetCurrencyChainsDataData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetCurrencyChainsDataData', 'G__typename'),
              currencyChains: _currencyChains?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currencyChains';
        _currencyChains?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetCurrencyChainsDataData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetCurrencyChainsDataData_currencyChains
    extends GGetCurrencyChainsDataData_currencyChains {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final BuiltList<
          GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces?>?
      currencyPaymentInterfaces;

  factory _$GGetCurrencyChainsDataData_currencyChains(
          [void Function(GGetCurrencyChainsDataData_currencyChainsBuilder)?
              updates]) =>
      (new GGetCurrencyChainsDataData_currencyChainsBuilder()..update(updates))
          ._build();

  _$GGetCurrencyChainsDataData_currencyChains._(
      {required this.G__typename,
      this.id,
      this.title,
      this.subtitle,
      this.currencyPaymentInterfaces})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetCurrencyChainsDataData_currencyChains', 'G__typename');
  }

  @override
  GGetCurrencyChainsDataData_currencyChains rebuild(
          void Function(GGetCurrencyChainsDataData_currencyChainsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetCurrencyChainsDataData_currencyChainsBuilder toBuilder() =>
      new GGetCurrencyChainsDataData_currencyChainsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetCurrencyChainsDataData_currencyChains &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        subtitle == other.subtitle &&
        currencyPaymentInterfaces == other.currencyPaymentInterfaces;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, subtitle.hashCode);
    _$hash = $jc(_$hash, currencyPaymentInterfaces.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetCurrencyChainsDataData_currencyChains')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('subtitle', subtitle)
          ..add('currencyPaymentInterfaces', currencyPaymentInterfaces))
        .toString();
  }
}

class GGetCurrencyChainsDataData_currencyChainsBuilder
    implements
        Builder<GGetCurrencyChainsDataData_currencyChains,
            GGetCurrencyChainsDataData_currencyChainsBuilder> {
  _$GGetCurrencyChainsDataData_currencyChains? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _subtitle;
  String? get subtitle => _$this._subtitle;
  set subtitle(String? subtitle) => _$this._subtitle = subtitle;

  ListBuilder<
          GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces?>?
      _currencyPaymentInterfaces;
  ListBuilder<
          GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces?>
      get currencyPaymentInterfaces =>
          _$this._currencyPaymentInterfaces ??= new ListBuilder<
              GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces?>();
  set currencyPaymentInterfaces(
          ListBuilder<
                  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces?>?
              currencyPaymentInterfaces) =>
      _$this._currencyPaymentInterfaces = currencyPaymentInterfaces;

  GGetCurrencyChainsDataData_currencyChainsBuilder() {
    GGetCurrencyChainsDataData_currencyChains._initializeBuilder(this);
  }

  GGetCurrencyChainsDataData_currencyChainsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _subtitle = $v.subtitle;
      _currencyPaymentInterfaces = $v.currencyPaymentInterfaces?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetCurrencyChainsDataData_currencyChains other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetCurrencyChainsDataData_currencyChains;
  }

  @override
  void update(
      void Function(GGetCurrencyChainsDataData_currencyChainsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetCurrencyChainsDataData_currencyChains build() => _build();

  _$GGetCurrencyChainsDataData_currencyChains _build() {
    _$GGetCurrencyChainsDataData_currencyChains _$result;
    try {
      _$result = _$v ??
          new _$GGetCurrencyChainsDataData_currencyChains._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetCurrencyChainsDataData_currencyChains', 'G__typename'),
              id: id,
              title: title,
              subtitle: subtitle,
              currencyPaymentInterfaces: _currencyPaymentInterfaces?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currencyPaymentInterfaces';
        _currencyPaymentInterfaces?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetCurrencyChainsDataData_currencyChains',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces
    extends GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final double? minDirectDepositAmount;
  @override
  final double? directDepositFee;
  @override
  final double? minDirectDepositFee;
  @override
  final double? maxDirectDepositFee;
  @override
  final GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface?
      paymentInterface;

  factory _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces(
          [void Function(
                  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfacesBuilder)?
              updates]) =>
      (new GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfacesBuilder()
            ..update(updates))
          ._build();

  _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces._(
      {required this.G__typename,
      this.id,
      this.minDirectDepositAmount,
      this.directDepositFee,
      this.minDirectDepositFee,
      this.maxDirectDepositFee,
      this.paymentInterface})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces',
        'G__typename');
  }

  @override
  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces rebuild(
          void Function(
                  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfacesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfacesBuilder
      toBuilder() =>
          new GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfacesBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces &&
        G__typename == other.G__typename &&
        id == other.id &&
        minDirectDepositAmount == other.minDirectDepositAmount &&
        directDepositFee == other.directDepositFee &&
        minDirectDepositFee == other.minDirectDepositFee &&
        maxDirectDepositFee == other.maxDirectDepositFee &&
        paymentInterface == other.paymentInterface;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, minDirectDepositAmount.hashCode);
    _$hash = $jc(_$hash, directDepositFee.hashCode);
    _$hash = $jc(_$hash, minDirectDepositFee.hashCode);
    _$hash = $jc(_$hash, maxDirectDepositFee.hashCode);
    _$hash = $jc(_$hash, paymentInterface.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('minDirectDepositAmount', minDirectDepositAmount)
          ..add('directDepositFee', directDepositFee)
          ..add('minDirectDepositFee', minDirectDepositFee)
          ..add('maxDirectDepositFee', maxDirectDepositFee)
          ..add('paymentInterface', paymentInterface))
        .toString();
  }
}

class GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfacesBuilder
    implements
        Builder<
            GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces,
            GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfacesBuilder> {
  _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  double? _minDirectDepositAmount;
  double? get minDirectDepositAmount => _$this._minDirectDepositAmount;
  set minDirectDepositAmount(double? minDirectDepositAmount) =>
      _$this._minDirectDepositAmount = minDirectDepositAmount;

  double? _directDepositFee;
  double? get directDepositFee => _$this._directDepositFee;
  set directDepositFee(double? directDepositFee) =>
      _$this._directDepositFee = directDepositFee;

  double? _minDirectDepositFee;
  double? get minDirectDepositFee => _$this._minDirectDepositFee;
  set minDirectDepositFee(double? minDirectDepositFee) =>
      _$this._minDirectDepositFee = minDirectDepositFee;

  double? _maxDirectDepositFee;
  double? get maxDirectDepositFee => _$this._maxDirectDepositFee;
  set maxDirectDepositFee(double? maxDirectDepositFee) =>
      _$this._maxDirectDepositFee = maxDirectDepositFee;

  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder?
      _paymentInterface;
  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder
      get paymentInterface => _$this._paymentInterface ??=
          new GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder();
  set paymentInterface(
          GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder?
              paymentInterface) =>
      _$this._paymentInterface = paymentInterface;

  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfacesBuilder() {
    GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces
        ._initializeBuilder(this);
  }

  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfacesBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _minDirectDepositAmount = $v.minDirectDepositAmount;
      _directDepositFee = $v.directDepositFee;
      _minDirectDepositFee = $v.minDirectDepositFee;
      _maxDirectDepositFee = $v.maxDirectDepositFee;
      _paymentInterface = $v.paymentInterface?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces;
  }

  @override
  void update(
      void Function(
              GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfacesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces build() =>
      _build();

  _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces
      _build() {
    _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces
        _$result;
    try {
      _$result = _$v ??
          new _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces
                  ._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces',
                  'G__typename'),
              id: id,
              minDirectDepositAmount: minDirectDepositAmount,
              directDepositFee: directDepositFee,
              minDirectDepositFee: minDirectDepositFee,
              maxDirectDepositFee: maxDirectDepositFee,
              paymentInterface: _paymentInterface?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'paymentInterface';
        _paymentInterface?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface
    extends GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface {
  @override
  final String G__typename;
  @override
  final String? logoUrl;
  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? subtitle;

  factory _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface(
          [void Function(
                  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder)?
              updates]) =>
      (new GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder()
            ..update(updates))
          ._build();

  _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface._(
      {required this.G__typename,
      this.logoUrl,
      this.id,
      this.title,
      this.subtitle})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface',
        'G__typename');
  }

  @override
  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface
      rebuild(
              void Function(
                      GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder
      toBuilder() =>
          new GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface &&
        G__typename == other.G__typename &&
        logoUrl == other.logoUrl &&
        id == other.id &&
        title == other.title &&
        subtitle == other.subtitle;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, logoUrl.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, subtitle.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface')
          ..add('G__typename', G__typename)
          ..add('logoUrl', logoUrl)
          ..add('id', id)
          ..add('title', title)
          ..add('subtitle', subtitle))
        .toString();
  }
}

class GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder
    implements
        Builder<
            GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface,
            GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder> {
  _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _logoUrl;
  String? get logoUrl => _$this._logoUrl;
  set logoUrl(String? logoUrl) => _$this._logoUrl = logoUrl;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _subtitle;
  String? get subtitle => _$this._subtitle;
  set subtitle(String? subtitle) => _$this._subtitle = subtitle;

  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder() {
    GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface
        ._initializeBuilder(this);
  }

  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _logoUrl = $v.logoUrl;
      _id = $v.id;
      _title = $v.title;
      _subtitle = $v.subtitle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface;
  }

  @override
  void update(
      void Function(
              GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterfaceBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface
      build() => _build();

  _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface
      _build() {
    final _$result = _$v ??
        new _$GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface',
                'G__typename'),
            logoUrl: logoUrl,
            id: id,
            title: title,
            subtitle: subtitle);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

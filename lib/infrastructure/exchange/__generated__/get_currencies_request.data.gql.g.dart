// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_currencies_request.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetCurrenciesData> _$gGetCurrenciesDataSerializer =
    new _$GGetCurrenciesDataSerializer();
Serializer<GGetCurrenciesData_currencies>
    _$gGetCurrenciesDataCurrenciesSerializer =
    new _$GGetCurrenciesData_currenciesSerializer();

class _$GGetCurrenciesDataSerializer
    implements StructuredSerializer<GGetCurrenciesData> {
  @override
  final Iterable<Type> types = const [GGetCurrenciesData, _$GGetCurrenciesData];
  @override
  final String wireName = 'GGetCurrenciesData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetCurrenciesData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.currencies;
    if (value != null) {
      result
        ..add('currencies')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GGetCurrenciesData_currencies)
            ])));
    }
    return result;
  }

  @override
  GGetCurrenciesData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetCurrenciesDataBuilder();

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
        case 'currencies':
          result.currencies.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GGetCurrenciesData_currencies)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetCurrenciesData_currenciesSerializer
    implements StructuredSerializer<GGetCurrenciesData_currencies> {
  @override
  final Iterable<Type> types = const [
    GGetCurrenciesData_currencies,
    _$GGetCurrenciesData_currencies
  ];
  @override
  final String wireName = 'GGetCurrenciesData_currencies';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetCurrenciesData_currencies object,
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
    value = object.name;
    if (value != null) {
      result
        ..add('name')
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
  GGetCurrenciesData_currencies deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetCurrenciesData_currenciesBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
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

class _$GGetCurrenciesData extends GGetCurrenciesData {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetCurrenciesData_currencies?>? currencies;

  factory _$GGetCurrenciesData(
          [void Function(GGetCurrenciesDataBuilder)? updates]) =>
      (new GGetCurrenciesDataBuilder()..update(updates))._build();

  _$GGetCurrenciesData._({required this.G__typename, this.currencies})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetCurrenciesData', 'G__typename');
  }

  @override
  GGetCurrenciesData rebuild(
          void Function(GGetCurrenciesDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetCurrenciesDataBuilder toBuilder() =>
      new GGetCurrenciesDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetCurrenciesData &&
        G__typename == other.G__typename &&
        currencies == other.currencies;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, currencies.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetCurrenciesData')
          ..add('G__typename', G__typename)
          ..add('currencies', currencies))
        .toString();
  }
}

class GGetCurrenciesDataBuilder
    implements Builder<GGetCurrenciesData, GGetCurrenciesDataBuilder> {
  _$GGetCurrenciesData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetCurrenciesData_currencies?>? _currencies;
  ListBuilder<GGetCurrenciesData_currencies?> get currencies =>
      _$this._currencies ??= new ListBuilder<GGetCurrenciesData_currencies?>();
  set currencies(ListBuilder<GGetCurrenciesData_currencies?>? currencies) =>
      _$this._currencies = currencies;

  GGetCurrenciesDataBuilder() {
    GGetCurrenciesData._initializeBuilder(this);
  }

  GGetCurrenciesDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _currencies = $v.currencies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetCurrenciesData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetCurrenciesData;
  }

  @override
  void update(void Function(GGetCurrenciesDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetCurrenciesData build() => _build();

  _$GGetCurrenciesData _build() {
    _$GGetCurrenciesData _$result;
    try {
      _$result = _$v ??
          new _$GGetCurrenciesData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetCurrenciesData', 'G__typename'),
              currencies: _currencies?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currencies';
        _currencies?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetCurrenciesData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetCurrenciesData_currencies extends GGetCurrenciesData_currencies {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? icon_url;

  factory _$GGetCurrenciesData_currencies(
          [void Function(GGetCurrenciesData_currenciesBuilder)? updates]) =>
      (new GGetCurrenciesData_currenciesBuilder()..update(updates))._build();

  _$GGetCurrenciesData_currencies._(
      {required this.G__typename, this.id, this.name, this.icon_url})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetCurrenciesData_currencies', 'G__typename');
  }

  @override
  GGetCurrenciesData_currencies rebuild(
          void Function(GGetCurrenciesData_currenciesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetCurrenciesData_currenciesBuilder toBuilder() =>
      new GGetCurrenciesData_currenciesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetCurrenciesData_currencies &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        icon_url == other.icon_url;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, icon_url.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetCurrenciesData_currencies')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('icon_url', icon_url))
        .toString();
  }
}

class GGetCurrenciesData_currenciesBuilder
    implements
        Builder<GGetCurrenciesData_currencies,
            GGetCurrenciesData_currenciesBuilder> {
  _$GGetCurrenciesData_currencies? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _icon_url;
  String? get icon_url => _$this._icon_url;
  set icon_url(String? icon_url) => _$this._icon_url = icon_url;

  GGetCurrenciesData_currenciesBuilder() {
    GGetCurrenciesData_currencies._initializeBuilder(this);
  }

  GGetCurrenciesData_currenciesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _icon_url = $v.icon_url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetCurrenciesData_currencies other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetCurrenciesData_currencies;
  }

  @override
  void update(void Function(GGetCurrenciesData_currenciesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetCurrenciesData_currencies build() => _build();

  _$GGetCurrenciesData_currencies _build() {
    final _$result = _$v ??
        new _$GGetCurrenciesData_currencies._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GGetCurrenciesData_currencies', 'G__typename'),
            id: id,
            name: name,
            icon_url: icon_url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

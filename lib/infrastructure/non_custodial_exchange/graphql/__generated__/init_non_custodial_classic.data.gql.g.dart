// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_non_custodial_classic.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GInitNonCustodialClassicData>
    _$gInitNonCustodialClassicDataSerializer =
    new _$GInitNonCustodialClassicDataSerializer();
Serializer<GInitNonCustodialClassicData_initNonCustodialExchange>
    _$gInitNonCustodialClassicDataInitNonCustodialExchangeSerializer =
    new _$GInitNonCustodialClassicData_initNonCustodialExchangeSerializer();

class _$GInitNonCustodialClassicDataSerializer
    implements StructuredSerializer<GInitNonCustodialClassicData> {
  @override
  final Iterable<Type> types = const [
    GInitNonCustodialClassicData,
    _$GInitNonCustodialClassicData
  ];
  @override
  final String wireName = 'GInitNonCustodialClassicData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GInitNonCustodialClassicData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.initNonCustodialExchange;
    if (value != null) {
      result
        ..add('initNonCustodialExchange')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GInitNonCustodialClassicData_initNonCustodialExchange)));
    }
    return result;
  }

  @override
  GInitNonCustodialClassicData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInitNonCustodialClassicDataBuilder();

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
        case 'initNonCustodialExchange':
          result.initNonCustodialExchange.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GInitNonCustodialClassicData_initNonCustodialExchange))!
              as GInitNonCustodialClassicData_initNonCustodialExchange);
          break;
      }
    }

    return result.build();
  }
}

class _$GInitNonCustodialClassicData_initNonCustodialExchangeSerializer
    implements
        StructuredSerializer<
            GInitNonCustodialClassicData_initNonCustodialExchange> {
  @override
  final Iterable<Type> types = const [
    GInitNonCustodialClassicData_initNonCustodialExchange,
    _$GInitNonCustodialClassicData_initNonCustodialExchange
  ];
  @override
  final String wireName =
      'GInitNonCustodialClassicData_initNonCustodialExchange';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GInitNonCustodialClassicData_initNonCustodialExchange object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.encodedAddress;
    if (value != null) {
      result
        ..add('encodedAddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.redirectUrl;
    if (value != null) {
      result
        ..add('redirectUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GInitNonCustodialClassicData_initNonCustodialExchange deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GInitNonCustodialClassicData_initNonCustodialExchangeBuilder();

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
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'encodedAddress':
          result.encodedAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'redirectUrl':
          result.redirectUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GInitNonCustodialClassicData extends GInitNonCustodialClassicData {
  @override
  final String G__typename;
  @override
  final GInitNonCustodialClassicData_initNonCustodialExchange?
      initNonCustodialExchange;

  factory _$GInitNonCustodialClassicData(
          [void Function(GInitNonCustodialClassicDataBuilder)? updates]) =>
      (new GInitNonCustodialClassicDataBuilder()..update(updates))._build();

  _$GInitNonCustodialClassicData._(
      {required this.G__typename, this.initNonCustodialExchange})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GInitNonCustodialClassicData', 'G__typename');
  }

  @override
  GInitNonCustodialClassicData rebuild(
          void Function(GInitNonCustodialClassicDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInitNonCustodialClassicDataBuilder toBuilder() =>
      new GInitNonCustodialClassicDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInitNonCustodialClassicData &&
        G__typename == other.G__typename &&
        initNonCustodialExchange == other.initNonCustodialExchange;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, initNonCustodialExchange.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GInitNonCustodialClassicData')
          ..add('G__typename', G__typename)
          ..add('initNonCustodialExchange', initNonCustodialExchange))
        .toString();
  }
}

class GInitNonCustodialClassicDataBuilder
    implements
        Builder<GInitNonCustodialClassicData,
            GInitNonCustodialClassicDataBuilder> {
  _$GInitNonCustodialClassicData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GInitNonCustodialClassicData_initNonCustodialExchangeBuilder?
      _initNonCustodialExchange;
  GInitNonCustodialClassicData_initNonCustodialExchangeBuilder
      get initNonCustodialExchange => _$this._initNonCustodialExchange ??=
          new GInitNonCustodialClassicData_initNonCustodialExchangeBuilder();
  set initNonCustodialExchange(
          GInitNonCustodialClassicData_initNonCustodialExchangeBuilder?
              initNonCustodialExchange) =>
      _$this._initNonCustodialExchange = initNonCustodialExchange;

  GInitNonCustodialClassicDataBuilder() {
    GInitNonCustodialClassicData._initializeBuilder(this);
  }

  GInitNonCustodialClassicDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _initNonCustodialExchange = $v.initNonCustodialExchange?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInitNonCustodialClassicData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInitNonCustodialClassicData;
  }

  @override
  void update(void Function(GInitNonCustodialClassicDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GInitNonCustodialClassicData build() => _build();

  _$GInitNonCustodialClassicData _build() {
    _$GInitNonCustodialClassicData _$result;
    try {
      _$result = _$v ??
          new _$GInitNonCustodialClassicData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GInitNonCustodialClassicData', 'G__typename'),
              initNonCustodialExchange: _initNonCustodialExchange?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'initNonCustodialExchange';
        _initNonCustodialExchange?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GInitNonCustodialClassicData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GInitNonCustodialClassicData_initNonCustodialExchange
    extends GInitNonCustodialClassicData_initNonCustodialExchange {
  @override
  final String G__typename;
  @override
  final String? address;
  @override
  final String? encodedAddress;
  @override
  final String? redirectUrl;

  factory _$GInitNonCustodialClassicData_initNonCustodialExchange(
          [void Function(
                  GInitNonCustodialClassicData_initNonCustodialExchangeBuilder)?
              updates]) =>
      (new GInitNonCustodialClassicData_initNonCustodialExchangeBuilder()
            ..update(updates))
          ._build();

  _$GInitNonCustodialClassicData_initNonCustodialExchange._(
      {required this.G__typename,
      this.address,
      this.encodedAddress,
      this.redirectUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GInitNonCustodialClassicData_initNonCustodialExchange',
        'G__typename');
  }

  @override
  GInitNonCustodialClassicData_initNonCustodialExchange rebuild(
          void Function(
                  GInitNonCustodialClassicData_initNonCustodialExchangeBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInitNonCustodialClassicData_initNonCustodialExchangeBuilder toBuilder() =>
      new GInitNonCustodialClassicData_initNonCustodialExchangeBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInitNonCustodialClassicData_initNonCustodialExchange &&
        G__typename == other.G__typename &&
        address == other.address &&
        encodedAddress == other.encodedAddress &&
        redirectUrl == other.redirectUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, encodedAddress.hashCode);
    _$hash = $jc(_$hash, redirectUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GInitNonCustodialClassicData_initNonCustodialExchange')
          ..add('G__typename', G__typename)
          ..add('address', address)
          ..add('encodedAddress', encodedAddress)
          ..add('redirectUrl', redirectUrl))
        .toString();
  }
}

class GInitNonCustodialClassicData_initNonCustodialExchangeBuilder
    implements
        Builder<GInitNonCustodialClassicData_initNonCustodialExchange,
            GInitNonCustodialClassicData_initNonCustodialExchangeBuilder> {
  _$GInitNonCustodialClassicData_initNonCustodialExchange? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _encodedAddress;
  String? get encodedAddress => _$this._encodedAddress;
  set encodedAddress(String? encodedAddress) =>
      _$this._encodedAddress = encodedAddress;

  String? _redirectUrl;
  String? get redirectUrl => _$this._redirectUrl;
  set redirectUrl(String? redirectUrl) => _$this._redirectUrl = redirectUrl;

  GInitNonCustodialClassicData_initNonCustodialExchangeBuilder() {
    GInitNonCustodialClassicData_initNonCustodialExchange._initializeBuilder(
        this);
  }

  GInitNonCustodialClassicData_initNonCustodialExchangeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _address = $v.address;
      _encodedAddress = $v.encodedAddress;
      _redirectUrl = $v.redirectUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInitNonCustodialClassicData_initNonCustodialExchange other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInitNonCustodialClassicData_initNonCustodialExchange;
  }

  @override
  void update(
      void Function(
              GInitNonCustodialClassicData_initNonCustodialExchangeBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GInitNonCustodialClassicData_initNonCustodialExchange build() => _build();

  _$GInitNonCustodialClassicData_initNonCustodialExchange _build() {
    final _$result = _$v ??
        new _$GInitNonCustodialClassicData_initNonCustodialExchange._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GInitNonCustodialClassicData_initNonCustodialExchange',
                'G__typename'),
            address: address,
            encodedAddress: encodedAddress,
            redirectUrl: redirectUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

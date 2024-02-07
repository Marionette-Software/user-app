// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fiat_deposit.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFiatGenerateWalletData> _$gFiatGenerateWalletDataSerializer =
    new _$GFiatGenerateWalletDataSerializer();
Serializer<GFiatGenerateWalletData_generateWallet>
    _$gFiatGenerateWalletDataGenerateWalletSerializer =
    new _$GFiatGenerateWalletData_generateWalletSerializer();
Serializer<GFiatGenerateWalletData_generateWallet_deposit>
    _$gFiatGenerateWalletDataGenerateWalletDepositSerializer =
    new _$GFiatGenerateWalletData_generateWallet_depositSerializer();

class _$GFiatGenerateWalletDataSerializer
    implements StructuredSerializer<GFiatGenerateWalletData> {
  @override
  final Iterable<Type> types = const [
    GFiatGenerateWalletData,
    _$GFiatGenerateWalletData
  ];
  @override
  final String wireName = 'GFiatGenerateWalletData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFiatGenerateWalletData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.generateWallet;
    if (value != null) {
      result
        ..add('generateWallet')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GFiatGenerateWalletData_generateWallet)));
    }
    return result;
  }

  @override
  GFiatGenerateWalletData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFiatGenerateWalletDataBuilder();

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
        case 'generateWallet':
          result.generateWallet.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFiatGenerateWalletData_generateWallet))!
              as GFiatGenerateWalletData_generateWallet);
          break;
      }
    }

    return result.build();
  }
}

class _$GFiatGenerateWalletData_generateWalletSerializer
    implements StructuredSerializer<GFiatGenerateWalletData_generateWallet> {
  @override
  final Iterable<Type> types = const [
    GFiatGenerateWalletData_generateWallet,
    _$GFiatGenerateWalletData_generateWallet
  ];
  @override
  final String wireName = 'GFiatGenerateWalletData_generateWallet';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFiatGenerateWalletData_generateWallet object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.deposit;
    if (value != null) {
      result
        ..add('deposit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GFiatGenerateWalletData_generateWallet_deposit)));
    }
    return result;
  }

  @override
  GFiatGenerateWalletData_generateWallet deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFiatGenerateWalletData_generateWalletBuilder();

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
        case 'deposit':
          result.deposit.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GFiatGenerateWalletData_generateWallet_deposit))!
              as GFiatGenerateWalletData_generateWallet_deposit);
          break;
      }
    }

    return result.build();
  }
}

class _$GFiatGenerateWalletData_generateWallet_depositSerializer
    implements
        StructuredSerializer<GFiatGenerateWalletData_generateWallet_deposit> {
  @override
  final Iterable<Type> types = const [
    GFiatGenerateWalletData_generateWallet_deposit,
    _$GFiatGenerateWalletData_generateWallet_deposit
  ];
  @override
  final String wireName = 'GFiatGenerateWalletData_generateWallet_deposit';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFiatGenerateWalletData_generateWallet_deposit object,
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
    return result;
  }

  @override
  GFiatGenerateWalletData_generateWallet_deposit deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFiatGenerateWalletData_generateWallet_depositBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GFiatGenerateWalletData extends GFiatGenerateWalletData {
  @override
  final String G__typename;
  @override
  final GFiatGenerateWalletData_generateWallet? generateWallet;

  factory _$GFiatGenerateWalletData(
          [void Function(GFiatGenerateWalletDataBuilder)? updates]) =>
      (new GFiatGenerateWalletDataBuilder()..update(updates))._build();

  _$GFiatGenerateWalletData._({required this.G__typename, this.generateWallet})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFiatGenerateWalletData', 'G__typename');
  }

  @override
  GFiatGenerateWalletData rebuild(
          void Function(GFiatGenerateWalletDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFiatGenerateWalletDataBuilder toBuilder() =>
      new GFiatGenerateWalletDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFiatGenerateWalletData &&
        G__typename == other.G__typename &&
        generateWallet == other.generateWallet;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, generateWallet.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFiatGenerateWalletData')
          ..add('G__typename', G__typename)
          ..add('generateWallet', generateWallet))
        .toString();
  }
}

class GFiatGenerateWalletDataBuilder
    implements
        Builder<GFiatGenerateWalletData, GFiatGenerateWalletDataBuilder> {
  _$GFiatGenerateWalletData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GFiatGenerateWalletData_generateWalletBuilder? _generateWallet;
  GFiatGenerateWalletData_generateWalletBuilder get generateWallet =>
      _$this._generateWallet ??=
          new GFiatGenerateWalletData_generateWalletBuilder();
  set generateWallet(
          GFiatGenerateWalletData_generateWalletBuilder? generateWallet) =>
      _$this._generateWallet = generateWallet;

  GFiatGenerateWalletDataBuilder() {
    GFiatGenerateWalletData._initializeBuilder(this);
  }

  GFiatGenerateWalletDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _generateWallet = $v.generateWallet?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFiatGenerateWalletData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFiatGenerateWalletData;
  }

  @override
  void update(void Function(GFiatGenerateWalletDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFiatGenerateWalletData build() => _build();

  _$GFiatGenerateWalletData _build() {
    _$GFiatGenerateWalletData _$result;
    try {
      _$result = _$v ??
          new _$GFiatGenerateWalletData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFiatGenerateWalletData', 'G__typename'),
              generateWallet: _generateWallet?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'generateWallet';
        _generateWallet?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFiatGenerateWalletData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFiatGenerateWalletData_generateWallet
    extends GFiatGenerateWalletData_generateWallet {
  @override
  final String G__typename;
  @override
  final GFiatGenerateWalletData_generateWallet_deposit? deposit;

  factory _$GFiatGenerateWalletData_generateWallet(
          [void Function(GFiatGenerateWalletData_generateWalletBuilder)?
              updates]) =>
      (new GFiatGenerateWalletData_generateWalletBuilder()..update(updates))
          ._build();

  _$GFiatGenerateWalletData_generateWallet._(
      {required this.G__typename, this.deposit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFiatGenerateWalletData_generateWallet', 'G__typename');
  }

  @override
  GFiatGenerateWalletData_generateWallet rebuild(
          void Function(GFiatGenerateWalletData_generateWalletBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFiatGenerateWalletData_generateWalletBuilder toBuilder() =>
      new GFiatGenerateWalletData_generateWalletBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFiatGenerateWalletData_generateWallet &&
        G__typename == other.G__typename &&
        deposit == other.deposit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, deposit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFiatGenerateWalletData_generateWallet')
          ..add('G__typename', G__typename)
          ..add('deposit', deposit))
        .toString();
  }
}

class GFiatGenerateWalletData_generateWalletBuilder
    implements
        Builder<GFiatGenerateWalletData_generateWallet,
            GFiatGenerateWalletData_generateWalletBuilder> {
  _$GFiatGenerateWalletData_generateWallet? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GFiatGenerateWalletData_generateWallet_depositBuilder? _deposit;
  GFiatGenerateWalletData_generateWallet_depositBuilder get deposit =>
      _$this._deposit ??=
          new GFiatGenerateWalletData_generateWallet_depositBuilder();
  set deposit(GFiatGenerateWalletData_generateWallet_depositBuilder? deposit) =>
      _$this._deposit = deposit;

  GFiatGenerateWalletData_generateWalletBuilder() {
    GFiatGenerateWalletData_generateWallet._initializeBuilder(this);
  }

  GFiatGenerateWalletData_generateWalletBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deposit = $v.deposit?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFiatGenerateWalletData_generateWallet other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFiatGenerateWalletData_generateWallet;
  }

  @override
  void update(
      void Function(GFiatGenerateWalletData_generateWalletBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFiatGenerateWalletData_generateWallet build() => _build();

  _$GFiatGenerateWalletData_generateWallet _build() {
    _$GFiatGenerateWalletData_generateWallet _$result;
    try {
      _$result = _$v ??
          new _$GFiatGenerateWalletData_generateWallet._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GFiatGenerateWalletData_generateWallet', 'G__typename'),
              deposit: _deposit?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deposit';
        _deposit?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFiatGenerateWalletData_generateWallet',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFiatGenerateWalletData_generateWallet_deposit
    extends GFiatGenerateWalletData_generateWallet_deposit {
  @override
  final String G__typename;
  @override
  final String? address;
  @override
  final String? encodedAddress;

  factory _$GFiatGenerateWalletData_generateWallet_deposit(
          [void Function(GFiatGenerateWalletData_generateWallet_depositBuilder)?
              updates]) =>
      (new GFiatGenerateWalletData_generateWallet_depositBuilder()
            ..update(updates))
          ._build();

  _$GFiatGenerateWalletData_generateWallet_deposit._(
      {required this.G__typename, this.address, this.encodedAddress})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GFiatGenerateWalletData_generateWallet_deposit', 'G__typename');
  }

  @override
  GFiatGenerateWalletData_generateWallet_deposit rebuild(
          void Function(GFiatGenerateWalletData_generateWallet_depositBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFiatGenerateWalletData_generateWallet_depositBuilder toBuilder() =>
      new GFiatGenerateWalletData_generateWallet_depositBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFiatGenerateWalletData_generateWallet_deposit &&
        G__typename == other.G__typename &&
        address == other.address &&
        encodedAddress == other.encodedAddress;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, encodedAddress.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFiatGenerateWalletData_generateWallet_deposit')
          ..add('G__typename', G__typename)
          ..add('address', address)
          ..add('encodedAddress', encodedAddress))
        .toString();
  }
}

class GFiatGenerateWalletData_generateWallet_depositBuilder
    implements
        Builder<GFiatGenerateWalletData_generateWallet_deposit,
            GFiatGenerateWalletData_generateWallet_depositBuilder> {
  _$GFiatGenerateWalletData_generateWallet_deposit? _$v;

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

  GFiatGenerateWalletData_generateWallet_depositBuilder() {
    GFiatGenerateWalletData_generateWallet_deposit._initializeBuilder(this);
  }

  GFiatGenerateWalletData_generateWallet_depositBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _address = $v.address;
      _encodedAddress = $v.encodedAddress;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFiatGenerateWalletData_generateWallet_deposit other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFiatGenerateWalletData_generateWallet_deposit;
  }

  @override
  void update(
      void Function(GFiatGenerateWalletData_generateWallet_depositBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFiatGenerateWalletData_generateWallet_deposit build() => _build();

  _$GFiatGenerateWalletData_generateWallet_deposit _build() {
    final _$result = _$v ??
        new _$GFiatGenerateWalletData_generateWallet_deposit._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFiatGenerateWalletData_generateWallet_deposit',
                'G__typename'),
            address: address,
            encodedAddress: encodedAddress);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

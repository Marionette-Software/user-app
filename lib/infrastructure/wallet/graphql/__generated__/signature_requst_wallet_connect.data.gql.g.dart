// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signature_requst_wallet_connect.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GsignatureRequestWalletConnectData>
    _$gsignatureRequestWalletConnectDataSerializer =
    new _$GsignatureRequestWalletConnectDataSerializer();
Serializer<GsignatureRequestWalletConnectData_connectWallet>
    _$gsignatureRequestWalletConnectDataConnectWalletSerializer =
    new _$GsignatureRequestWalletConnectData_connectWalletSerializer();

class _$GsignatureRequestWalletConnectDataSerializer
    implements StructuredSerializer<GsignatureRequestWalletConnectData> {
  @override
  final Iterable<Type> types = const [
    GsignatureRequestWalletConnectData,
    _$GsignatureRequestWalletConnectData
  ];
  @override
  final String wireName = 'GsignatureRequestWalletConnectData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GsignatureRequestWalletConnectData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.connectWallet;
    if (value != null) {
      result
        ..add('connectWallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GsignatureRequestWalletConnectData_connectWallet)));
    }
    return result;
  }

  @override
  GsignatureRequestWalletConnectData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GsignatureRequestWalletConnectDataBuilder();

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
        case 'connectWallet':
          result.connectWallet.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GsignatureRequestWalletConnectData_connectWallet))!
              as GsignatureRequestWalletConnectData_connectWallet);
          break;
      }
    }

    return result.build();
  }
}

class _$GsignatureRequestWalletConnectData_connectWalletSerializer
    implements
        StructuredSerializer<GsignatureRequestWalletConnectData_connectWallet> {
  @override
  final Iterable<Type> types = const [
    GsignatureRequestWalletConnectData_connectWallet,
    _$GsignatureRequestWalletConnectData_connectWallet
  ];
  @override
  final String wireName = 'GsignatureRequestWalletConnectData_connectWallet';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GsignatureRequestWalletConnectData_connectWallet object,
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
    return result;
  }

  @override
  GsignatureRequestWalletConnectData_connectWallet deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GsignatureRequestWalletConnectData_connectWalletBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GsignatureRequestWalletConnectData
    extends GsignatureRequestWalletConnectData {
  @override
  final String G__typename;
  @override
  final GsignatureRequestWalletConnectData_connectWallet? connectWallet;

  factory _$GsignatureRequestWalletConnectData(
          [void Function(GsignatureRequestWalletConnectDataBuilder)?
              updates]) =>
      (new GsignatureRequestWalletConnectDataBuilder()..update(updates))
          ._build();

  _$GsignatureRequestWalletConnectData._(
      {required this.G__typename, this.connectWallet})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GsignatureRequestWalletConnectData', 'G__typename');
  }

  @override
  GsignatureRequestWalletConnectData rebuild(
          void Function(GsignatureRequestWalletConnectDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GsignatureRequestWalletConnectDataBuilder toBuilder() =>
      new GsignatureRequestWalletConnectDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GsignatureRequestWalletConnectData &&
        G__typename == other.G__typename &&
        connectWallet == other.connectWallet;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, connectWallet.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GsignatureRequestWalletConnectData')
          ..add('G__typename', G__typename)
          ..add('connectWallet', connectWallet))
        .toString();
  }
}

class GsignatureRequestWalletConnectDataBuilder
    implements
        Builder<GsignatureRequestWalletConnectData,
            GsignatureRequestWalletConnectDataBuilder> {
  _$GsignatureRequestWalletConnectData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GsignatureRequestWalletConnectData_connectWalletBuilder? _connectWallet;
  GsignatureRequestWalletConnectData_connectWalletBuilder get connectWallet =>
      _$this._connectWallet ??=
          new GsignatureRequestWalletConnectData_connectWalletBuilder();
  set connectWallet(
          GsignatureRequestWalletConnectData_connectWalletBuilder?
              connectWallet) =>
      _$this._connectWallet = connectWallet;

  GsignatureRequestWalletConnectDataBuilder() {
    GsignatureRequestWalletConnectData._initializeBuilder(this);
  }

  GsignatureRequestWalletConnectDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _connectWallet = $v.connectWallet?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GsignatureRequestWalletConnectData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GsignatureRequestWalletConnectData;
  }

  @override
  void update(
      void Function(GsignatureRequestWalletConnectDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GsignatureRequestWalletConnectData build() => _build();

  _$GsignatureRequestWalletConnectData _build() {
    _$GsignatureRequestWalletConnectData _$result;
    try {
      _$result = _$v ??
          new _$GsignatureRequestWalletConnectData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GsignatureRequestWalletConnectData', 'G__typename'),
              connectWallet: _connectWallet?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'connectWallet';
        _connectWallet?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GsignatureRequestWalletConnectData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GsignatureRequestWalletConnectData_connectWallet
    extends GsignatureRequestWalletConnectData_connectWallet {
  @override
  final String G__typename;
  @override
  final String? id;

  factory _$GsignatureRequestWalletConnectData_connectWallet(
          [void Function(
                  GsignatureRequestWalletConnectData_connectWalletBuilder)?
              updates]) =>
      (new GsignatureRequestWalletConnectData_connectWalletBuilder()
            ..update(updates))
          ._build();

  _$GsignatureRequestWalletConnectData_connectWallet._(
      {required this.G__typename, this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GsignatureRequestWalletConnectData_connectWallet', 'G__typename');
  }

  @override
  GsignatureRequestWalletConnectData_connectWallet rebuild(
          void Function(GsignatureRequestWalletConnectData_connectWalletBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GsignatureRequestWalletConnectData_connectWalletBuilder toBuilder() =>
      new GsignatureRequestWalletConnectData_connectWalletBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GsignatureRequestWalletConnectData_connectWallet &&
        G__typename == other.G__typename &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GsignatureRequestWalletConnectData_connectWallet')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GsignatureRequestWalletConnectData_connectWalletBuilder
    implements
        Builder<GsignatureRequestWalletConnectData_connectWallet,
            GsignatureRequestWalletConnectData_connectWalletBuilder> {
  _$GsignatureRequestWalletConnectData_connectWallet? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GsignatureRequestWalletConnectData_connectWalletBuilder() {
    GsignatureRequestWalletConnectData_connectWallet._initializeBuilder(this);
  }

  GsignatureRequestWalletConnectData_connectWalletBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GsignatureRequestWalletConnectData_connectWallet other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GsignatureRequestWalletConnectData_connectWallet;
  }

  @override
  void update(
      void Function(GsignatureRequestWalletConnectData_connectWalletBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GsignatureRequestWalletConnectData_connectWallet build() => _build();

  _$GsignatureRequestWalletConnectData_connectWallet _build() {
    final _$result = _$v ??
        new _$GsignatureRequestWalletConnectData_connectWallet._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GsignatureRequestWalletConnectData_connectWallet',
                'G__typename'),
            id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

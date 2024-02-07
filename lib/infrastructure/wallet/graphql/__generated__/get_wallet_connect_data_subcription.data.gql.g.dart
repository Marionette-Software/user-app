// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_wallet_connect_data_subcription.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GconnectToWalletData> _$gconnectToWalletDataSerializer =
    new _$GconnectToWalletDataSerializer();
Serializer<GconnectToWalletData_walletToConnect>
    _$gconnectToWalletDataWalletToConnectSerializer =
    new _$GconnectToWalletData_walletToConnectSerializer();
Serializer<GconnectToWalletData_walletToConnect_paymentInterface>
    _$gconnectToWalletDataWalletToConnectPaymentInterfaceSerializer =
    new _$GconnectToWalletData_walletToConnect_paymentInterfaceSerializer();

class _$GconnectToWalletDataSerializer
    implements StructuredSerializer<GconnectToWalletData> {
  @override
  final Iterable<Type> types = const [
    GconnectToWalletData,
    _$GconnectToWalletData
  ];
  @override
  final String wireName = 'GconnectToWalletData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GconnectToWalletData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.walletToConnect;
    if (value != null) {
      result
        ..add('walletToConnect')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GconnectToWalletData_walletToConnect)));
    }
    return result;
  }

  @override
  GconnectToWalletData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GconnectToWalletDataBuilder();

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
        case 'walletToConnect':
          result.walletToConnect.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GconnectToWalletData_walletToConnect))!
              as GconnectToWalletData_walletToConnect);
          break;
      }
    }

    return result.build();
  }
}

class _$GconnectToWalletData_walletToConnectSerializer
    implements StructuredSerializer<GconnectToWalletData_walletToConnect> {
  @override
  final Iterable<Type> types = const [
    GconnectToWalletData_walletToConnect,
    _$GconnectToWalletData_walletToConnect
  ];
  @override
  final String wireName = 'GconnectToWalletData_walletToConnect';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GconnectToWalletData_walletToConnect object,
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
    value = object.paymentInterface;
    if (value != null) {
      result
        ..add('paymentInterface')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GconnectToWalletData_walletToConnect_paymentInterface)));
    }
    value = object.action;
    if (value != null) {
      result
        ..add('action')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.chainId;
    if (value != null) {
      result
        ..add('chainId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GconnectToWalletData_walletToConnect deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GconnectToWalletData_walletToConnectBuilder();

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
        case 'paymentInterface':
          result.paymentInterface.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GconnectToWalletData_walletToConnect_paymentInterface))!
              as GconnectToWalletData_walletToConnect_paymentInterface);
          break;
        case 'action':
          result.action = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'chainId':
          result.chainId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GconnectToWalletData_walletToConnect_paymentInterfaceSerializer
    implements
        StructuredSerializer<
            GconnectToWalletData_walletToConnect_paymentInterface> {
  @override
  final Iterable<Type> types = const [
    GconnectToWalletData_walletToConnect_paymentInterface,
    _$GconnectToWalletData_walletToConnect_paymentInterface
  ];
  @override
  final String wireName =
      'GconnectToWalletData_walletToConnect_paymentInterface';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GconnectToWalletData_walletToConnect_paymentInterface object,
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
  GconnectToWalletData_walletToConnect_paymentInterface deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GconnectToWalletData_walletToConnect_paymentInterfaceBuilder();

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

class _$GconnectToWalletData extends GconnectToWalletData {
  @override
  final String G__typename;
  @override
  final GconnectToWalletData_walletToConnect? walletToConnect;

  factory _$GconnectToWalletData(
          [void Function(GconnectToWalletDataBuilder)? updates]) =>
      (new GconnectToWalletDataBuilder()..update(updates))._build();

  _$GconnectToWalletData._({required this.G__typename, this.walletToConnect})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GconnectToWalletData', 'G__typename');
  }

  @override
  GconnectToWalletData rebuild(
          void Function(GconnectToWalletDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GconnectToWalletDataBuilder toBuilder() =>
      new GconnectToWalletDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GconnectToWalletData &&
        G__typename == other.G__typename &&
        walletToConnect == other.walletToConnect;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, walletToConnect.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GconnectToWalletData')
          ..add('G__typename', G__typename)
          ..add('walletToConnect', walletToConnect))
        .toString();
  }
}

class GconnectToWalletDataBuilder
    implements Builder<GconnectToWalletData, GconnectToWalletDataBuilder> {
  _$GconnectToWalletData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GconnectToWalletData_walletToConnectBuilder? _walletToConnect;
  GconnectToWalletData_walletToConnectBuilder get walletToConnect =>
      _$this._walletToConnect ??=
          new GconnectToWalletData_walletToConnectBuilder();
  set walletToConnect(
          GconnectToWalletData_walletToConnectBuilder? walletToConnect) =>
      _$this._walletToConnect = walletToConnect;

  GconnectToWalletDataBuilder() {
    GconnectToWalletData._initializeBuilder(this);
  }

  GconnectToWalletDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _walletToConnect = $v.walletToConnect?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GconnectToWalletData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GconnectToWalletData;
  }

  @override
  void update(void Function(GconnectToWalletDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GconnectToWalletData build() => _build();

  _$GconnectToWalletData _build() {
    _$GconnectToWalletData _$result;
    try {
      _$result = _$v ??
          new _$GconnectToWalletData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GconnectToWalletData', 'G__typename'),
              walletToConnect: _walletToConnect?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'walletToConnect';
        _walletToConnect?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GconnectToWalletData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GconnectToWalletData_walletToConnect
    extends GconnectToWalletData_walletToConnect {
  @override
  final String G__typename;
  @override
  final String? address;
  @override
  final GconnectToWalletData_walletToConnect_paymentInterface? paymentInterface;
  @override
  final String? action;
  @override
  final int? chainId;

  factory _$GconnectToWalletData_walletToConnect(
          [void Function(GconnectToWalletData_walletToConnectBuilder)?
              updates]) =>
      (new GconnectToWalletData_walletToConnectBuilder()..update(updates))
          ._build();

  _$GconnectToWalletData_walletToConnect._(
      {required this.G__typename,
      this.address,
      this.paymentInterface,
      this.action,
      this.chainId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GconnectToWalletData_walletToConnect', 'G__typename');
  }

  @override
  GconnectToWalletData_walletToConnect rebuild(
          void Function(GconnectToWalletData_walletToConnectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GconnectToWalletData_walletToConnectBuilder toBuilder() =>
      new GconnectToWalletData_walletToConnectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GconnectToWalletData_walletToConnect &&
        G__typename == other.G__typename &&
        address == other.address &&
        paymentInterface == other.paymentInterface &&
        action == other.action &&
        chainId == other.chainId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, paymentInterface.hashCode);
    _$hash = $jc(_$hash, action.hashCode);
    _$hash = $jc(_$hash, chainId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GconnectToWalletData_walletToConnect')
          ..add('G__typename', G__typename)
          ..add('address', address)
          ..add('paymentInterface', paymentInterface)
          ..add('action', action)
          ..add('chainId', chainId))
        .toString();
  }
}

class GconnectToWalletData_walletToConnectBuilder
    implements
        Builder<GconnectToWalletData_walletToConnect,
            GconnectToWalletData_walletToConnectBuilder> {
  _$GconnectToWalletData_walletToConnect? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  GconnectToWalletData_walletToConnect_paymentInterfaceBuilder?
      _paymentInterface;
  GconnectToWalletData_walletToConnect_paymentInterfaceBuilder
      get paymentInterface => _$this._paymentInterface ??=
          new GconnectToWalletData_walletToConnect_paymentInterfaceBuilder();
  set paymentInterface(
          GconnectToWalletData_walletToConnect_paymentInterfaceBuilder?
              paymentInterface) =>
      _$this._paymentInterface = paymentInterface;

  String? _action;
  String? get action => _$this._action;
  set action(String? action) => _$this._action = action;

  int? _chainId;
  int? get chainId => _$this._chainId;
  set chainId(int? chainId) => _$this._chainId = chainId;

  GconnectToWalletData_walletToConnectBuilder() {
    GconnectToWalletData_walletToConnect._initializeBuilder(this);
  }

  GconnectToWalletData_walletToConnectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _address = $v.address;
      _paymentInterface = $v.paymentInterface?.toBuilder();
      _action = $v.action;
      _chainId = $v.chainId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GconnectToWalletData_walletToConnect other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GconnectToWalletData_walletToConnect;
  }

  @override
  void update(
      void Function(GconnectToWalletData_walletToConnectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GconnectToWalletData_walletToConnect build() => _build();

  _$GconnectToWalletData_walletToConnect _build() {
    _$GconnectToWalletData_walletToConnect _$result;
    try {
      _$result = _$v ??
          new _$GconnectToWalletData_walletToConnect._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GconnectToWalletData_walletToConnect', 'G__typename'),
              address: address,
              paymentInterface: _paymentInterface?.build(),
              action: action,
              chainId: chainId);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'paymentInterface';
        _paymentInterface?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GconnectToWalletData_walletToConnect',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GconnectToWalletData_walletToConnect_paymentInterface
    extends GconnectToWalletData_walletToConnect_paymentInterface {
  @override
  final String G__typename;
  @override
  final String? id;

  factory _$GconnectToWalletData_walletToConnect_paymentInterface(
          [void Function(
                  GconnectToWalletData_walletToConnect_paymentInterfaceBuilder)?
              updates]) =>
      (new GconnectToWalletData_walletToConnect_paymentInterfaceBuilder()
            ..update(updates))
          ._build();

  _$GconnectToWalletData_walletToConnect_paymentInterface._(
      {required this.G__typename, this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GconnectToWalletData_walletToConnect_paymentInterface',
        'G__typename');
  }

  @override
  GconnectToWalletData_walletToConnect_paymentInterface rebuild(
          void Function(
                  GconnectToWalletData_walletToConnect_paymentInterfaceBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GconnectToWalletData_walletToConnect_paymentInterfaceBuilder toBuilder() =>
      new GconnectToWalletData_walletToConnect_paymentInterfaceBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GconnectToWalletData_walletToConnect_paymentInterface &&
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
            r'GconnectToWalletData_walletToConnect_paymentInterface')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GconnectToWalletData_walletToConnect_paymentInterfaceBuilder
    implements
        Builder<GconnectToWalletData_walletToConnect_paymentInterface,
            GconnectToWalletData_walletToConnect_paymentInterfaceBuilder> {
  _$GconnectToWalletData_walletToConnect_paymentInterface? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GconnectToWalletData_walletToConnect_paymentInterfaceBuilder() {
    GconnectToWalletData_walletToConnect_paymentInterface._initializeBuilder(
        this);
  }

  GconnectToWalletData_walletToConnect_paymentInterfaceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GconnectToWalletData_walletToConnect_paymentInterface other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GconnectToWalletData_walletToConnect_paymentInterface;
  }

  @override
  void update(
      void Function(
              GconnectToWalletData_walletToConnect_paymentInterfaceBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GconnectToWalletData_walletToConnect_paymentInterface build() => _build();

  _$GconnectToWalletData_walletToConnect_paymentInterface _build() {
    final _$result = _$v ??
        new _$GconnectToWalletData_walletToConnect_paymentInterface._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GconnectToWalletData_walletToConnect_paymentInterface',
                'G__typename'),
            id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signature_requst_wallet_connect.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GsignatureRequestWalletConnectVars>
    _$gsignatureRequestWalletConnectVarsSerializer =
    new _$GsignatureRequestWalletConnectVarsSerializer();

class _$GsignatureRequestWalletConnectVarsSerializer
    implements StructuredSerializer<GsignatureRequestWalletConnectVars> {
  @override
  final Iterable<Type> types = const [
    GsignatureRequestWalletConnectVars,
    _$GsignatureRequestWalletConnectVars
  ];
  @override
  final String wireName = 'GsignatureRequestWalletConnectVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GsignatureRequestWalletConnectVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'chainId',
      serializers.serialize(object.chainId, specifiedType: const FullType(int)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GsignatureRequestWalletConnectVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GsignatureRequestWalletConnectVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'chainId':
          result.chainId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GsignatureRequestWalletConnectVars
    extends GsignatureRequestWalletConnectVars {
  @override
  final int chainId;
  @override
  final String address;

  factory _$GsignatureRequestWalletConnectVars(
          [void Function(GsignatureRequestWalletConnectVarsBuilder)?
              updates]) =>
      (new GsignatureRequestWalletConnectVarsBuilder()..update(updates))
          ._build();

  _$GsignatureRequestWalletConnectVars._(
      {required this.chainId, required this.address})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        chainId, r'GsignatureRequestWalletConnectVars', 'chainId');
    BuiltValueNullFieldError.checkNotNull(
        address, r'GsignatureRequestWalletConnectVars', 'address');
  }

  @override
  GsignatureRequestWalletConnectVars rebuild(
          void Function(GsignatureRequestWalletConnectVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GsignatureRequestWalletConnectVarsBuilder toBuilder() =>
      new GsignatureRequestWalletConnectVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GsignatureRequestWalletConnectVars &&
        chainId == other.chainId &&
        address == other.address;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, chainId.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GsignatureRequestWalletConnectVars')
          ..add('chainId', chainId)
          ..add('address', address))
        .toString();
  }
}

class GsignatureRequestWalletConnectVarsBuilder
    implements
        Builder<GsignatureRequestWalletConnectVars,
            GsignatureRequestWalletConnectVarsBuilder> {
  _$GsignatureRequestWalletConnectVars? _$v;

  int? _chainId;
  int? get chainId => _$this._chainId;
  set chainId(int? chainId) => _$this._chainId = chainId;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  GsignatureRequestWalletConnectVarsBuilder();

  GsignatureRequestWalletConnectVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _chainId = $v.chainId;
      _address = $v.address;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GsignatureRequestWalletConnectVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GsignatureRequestWalletConnectVars;
  }

  @override
  void update(
      void Function(GsignatureRequestWalletConnectVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GsignatureRequestWalletConnectVars build() => _build();

  _$GsignatureRequestWalletConnectVars _build() {
    final _$result = _$v ??
        new _$GsignatureRequestWalletConnectVars._(
            chainId: BuiltValueNullFieldError.checkNotNull(
                chainId, r'GsignatureRequestWalletConnectVars', 'chainId'),
            address: BuiltValueNullFieldError.checkNotNull(
                address, r'GsignatureRequestWalletConnectVars', 'address'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_deposit_wallet_payment_interface.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetDepositWalletPaymentInterfaceVars>
    _$gGetDepositWalletPaymentInterfaceVarsSerializer =
    new _$GGetDepositWalletPaymentInterfaceVarsSerializer();

class _$GGetDepositWalletPaymentInterfaceVarsSerializer
    implements StructuredSerializer<GGetDepositWalletPaymentInterfaceVars> {
  @override
  final Iterable<Type> types = const [
    GGetDepositWalletPaymentInterfaceVars,
    _$GGetDepositWalletPaymentInterfaceVars
  ];
  @override
  final String wireName = 'GGetDepositWalletPaymentInterfaceVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetDepositWalletPaymentInterfaceVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetDepositWalletPaymentInterfaceVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetDepositWalletPaymentInterfaceVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDepositWalletPaymentInterfaceVars
    extends GGetDepositWalletPaymentInterfaceVars {
  @override
  final String id;

  factory _$GGetDepositWalletPaymentInterfaceVars(
          [void Function(GGetDepositWalletPaymentInterfaceVarsBuilder)?
              updates]) =>
      (new GGetDepositWalletPaymentInterfaceVarsBuilder()..update(updates))
          ._build();

  _$GGetDepositWalletPaymentInterfaceVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'GGetDepositWalletPaymentInterfaceVars', 'id');
  }

  @override
  GGetDepositWalletPaymentInterfaceVars rebuild(
          void Function(GGetDepositWalletPaymentInterfaceVarsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDepositWalletPaymentInterfaceVarsBuilder toBuilder() =>
      new GGetDepositWalletPaymentInterfaceVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetDepositWalletPaymentInterfaceVars && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetDepositWalletPaymentInterfaceVars')
          ..add('id', id))
        .toString();
  }
}

class GGetDepositWalletPaymentInterfaceVarsBuilder
    implements
        Builder<GGetDepositWalletPaymentInterfaceVars,
            GGetDepositWalletPaymentInterfaceVarsBuilder> {
  _$GGetDepositWalletPaymentInterfaceVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GGetDepositWalletPaymentInterfaceVarsBuilder();

  GGetDepositWalletPaymentInterfaceVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetDepositWalletPaymentInterfaceVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDepositWalletPaymentInterfaceVars;
  }

  @override
  void update(
      void Function(GGetDepositWalletPaymentInterfaceVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDepositWalletPaymentInterfaceVars build() => _build();

  _$GGetDepositWalletPaymentInterfaceVars _build() {
    final _$result = _$v ??
        new _$GGetDepositWalletPaymentInterfaceVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GGetDepositWalletPaymentInterfaceVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

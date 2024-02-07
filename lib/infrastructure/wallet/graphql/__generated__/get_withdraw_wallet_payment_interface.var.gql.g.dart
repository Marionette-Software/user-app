// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_withdraw_wallet_payment_interface.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetWithdrawWalletPaymentInterfaceVars>
    _$gGetWithdrawWalletPaymentInterfaceVarsSerializer =
    new _$GGetWithdrawWalletPaymentInterfaceVarsSerializer();

class _$GGetWithdrawWalletPaymentInterfaceVarsSerializer
    implements StructuredSerializer<GGetWithdrawWalletPaymentInterfaceVars> {
  @override
  final Iterable<Type> types = const [
    GGetWithdrawWalletPaymentInterfaceVars,
    _$GGetWithdrawWalletPaymentInterfaceVars
  ];
  @override
  final String wireName = 'GGetWithdrawWalletPaymentInterfaceVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetWithdrawWalletPaymentInterfaceVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetWithdrawWalletPaymentInterfaceVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetWithdrawWalletPaymentInterfaceVarsBuilder();

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

class _$GGetWithdrawWalletPaymentInterfaceVars
    extends GGetWithdrawWalletPaymentInterfaceVars {
  @override
  final String id;

  factory _$GGetWithdrawWalletPaymentInterfaceVars(
          [void Function(GGetWithdrawWalletPaymentInterfaceVarsBuilder)?
              updates]) =>
      (new GGetWithdrawWalletPaymentInterfaceVarsBuilder()..update(updates))
          ._build();

  _$GGetWithdrawWalletPaymentInterfaceVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'GGetWithdrawWalletPaymentInterfaceVars', 'id');
  }

  @override
  GGetWithdrawWalletPaymentInterfaceVars rebuild(
          void Function(GGetWithdrawWalletPaymentInterfaceVarsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetWithdrawWalletPaymentInterfaceVarsBuilder toBuilder() =>
      new GGetWithdrawWalletPaymentInterfaceVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetWithdrawWalletPaymentInterfaceVars && id == other.id;
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
            r'GGetWithdrawWalletPaymentInterfaceVars')
          ..add('id', id))
        .toString();
  }
}

class GGetWithdrawWalletPaymentInterfaceVarsBuilder
    implements
        Builder<GGetWithdrawWalletPaymentInterfaceVars,
            GGetWithdrawWalletPaymentInterfaceVarsBuilder> {
  _$GGetWithdrawWalletPaymentInterfaceVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GGetWithdrawWalletPaymentInterfaceVarsBuilder();

  GGetWithdrawWalletPaymentInterfaceVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetWithdrawWalletPaymentInterfaceVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetWithdrawWalletPaymentInterfaceVars;
  }

  @override
  void update(
      void Function(GGetWithdrawWalletPaymentInterfaceVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetWithdrawWalletPaymentInterfaceVars build() => _build();

  _$GGetWithdrawWalletPaymentInterfaceVars _build() {
    final _$result = _$v ??
        new _$GGetWithdrawWalletPaymentInterfaceVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GGetWithdrawWalletPaymentInterfaceVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

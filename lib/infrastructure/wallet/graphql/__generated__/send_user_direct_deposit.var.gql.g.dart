// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_user_direct_deposit.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GsendUserDirectDepositVars> _$gsendUserDirectDepositVarsSerializer =
    new _$GsendUserDirectDepositVarsSerializer();

class _$GsendUserDirectDepositVarsSerializer
    implements StructuredSerializer<GsendUserDirectDepositVars> {
  @override
  final Iterable<Type> types = const [
    GsendUserDirectDepositVars,
    _$GsendUserDirectDepositVars
  ];
  @override
  final String wireName = 'GsendUserDirectDepositVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GsendUserDirectDepositVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'currencyPaymentInterfaceId',
      serializers.serialize(object.currencyPaymentInterfaceId,
          specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  GsendUserDirectDepositVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GsendUserDirectDepositVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'currencyPaymentInterfaceId':
          result.currencyPaymentInterfaceId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$GsendUserDirectDepositVars extends GsendUserDirectDepositVars {
  @override
  final String currencyPaymentInterfaceId;
  @override
  final String address;
  @override
  final double amount;

  factory _$GsendUserDirectDepositVars(
          [void Function(GsendUserDirectDepositVarsBuilder)? updates]) =>
      (new GsendUserDirectDepositVarsBuilder()..update(updates))._build();

  _$GsendUserDirectDepositVars._(
      {required this.currencyPaymentInterfaceId,
      required this.address,
      required this.amount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(currencyPaymentInterfaceId,
        r'GsendUserDirectDepositVars', 'currencyPaymentInterfaceId');
    BuiltValueNullFieldError.checkNotNull(
        address, r'GsendUserDirectDepositVars', 'address');
    BuiltValueNullFieldError.checkNotNull(
        amount, r'GsendUserDirectDepositVars', 'amount');
  }

  @override
  GsendUserDirectDepositVars rebuild(
          void Function(GsendUserDirectDepositVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GsendUserDirectDepositVarsBuilder toBuilder() =>
      new GsendUserDirectDepositVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GsendUserDirectDepositVars &&
        currencyPaymentInterfaceId == other.currencyPaymentInterfaceId &&
        address == other.address &&
        amount == other.amount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currencyPaymentInterfaceId.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GsendUserDirectDepositVars')
          ..add('currencyPaymentInterfaceId', currencyPaymentInterfaceId)
          ..add('address', address)
          ..add('amount', amount))
        .toString();
  }
}

class GsendUserDirectDepositVarsBuilder
    implements
        Builder<GsendUserDirectDepositVars, GsendUserDirectDepositVarsBuilder> {
  _$GsendUserDirectDepositVars? _$v;

  String? _currencyPaymentInterfaceId;
  String? get currencyPaymentInterfaceId => _$this._currencyPaymentInterfaceId;
  set currencyPaymentInterfaceId(String? currencyPaymentInterfaceId) =>
      _$this._currencyPaymentInterfaceId = currencyPaymentInterfaceId;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  GsendUserDirectDepositVarsBuilder();

  GsendUserDirectDepositVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyPaymentInterfaceId = $v.currencyPaymentInterfaceId;
      _address = $v.address;
      _amount = $v.amount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GsendUserDirectDepositVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GsendUserDirectDepositVars;
  }

  @override
  void update(void Function(GsendUserDirectDepositVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GsendUserDirectDepositVars build() => _build();

  _$GsendUserDirectDepositVars _build() {
    final _$result = _$v ??
        new _$GsendUserDirectDepositVars._(
            currencyPaymentInterfaceId: BuiltValueNullFieldError.checkNotNull(
                currencyPaymentInterfaceId,
                r'GsendUserDirectDepositVars',
                'currencyPaymentInterfaceId'),
            address: BuiltValueNullFieldError.checkNotNull(
                address, r'GsendUserDirectDepositVars', 'address'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'GsendUserDirectDepositVars', 'amount'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_stake.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateCurrencyStateVars> _$gCreateCurrencyStateVarsSerializer =
    new _$GCreateCurrencyStateVarsSerializer();

class _$GCreateCurrencyStateVarsSerializer
    implements StructuredSerializer<GCreateCurrencyStateVars> {
  @override
  final Iterable<Type> types = const [
    GCreateCurrencyStateVars,
    _$GCreateCurrencyStateVars
  ];
  @override
  final String wireName = 'GCreateCurrencyStateVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateCurrencyStateVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'currencyId',
      serializers.serialize(object.currencyId,
          specifiedType: const FullType(String)),
      'amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  GCreateCurrencyStateVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateCurrencyStateVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'currencyId':
          result.currencyId = serializers.deserialize(value,
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

class _$GCreateCurrencyStateVars extends GCreateCurrencyStateVars {
  @override
  final String currencyId;
  @override
  final double amount;

  factory _$GCreateCurrencyStateVars(
          [void Function(GCreateCurrencyStateVarsBuilder)? updates]) =>
      (new GCreateCurrencyStateVarsBuilder()..update(updates))._build();

  _$GCreateCurrencyStateVars._({required this.currencyId, required this.amount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        currencyId, r'GCreateCurrencyStateVars', 'currencyId');
    BuiltValueNullFieldError.checkNotNull(
        amount, r'GCreateCurrencyStateVars', 'amount');
  }

  @override
  GCreateCurrencyStateVars rebuild(
          void Function(GCreateCurrencyStateVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateCurrencyStateVarsBuilder toBuilder() =>
      new GCreateCurrencyStateVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateCurrencyStateVars &&
        currencyId == other.currencyId &&
        amount == other.amount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currencyId.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateCurrencyStateVars')
          ..add('currencyId', currencyId)
          ..add('amount', amount))
        .toString();
  }
}

class GCreateCurrencyStateVarsBuilder
    implements
        Builder<GCreateCurrencyStateVars, GCreateCurrencyStateVarsBuilder> {
  _$GCreateCurrencyStateVars? _$v;

  String? _currencyId;
  String? get currencyId => _$this._currencyId;
  set currencyId(String? currencyId) => _$this._currencyId = currencyId;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  GCreateCurrencyStateVarsBuilder();

  GCreateCurrencyStateVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyId = $v.currencyId;
      _amount = $v.amount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateCurrencyStateVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateCurrencyStateVars;
  }

  @override
  void update(void Function(GCreateCurrencyStateVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateCurrencyStateVars build() => _build();

  _$GCreateCurrencyStateVars _build() {
    final _$result = _$v ??
        new _$GCreateCurrencyStateVars._(
            currencyId: BuiltValueNullFieldError.checkNotNull(
                currencyId, r'GCreateCurrencyStateVars', 'currencyId'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'GCreateCurrencyStateVars', 'amount'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

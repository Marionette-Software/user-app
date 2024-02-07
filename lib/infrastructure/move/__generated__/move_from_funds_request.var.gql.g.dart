// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_from_funds_request.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GMoveFromAdvancedTradingFundsVars>
    _$gMoveFromAdvancedTradingFundsVarsSerializer =
    new _$GMoveFromAdvancedTradingFundsVarsSerializer();

class _$GMoveFromAdvancedTradingFundsVarsSerializer
    implements StructuredSerializer<GMoveFromAdvancedTradingFundsVars> {
  @override
  final Iterable<Type> types = const [
    GMoveFromAdvancedTradingFundsVars,
    _$GMoveFromAdvancedTradingFundsVars
  ];
  @override
  final String wireName = 'GMoveFromAdvancedTradingFundsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GMoveFromAdvancedTradingFundsVars object,
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
  GMoveFromAdvancedTradingFundsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMoveFromAdvancedTradingFundsVarsBuilder();

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

class _$GMoveFromAdvancedTradingFundsVars
    extends GMoveFromAdvancedTradingFundsVars {
  @override
  final String currencyId;
  @override
  final double amount;

  factory _$GMoveFromAdvancedTradingFundsVars(
          [void Function(GMoveFromAdvancedTradingFundsVarsBuilder)? updates]) =>
      (new GMoveFromAdvancedTradingFundsVarsBuilder()..update(updates))
          ._build();

  _$GMoveFromAdvancedTradingFundsVars._(
      {required this.currencyId, required this.amount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        currencyId, r'GMoveFromAdvancedTradingFundsVars', 'currencyId');
    BuiltValueNullFieldError.checkNotNull(
        amount, r'GMoveFromAdvancedTradingFundsVars', 'amount');
  }

  @override
  GMoveFromAdvancedTradingFundsVars rebuild(
          void Function(GMoveFromAdvancedTradingFundsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMoveFromAdvancedTradingFundsVarsBuilder toBuilder() =>
      new GMoveFromAdvancedTradingFundsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMoveFromAdvancedTradingFundsVars &&
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
    return (newBuiltValueToStringHelper(r'GMoveFromAdvancedTradingFundsVars')
          ..add('currencyId', currencyId)
          ..add('amount', amount))
        .toString();
  }
}

class GMoveFromAdvancedTradingFundsVarsBuilder
    implements
        Builder<GMoveFromAdvancedTradingFundsVars,
            GMoveFromAdvancedTradingFundsVarsBuilder> {
  _$GMoveFromAdvancedTradingFundsVars? _$v;

  String? _currencyId;
  String? get currencyId => _$this._currencyId;
  set currencyId(String? currencyId) => _$this._currencyId = currencyId;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  GMoveFromAdvancedTradingFundsVarsBuilder();

  GMoveFromAdvancedTradingFundsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyId = $v.currencyId;
      _amount = $v.amount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMoveFromAdvancedTradingFundsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMoveFromAdvancedTradingFundsVars;
  }

  @override
  void update(
      void Function(GMoveFromAdvancedTradingFundsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMoveFromAdvancedTradingFundsVars build() => _build();

  _$GMoveFromAdvancedTradingFundsVars _build() {
    final _$result = _$v ??
        new _$GMoveFromAdvancedTradingFundsVars._(
            currencyId: BuiltValueNullFieldError.checkNotNull(
                currencyId, r'GMoveFromAdvancedTradingFundsVars', 'currencyId'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'GMoveFromAdvancedTradingFundsVars', 'amount'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

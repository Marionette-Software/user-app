// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_to_funds_request.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GMoveToAdvancedTradingFundsVars>
    _$gMoveToAdvancedTradingFundsVarsSerializer =
    new _$GMoveToAdvancedTradingFundsVarsSerializer();

class _$GMoveToAdvancedTradingFundsVarsSerializer
    implements StructuredSerializer<GMoveToAdvancedTradingFundsVars> {
  @override
  final Iterable<Type> types = const [
    GMoveToAdvancedTradingFundsVars,
    _$GMoveToAdvancedTradingFundsVars
  ];
  @override
  final String wireName = 'GMoveToAdvancedTradingFundsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GMoveToAdvancedTradingFundsVars object,
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
  GMoveToAdvancedTradingFundsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMoveToAdvancedTradingFundsVarsBuilder();

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

class _$GMoveToAdvancedTradingFundsVars
    extends GMoveToAdvancedTradingFundsVars {
  @override
  final String currencyId;
  @override
  final double amount;

  factory _$GMoveToAdvancedTradingFundsVars(
          [void Function(GMoveToAdvancedTradingFundsVarsBuilder)? updates]) =>
      (new GMoveToAdvancedTradingFundsVarsBuilder()..update(updates))._build();

  _$GMoveToAdvancedTradingFundsVars._(
      {required this.currencyId, required this.amount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        currencyId, r'GMoveToAdvancedTradingFundsVars', 'currencyId');
    BuiltValueNullFieldError.checkNotNull(
        amount, r'GMoveToAdvancedTradingFundsVars', 'amount');
  }

  @override
  GMoveToAdvancedTradingFundsVars rebuild(
          void Function(GMoveToAdvancedTradingFundsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMoveToAdvancedTradingFundsVarsBuilder toBuilder() =>
      new GMoveToAdvancedTradingFundsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMoveToAdvancedTradingFundsVars &&
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
    return (newBuiltValueToStringHelper(r'GMoveToAdvancedTradingFundsVars')
          ..add('currencyId', currencyId)
          ..add('amount', amount))
        .toString();
  }
}

class GMoveToAdvancedTradingFundsVarsBuilder
    implements
        Builder<GMoveToAdvancedTradingFundsVars,
            GMoveToAdvancedTradingFundsVarsBuilder> {
  _$GMoveToAdvancedTradingFundsVars? _$v;

  String? _currencyId;
  String? get currencyId => _$this._currencyId;
  set currencyId(String? currencyId) => _$this._currencyId = currencyId;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  GMoveToAdvancedTradingFundsVarsBuilder();

  GMoveToAdvancedTradingFundsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyId = $v.currencyId;
      _amount = $v.amount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMoveToAdvancedTradingFundsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMoveToAdvancedTradingFundsVars;
  }

  @override
  void update(void Function(GMoveToAdvancedTradingFundsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMoveToAdvancedTradingFundsVars build() => _build();

  _$GMoveToAdvancedTradingFundsVars _build() {
    final _$result = _$v ??
        new _$GMoveToAdvancedTradingFundsVars._(
            currencyId: BuiltValueNullFieldError.checkNotNull(
                currencyId, r'GMoveToAdvancedTradingFundsVars', 'currencyId'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'GMoveToAdvancedTradingFundsVars', 'amount'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

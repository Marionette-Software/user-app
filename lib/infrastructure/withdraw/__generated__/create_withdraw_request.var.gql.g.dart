// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_withdraw_request.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateWithdrawalVars> _$gCreateWithdrawalVarsSerializer =
    new _$GCreateWithdrawalVarsSerializer();

class _$GCreateWithdrawalVarsSerializer
    implements StructuredSerializer<GCreateWithdrawalVars> {
  @override
  final Iterable<Type> types = const [
    GCreateWithdrawalVars,
    _$GCreateWithdrawalVars
  ];
  @override
  final String wireName = 'GCreateWithdrawalVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateWithdrawalVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.beneficiary_id;
    if (value != null) {
      result
        ..add('beneficiary_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.includeFees;
    if (value != null) {
      result
        ..add('includeFees')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GCreateWithdrawalVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWithdrawalVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'beneficiary_id':
          result.beneficiary_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'includeFees':
          result.includeFees = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateWithdrawalVars extends GCreateWithdrawalVars {
  @override
  final String? beneficiary_id;
  @override
  final double? amount;
  @override
  final String? code;
  @override
  final bool? includeFees;

  factory _$GCreateWithdrawalVars(
          [void Function(GCreateWithdrawalVarsBuilder)? updates]) =>
      (new GCreateWithdrawalVarsBuilder()..update(updates))._build();

  _$GCreateWithdrawalVars._(
      {this.beneficiary_id, this.amount, this.code, this.includeFees})
      : super._();

  @override
  GCreateWithdrawalVars rebuild(
          void Function(GCreateWithdrawalVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWithdrawalVarsBuilder toBuilder() =>
      new GCreateWithdrawalVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWithdrawalVars &&
        beneficiary_id == other.beneficiary_id &&
        amount == other.amount &&
        code == other.code &&
        includeFees == other.includeFees;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, beneficiary_id.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, includeFees.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateWithdrawalVars')
          ..add('beneficiary_id', beneficiary_id)
          ..add('amount', amount)
          ..add('code', code)
          ..add('includeFees', includeFees))
        .toString();
  }
}

class GCreateWithdrawalVarsBuilder
    implements Builder<GCreateWithdrawalVars, GCreateWithdrawalVarsBuilder> {
  _$GCreateWithdrawalVars? _$v;

  String? _beneficiary_id;
  String? get beneficiary_id => _$this._beneficiary_id;
  set beneficiary_id(String? beneficiary_id) =>
      _$this._beneficiary_id = beneficiary_id;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  bool? _includeFees;
  bool? get includeFees => _$this._includeFees;
  set includeFees(bool? includeFees) => _$this._includeFees = includeFees;

  GCreateWithdrawalVarsBuilder();

  GCreateWithdrawalVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _beneficiary_id = $v.beneficiary_id;
      _amount = $v.amount;
      _code = $v.code;
      _includeFees = $v.includeFees;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWithdrawalVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWithdrawalVars;
  }

  @override
  void update(void Function(GCreateWithdrawalVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWithdrawalVars build() => _build();

  _$GCreateWithdrawalVars _build() {
    final _$result = _$v ??
        new _$GCreateWithdrawalVars._(
            beneficiary_id: beneficiary_id,
            amount: amount,
            code: code,
            includeFees: includeFees);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

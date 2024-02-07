// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_staking_currency.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetStakingCurrencyData> _$gGetStakingCurrencyDataSerializer =
    new _$GGetStakingCurrencyDataSerializer();
Serializer<GGetStakingCurrencyData_stakingCurrency>
    _$gGetStakingCurrencyDataStakingCurrencySerializer =
    new _$GGetStakingCurrencyData_stakingCurrencySerializer();

class _$GGetStakingCurrencyDataSerializer
    implements StructuredSerializer<GGetStakingCurrencyData> {
  @override
  final Iterable<Type> types = const [
    GGetStakingCurrencyData,
    _$GGetStakingCurrencyData
  ];
  @override
  final String wireName = 'GGetStakingCurrencyData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetStakingCurrencyData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.stakingCurrency;
    if (value != null) {
      result
        ..add('stakingCurrency')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GGetStakingCurrencyData_stakingCurrency)));
    }
    return result;
  }

  @override
  GGetStakingCurrencyData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetStakingCurrencyDataBuilder();

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
        case 'stakingCurrency':
          result.stakingCurrency.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetStakingCurrencyData_stakingCurrency))!
              as GGetStakingCurrencyData_stakingCurrency);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetStakingCurrencyData_stakingCurrencySerializer
    implements StructuredSerializer<GGetStakingCurrencyData_stakingCurrency> {
  @override
  final Iterable<Type> types = const [
    GGetStakingCurrencyData_stakingCurrency,
    _$GGetStakingCurrencyData_stakingCurrency
  ];
  @override
  final String wireName = 'GGetStakingCurrencyData_stakingCurrency';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetStakingCurrencyData_stakingCurrency object,
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
    value = object.staking_enabled;
    if (value != null) {
      result
        ..add('staking_enabled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.staking_period;
    if (value != null) {
      result
        ..add('staking_period')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.staking_apr;
    if (value != null) {
      result
        ..add('staking_apr')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.last_staking_calc;
    if (value != null) {
      result
        ..add('last_staking_calc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.next_staking_calc;
    if (value != null) {
      result
        ..add('next_staking_calc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.next_reward_amount;
    if (value != null) {
      result
        ..add('next_reward_amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.locked_balance;
    if (value != null) {
      result
        ..add('locked_balance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.active_balance;
    if (value != null) {
      result
        ..add('active_balance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.min_staking_amount;
    if (value != null) {
      result
        ..add('min_staking_amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.isUnstakingProcess;
    if (value != null) {
      result
        ..add('isUnstakingProcess')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GGetStakingCurrencyData_stakingCurrency deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetStakingCurrencyData_stakingCurrencyBuilder();

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
        case 'staking_enabled':
          result.staking_enabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'staking_period':
          result.staking_period = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'staking_apr':
          result.staking_apr = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'last_staking_calc':
          result.last_staking_calc = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'next_staking_calc':
          result.next_staking_calc = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'next_reward_amount':
          result.next_reward_amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'locked_balance':
          result.locked_balance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'active_balance':
          result.active_balance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'min_staking_amount':
          result.min_staking_amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'isUnstakingProcess':
          result.isUnstakingProcess = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetStakingCurrencyData extends GGetStakingCurrencyData {
  @override
  final String G__typename;
  @override
  final GGetStakingCurrencyData_stakingCurrency? stakingCurrency;

  factory _$GGetStakingCurrencyData(
          [void Function(GGetStakingCurrencyDataBuilder)? updates]) =>
      (new GGetStakingCurrencyDataBuilder()..update(updates))._build();

  _$GGetStakingCurrencyData._({required this.G__typename, this.stakingCurrency})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetStakingCurrencyData', 'G__typename');
  }

  @override
  GGetStakingCurrencyData rebuild(
          void Function(GGetStakingCurrencyDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetStakingCurrencyDataBuilder toBuilder() =>
      new GGetStakingCurrencyDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetStakingCurrencyData &&
        G__typename == other.G__typename &&
        stakingCurrency == other.stakingCurrency;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, stakingCurrency.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetStakingCurrencyData')
          ..add('G__typename', G__typename)
          ..add('stakingCurrency', stakingCurrency))
        .toString();
  }
}

class GGetStakingCurrencyDataBuilder
    implements
        Builder<GGetStakingCurrencyData, GGetStakingCurrencyDataBuilder> {
  _$GGetStakingCurrencyData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetStakingCurrencyData_stakingCurrencyBuilder? _stakingCurrency;
  GGetStakingCurrencyData_stakingCurrencyBuilder get stakingCurrency =>
      _$this._stakingCurrency ??=
          new GGetStakingCurrencyData_stakingCurrencyBuilder();
  set stakingCurrency(
          GGetStakingCurrencyData_stakingCurrencyBuilder? stakingCurrency) =>
      _$this._stakingCurrency = stakingCurrency;

  GGetStakingCurrencyDataBuilder() {
    GGetStakingCurrencyData._initializeBuilder(this);
  }

  GGetStakingCurrencyDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _stakingCurrency = $v.stakingCurrency?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetStakingCurrencyData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetStakingCurrencyData;
  }

  @override
  void update(void Function(GGetStakingCurrencyDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetStakingCurrencyData build() => _build();

  _$GGetStakingCurrencyData _build() {
    _$GGetStakingCurrencyData _$result;
    try {
      _$result = _$v ??
          new _$GGetStakingCurrencyData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetStakingCurrencyData', 'G__typename'),
              stakingCurrency: _stakingCurrency?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'stakingCurrency';
        _stakingCurrency?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetStakingCurrencyData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetStakingCurrencyData_stakingCurrency
    extends GGetStakingCurrencyData_stakingCurrency {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final bool? staking_enabled;
  @override
  final String? staking_period;
  @override
  final double? staking_apr;
  @override
  final double? last_staking_calc;
  @override
  final double? next_staking_calc;
  @override
  final double? next_reward_amount;
  @override
  final double? locked_balance;
  @override
  final double? active_balance;
  @override
  final double? min_staking_amount;
  @override
  final bool? isUnstakingProcess;

  factory _$GGetStakingCurrencyData_stakingCurrency(
          [void Function(GGetStakingCurrencyData_stakingCurrencyBuilder)?
              updates]) =>
      (new GGetStakingCurrencyData_stakingCurrencyBuilder()..update(updates))
          ._build();

  _$GGetStakingCurrencyData_stakingCurrency._(
      {required this.G__typename,
      this.id,
      this.staking_enabled,
      this.staking_period,
      this.staking_apr,
      this.last_staking_calc,
      this.next_staking_calc,
      this.next_reward_amount,
      this.locked_balance,
      this.active_balance,
      this.min_staking_amount,
      this.isUnstakingProcess})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetStakingCurrencyData_stakingCurrency', 'G__typename');
  }

  @override
  GGetStakingCurrencyData_stakingCurrency rebuild(
          void Function(GGetStakingCurrencyData_stakingCurrencyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetStakingCurrencyData_stakingCurrencyBuilder toBuilder() =>
      new GGetStakingCurrencyData_stakingCurrencyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetStakingCurrencyData_stakingCurrency &&
        G__typename == other.G__typename &&
        id == other.id &&
        staking_enabled == other.staking_enabled &&
        staking_period == other.staking_period &&
        staking_apr == other.staking_apr &&
        last_staking_calc == other.last_staking_calc &&
        next_staking_calc == other.next_staking_calc &&
        next_reward_amount == other.next_reward_amount &&
        locked_balance == other.locked_balance &&
        active_balance == other.active_balance &&
        min_staking_amount == other.min_staking_amount &&
        isUnstakingProcess == other.isUnstakingProcess;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, staking_enabled.hashCode);
    _$hash = $jc(_$hash, staking_period.hashCode);
    _$hash = $jc(_$hash, staking_apr.hashCode);
    _$hash = $jc(_$hash, last_staking_calc.hashCode);
    _$hash = $jc(_$hash, next_staking_calc.hashCode);
    _$hash = $jc(_$hash, next_reward_amount.hashCode);
    _$hash = $jc(_$hash, locked_balance.hashCode);
    _$hash = $jc(_$hash, active_balance.hashCode);
    _$hash = $jc(_$hash, min_staking_amount.hashCode);
    _$hash = $jc(_$hash, isUnstakingProcess.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetStakingCurrencyData_stakingCurrency')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('staking_enabled', staking_enabled)
          ..add('staking_period', staking_period)
          ..add('staking_apr', staking_apr)
          ..add('last_staking_calc', last_staking_calc)
          ..add('next_staking_calc', next_staking_calc)
          ..add('next_reward_amount', next_reward_amount)
          ..add('locked_balance', locked_balance)
          ..add('active_balance', active_balance)
          ..add('min_staking_amount', min_staking_amount)
          ..add('isUnstakingProcess', isUnstakingProcess))
        .toString();
  }
}

class GGetStakingCurrencyData_stakingCurrencyBuilder
    implements
        Builder<GGetStakingCurrencyData_stakingCurrency,
            GGetStakingCurrencyData_stakingCurrencyBuilder> {
  _$GGetStakingCurrencyData_stakingCurrency? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _staking_enabled;
  bool? get staking_enabled => _$this._staking_enabled;
  set staking_enabled(bool? staking_enabled) =>
      _$this._staking_enabled = staking_enabled;

  String? _staking_period;
  String? get staking_period => _$this._staking_period;
  set staking_period(String? staking_period) =>
      _$this._staking_period = staking_period;

  double? _staking_apr;
  double? get staking_apr => _$this._staking_apr;
  set staking_apr(double? staking_apr) => _$this._staking_apr = staking_apr;

  double? _last_staking_calc;
  double? get last_staking_calc => _$this._last_staking_calc;
  set last_staking_calc(double? last_staking_calc) =>
      _$this._last_staking_calc = last_staking_calc;

  double? _next_staking_calc;
  double? get next_staking_calc => _$this._next_staking_calc;
  set next_staking_calc(double? next_staking_calc) =>
      _$this._next_staking_calc = next_staking_calc;

  double? _next_reward_amount;
  double? get next_reward_amount => _$this._next_reward_amount;
  set next_reward_amount(double? next_reward_amount) =>
      _$this._next_reward_amount = next_reward_amount;

  double? _locked_balance;
  double? get locked_balance => _$this._locked_balance;
  set locked_balance(double? locked_balance) =>
      _$this._locked_balance = locked_balance;

  double? _active_balance;
  double? get active_balance => _$this._active_balance;
  set active_balance(double? active_balance) =>
      _$this._active_balance = active_balance;

  double? _min_staking_amount;
  double? get min_staking_amount => _$this._min_staking_amount;
  set min_staking_amount(double? min_staking_amount) =>
      _$this._min_staking_amount = min_staking_amount;

  bool? _isUnstakingProcess;
  bool? get isUnstakingProcess => _$this._isUnstakingProcess;
  set isUnstakingProcess(bool? isUnstakingProcess) =>
      _$this._isUnstakingProcess = isUnstakingProcess;

  GGetStakingCurrencyData_stakingCurrencyBuilder() {
    GGetStakingCurrencyData_stakingCurrency._initializeBuilder(this);
  }

  GGetStakingCurrencyData_stakingCurrencyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _staking_enabled = $v.staking_enabled;
      _staking_period = $v.staking_period;
      _staking_apr = $v.staking_apr;
      _last_staking_calc = $v.last_staking_calc;
      _next_staking_calc = $v.next_staking_calc;
      _next_reward_amount = $v.next_reward_amount;
      _locked_balance = $v.locked_balance;
      _active_balance = $v.active_balance;
      _min_staking_amount = $v.min_staking_amount;
      _isUnstakingProcess = $v.isUnstakingProcess;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetStakingCurrencyData_stakingCurrency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetStakingCurrencyData_stakingCurrency;
  }

  @override
  void update(
      void Function(GGetStakingCurrencyData_stakingCurrencyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetStakingCurrencyData_stakingCurrency build() => _build();

  _$GGetStakingCurrencyData_stakingCurrency _build() {
    final _$result = _$v ??
        new _$GGetStakingCurrencyData_stakingCurrency._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetStakingCurrencyData_stakingCurrency', 'G__typename'),
            id: id,
            staking_enabled: staking_enabled,
            staking_period: staking_period,
            staking_apr: staking_apr,
            last_staking_calc: last_staking_calc,
            next_staking_calc: next_staking_calc,
            next_reward_amount: next_reward_amount,
            locked_balance: locked_balance,
            active_balance: active_balance,
            min_staking_amount: min_staking_amount,
            isUnstakingProcess: isUnstakingProcess);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

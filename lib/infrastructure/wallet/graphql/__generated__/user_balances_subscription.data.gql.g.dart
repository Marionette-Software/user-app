// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_balances_subscription.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserBalancesData> _$gUserBalancesDataSerializer =
    new _$GUserBalancesDataSerializer();
Serializer<GUserBalancesData_userBalanceUpdated>
    _$gUserBalancesDataUserBalanceUpdatedSerializer =
    new _$GUserBalancesData_userBalanceUpdatedSerializer();

class _$GUserBalancesDataSerializer
    implements StructuredSerializer<GUserBalancesData> {
  @override
  final Iterable<Type> types = const [GUserBalancesData, _$GUserBalancesData];
  @override
  final String wireName = 'GUserBalancesData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserBalancesData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.userBalanceUpdated;
    if (value != null) {
      result
        ..add('userBalanceUpdated')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GUserBalancesData_userBalanceUpdated)));
    }
    return result;
  }

  @override
  GUserBalancesData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserBalancesDataBuilder();

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
        case 'userBalanceUpdated':
          result.userBalanceUpdated.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GUserBalancesData_userBalanceUpdated))!
              as GUserBalancesData_userBalanceUpdated);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserBalancesData_userBalanceUpdatedSerializer
    implements StructuredSerializer<GUserBalancesData_userBalanceUpdated> {
  @override
  final Iterable<Type> types = const [
    GUserBalancesData_userBalanceUpdated,
    _$GUserBalancesData_userBalanceUpdated
  ];
  @override
  final String wireName = 'GUserBalancesData_userBalanceUpdated';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserBalancesData_userBalanceUpdated object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.currencyId;
    if (value != null) {
      result
        ..add('currencyId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.balance;
    if (value != null) {
      result
        ..add('balance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.lockedBalance;
    if (value != null) {
      result
        ..add('lockedBalance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.advancedTradingBalance;
    if (value != null) {
      result
        ..add('advancedTradingBalance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.advancedTradingLockedBalance;
    if (value != null) {
      result
        ..add('advancedTradingLockedBalance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.withdrawLockedBalance;
    if (value != null) {
      result
        ..add('withdrawLockedBalance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.stakingLockedBalance;
    if (value != null) {
      result
        ..add('stakingLockedBalance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.activeStakingBalance;
    if (value != null) {
      result
        ..add('activeStakingBalance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.ts;
    if (value != null) {
      result
        ..add('ts')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GUserBalancesData_userBalanceUpdated deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserBalancesData_userBalanceUpdatedBuilder();

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
        case 'currencyId':
          result.currencyId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'balance':
          result.balance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'lockedBalance':
          result.lockedBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'advancedTradingBalance':
          result.advancedTradingBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'advancedTradingLockedBalance':
          result.advancedTradingLockedBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'withdrawLockedBalance':
          result.withdrawLockedBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'stakingLockedBalance':
          result.stakingLockedBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'activeStakingBalance':
          result.activeStakingBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'ts':
          result.ts = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserBalancesData extends GUserBalancesData {
  @override
  final String G__typename;
  @override
  final GUserBalancesData_userBalanceUpdated? userBalanceUpdated;

  factory _$GUserBalancesData(
          [void Function(GUserBalancesDataBuilder)? updates]) =>
      (new GUserBalancesDataBuilder()..update(updates))._build();

  _$GUserBalancesData._({required this.G__typename, this.userBalanceUpdated})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserBalancesData', 'G__typename');
  }

  @override
  GUserBalancesData rebuild(void Function(GUserBalancesDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserBalancesDataBuilder toBuilder() =>
      new GUserBalancesDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserBalancesData &&
        G__typename == other.G__typename &&
        userBalanceUpdated == other.userBalanceUpdated;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, userBalanceUpdated.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserBalancesData')
          ..add('G__typename', G__typename)
          ..add('userBalanceUpdated', userBalanceUpdated))
        .toString();
  }
}

class GUserBalancesDataBuilder
    implements Builder<GUserBalancesData, GUserBalancesDataBuilder> {
  _$GUserBalancesData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUserBalancesData_userBalanceUpdatedBuilder? _userBalanceUpdated;
  GUserBalancesData_userBalanceUpdatedBuilder get userBalanceUpdated =>
      _$this._userBalanceUpdated ??=
          new GUserBalancesData_userBalanceUpdatedBuilder();
  set userBalanceUpdated(
          GUserBalancesData_userBalanceUpdatedBuilder? userBalanceUpdated) =>
      _$this._userBalanceUpdated = userBalanceUpdated;

  GUserBalancesDataBuilder() {
    GUserBalancesData._initializeBuilder(this);
  }

  GUserBalancesDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userBalanceUpdated = $v.userBalanceUpdated?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserBalancesData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserBalancesData;
  }

  @override
  void update(void Function(GUserBalancesDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserBalancesData build() => _build();

  _$GUserBalancesData _build() {
    _$GUserBalancesData _$result;
    try {
      _$result = _$v ??
          new _$GUserBalancesData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserBalancesData', 'G__typename'),
              userBalanceUpdated: _userBalanceUpdated?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userBalanceUpdated';
        _userBalanceUpdated?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserBalancesData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserBalancesData_userBalanceUpdated
    extends GUserBalancesData_userBalanceUpdated {
  @override
  final String G__typename;
  @override
  final String? currencyId;
  @override
  final double? balance;
  @override
  final double? lockedBalance;
  @override
  final double? advancedTradingBalance;
  @override
  final double? advancedTradingLockedBalance;
  @override
  final double? withdrawLockedBalance;
  @override
  final double? stakingLockedBalance;
  @override
  final double? activeStakingBalance;
  @override
  final String? ts;

  factory _$GUserBalancesData_userBalanceUpdated(
          [void Function(GUserBalancesData_userBalanceUpdatedBuilder)?
              updates]) =>
      (new GUserBalancesData_userBalanceUpdatedBuilder()..update(updates))
          ._build();

  _$GUserBalancesData_userBalanceUpdated._(
      {required this.G__typename,
      this.currencyId,
      this.balance,
      this.lockedBalance,
      this.advancedTradingBalance,
      this.advancedTradingLockedBalance,
      this.withdrawLockedBalance,
      this.stakingLockedBalance,
      this.activeStakingBalance,
      this.ts})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserBalancesData_userBalanceUpdated', 'G__typename');
  }

  @override
  GUserBalancesData_userBalanceUpdated rebuild(
          void Function(GUserBalancesData_userBalanceUpdatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserBalancesData_userBalanceUpdatedBuilder toBuilder() =>
      new GUserBalancesData_userBalanceUpdatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserBalancesData_userBalanceUpdated &&
        G__typename == other.G__typename &&
        currencyId == other.currencyId &&
        balance == other.balance &&
        lockedBalance == other.lockedBalance &&
        advancedTradingBalance == other.advancedTradingBalance &&
        advancedTradingLockedBalance == other.advancedTradingLockedBalance &&
        withdrawLockedBalance == other.withdrawLockedBalance &&
        stakingLockedBalance == other.stakingLockedBalance &&
        activeStakingBalance == other.activeStakingBalance &&
        ts == other.ts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, currencyId.hashCode);
    _$hash = $jc(_$hash, balance.hashCode);
    _$hash = $jc(_$hash, lockedBalance.hashCode);
    _$hash = $jc(_$hash, advancedTradingBalance.hashCode);
    _$hash = $jc(_$hash, advancedTradingLockedBalance.hashCode);
    _$hash = $jc(_$hash, withdrawLockedBalance.hashCode);
    _$hash = $jc(_$hash, stakingLockedBalance.hashCode);
    _$hash = $jc(_$hash, activeStakingBalance.hashCode);
    _$hash = $jc(_$hash, ts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserBalancesData_userBalanceUpdated')
          ..add('G__typename', G__typename)
          ..add('currencyId', currencyId)
          ..add('balance', balance)
          ..add('lockedBalance', lockedBalance)
          ..add('advancedTradingBalance', advancedTradingBalance)
          ..add('advancedTradingLockedBalance', advancedTradingLockedBalance)
          ..add('withdrawLockedBalance', withdrawLockedBalance)
          ..add('stakingLockedBalance', stakingLockedBalance)
          ..add('activeStakingBalance', activeStakingBalance)
          ..add('ts', ts))
        .toString();
  }
}

class GUserBalancesData_userBalanceUpdatedBuilder
    implements
        Builder<GUserBalancesData_userBalanceUpdated,
            GUserBalancesData_userBalanceUpdatedBuilder> {
  _$GUserBalancesData_userBalanceUpdated? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _currencyId;
  String? get currencyId => _$this._currencyId;
  set currencyId(String? currencyId) => _$this._currencyId = currencyId;

  double? _balance;
  double? get balance => _$this._balance;
  set balance(double? balance) => _$this._balance = balance;

  double? _lockedBalance;
  double? get lockedBalance => _$this._lockedBalance;
  set lockedBalance(double? lockedBalance) =>
      _$this._lockedBalance = lockedBalance;

  double? _advancedTradingBalance;
  double? get advancedTradingBalance => _$this._advancedTradingBalance;
  set advancedTradingBalance(double? advancedTradingBalance) =>
      _$this._advancedTradingBalance = advancedTradingBalance;

  double? _advancedTradingLockedBalance;
  double? get advancedTradingLockedBalance =>
      _$this._advancedTradingLockedBalance;
  set advancedTradingLockedBalance(double? advancedTradingLockedBalance) =>
      _$this._advancedTradingLockedBalance = advancedTradingLockedBalance;

  double? _withdrawLockedBalance;
  double? get withdrawLockedBalance => _$this._withdrawLockedBalance;
  set withdrawLockedBalance(double? withdrawLockedBalance) =>
      _$this._withdrawLockedBalance = withdrawLockedBalance;

  double? _stakingLockedBalance;
  double? get stakingLockedBalance => _$this._stakingLockedBalance;
  set stakingLockedBalance(double? stakingLockedBalance) =>
      _$this._stakingLockedBalance = stakingLockedBalance;

  double? _activeStakingBalance;
  double? get activeStakingBalance => _$this._activeStakingBalance;
  set activeStakingBalance(double? activeStakingBalance) =>
      _$this._activeStakingBalance = activeStakingBalance;

  String? _ts;
  String? get ts => _$this._ts;
  set ts(String? ts) => _$this._ts = ts;

  GUserBalancesData_userBalanceUpdatedBuilder() {
    GUserBalancesData_userBalanceUpdated._initializeBuilder(this);
  }

  GUserBalancesData_userBalanceUpdatedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _currencyId = $v.currencyId;
      _balance = $v.balance;
      _lockedBalance = $v.lockedBalance;
      _advancedTradingBalance = $v.advancedTradingBalance;
      _advancedTradingLockedBalance = $v.advancedTradingLockedBalance;
      _withdrawLockedBalance = $v.withdrawLockedBalance;
      _stakingLockedBalance = $v.stakingLockedBalance;
      _activeStakingBalance = $v.activeStakingBalance;
      _ts = $v.ts;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserBalancesData_userBalanceUpdated other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserBalancesData_userBalanceUpdated;
  }

  @override
  void update(
      void Function(GUserBalancesData_userBalanceUpdatedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserBalancesData_userBalanceUpdated build() => _build();

  _$GUserBalancesData_userBalanceUpdated _build() {
    final _$result = _$v ??
        new _$GUserBalancesData_userBalanceUpdated._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GUserBalancesData_userBalanceUpdated', 'G__typename'),
            currencyId: currencyId,
            balance: balance,
            lockedBalance: lockedBalance,
            advancedTradingBalance: advancedTradingBalance,
            advancedTradingLockedBalance: advancedTradingLockedBalance,
            withdrawLockedBalance: withdrawLockedBalance,
            stakingLockedBalance: stakingLockedBalance,
            activeStakingBalance: activeStakingBalance,
            ts: ts);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

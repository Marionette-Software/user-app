// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_all_balance_subscription.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserAllBalanceData> _$gUserAllBalanceDataSerializer =
    new _$GUserAllBalanceDataSerializer();
Serializer<GUserAllBalanceData_userAllBalance>
    _$gUserAllBalanceDataUserAllBalanceSerializer =
    new _$GUserAllBalanceData_userAllBalanceSerializer();

class _$GUserAllBalanceDataSerializer
    implements StructuredSerializer<GUserAllBalanceData> {
  @override
  final Iterable<Type> types = const [
    GUserAllBalanceData,
    _$GUserAllBalanceData
  ];
  @override
  final String wireName = 'GUserAllBalanceData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserAllBalanceData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.userAllBalance;
    if (value != null) {
      result
        ..add('userAllBalance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GUserAllBalanceData_userAllBalance)
            ])));
    }
    return result;
  }

  @override
  GUserAllBalanceData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserAllBalanceDataBuilder();

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
        case 'userAllBalance':
          result.userAllBalance.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GUserAllBalanceData_userAllBalance)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserAllBalanceData_userAllBalanceSerializer
    implements StructuredSerializer<GUserAllBalanceData_userAllBalance> {
  @override
  final Iterable<Type> types = const [
    GUserAllBalanceData_userAllBalance,
    _$GUserAllBalanceData_userAllBalance
  ];
  @override
  final String wireName = 'GUserAllBalanceData_userAllBalance';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserAllBalanceData_userAllBalance object,
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
  GUserAllBalanceData_userAllBalance deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserAllBalanceData_userAllBalanceBuilder();

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

class _$GUserAllBalanceData extends GUserAllBalanceData {
  @override
  final String G__typename;
  @override
  final BuiltList<GUserAllBalanceData_userAllBalance?>? userAllBalance;

  factory _$GUserAllBalanceData(
          [void Function(GUserAllBalanceDataBuilder)? updates]) =>
      (new GUserAllBalanceDataBuilder()..update(updates))._build();

  _$GUserAllBalanceData._({required this.G__typename, this.userAllBalance})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserAllBalanceData', 'G__typename');
  }

  @override
  GUserAllBalanceData rebuild(
          void Function(GUserAllBalanceDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserAllBalanceDataBuilder toBuilder() =>
      new GUserAllBalanceDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserAllBalanceData &&
        G__typename == other.G__typename &&
        userAllBalance == other.userAllBalance;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, userAllBalance.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserAllBalanceData')
          ..add('G__typename', G__typename)
          ..add('userAllBalance', userAllBalance))
        .toString();
  }
}

class GUserAllBalanceDataBuilder
    implements Builder<GUserAllBalanceData, GUserAllBalanceDataBuilder> {
  _$GUserAllBalanceData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GUserAllBalanceData_userAllBalance?>? _userAllBalance;
  ListBuilder<GUserAllBalanceData_userAllBalance?> get userAllBalance =>
      _$this._userAllBalance ??=
          new ListBuilder<GUserAllBalanceData_userAllBalance?>();
  set userAllBalance(
          ListBuilder<GUserAllBalanceData_userAllBalance?>? userAllBalance) =>
      _$this._userAllBalance = userAllBalance;

  GUserAllBalanceDataBuilder() {
    GUserAllBalanceData._initializeBuilder(this);
  }

  GUserAllBalanceDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userAllBalance = $v.userAllBalance?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserAllBalanceData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserAllBalanceData;
  }

  @override
  void update(void Function(GUserAllBalanceDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserAllBalanceData build() => _build();

  _$GUserAllBalanceData _build() {
    _$GUserAllBalanceData _$result;
    try {
      _$result = _$v ??
          new _$GUserAllBalanceData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserAllBalanceData', 'G__typename'),
              userAllBalance: _userAllBalance?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userAllBalance';
        _userAllBalance?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserAllBalanceData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserAllBalanceData_userAllBalance
    extends GUserAllBalanceData_userAllBalance {
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

  factory _$GUserAllBalanceData_userAllBalance(
          [void Function(GUserAllBalanceData_userAllBalanceBuilder)?
              updates]) =>
      (new GUserAllBalanceData_userAllBalanceBuilder()..update(updates))
          ._build();

  _$GUserAllBalanceData_userAllBalance._(
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
        G__typename, r'GUserAllBalanceData_userAllBalance', 'G__typename');
  }

  @override
  GUserAllBalanceData_userAllBalance rebuild(
          void Function(GUserAllBalanceData_userAllBalanceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserAllBalanceData_userAllBalanceBuilder toBuilder() =>
      new GUserAllBalanceData_userAllBalanceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserAllBalanceData_userAllBalance &&
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
    return (newBuiltValueToStringHelper(r'GUserAllBalanceData_userAllBalance')
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

class GUserAllBalanceData_userAllBalanceBuilder
    implements
        Builder<GUserAllBalanceData_userAllBalance,
            GUserAllBalanceData_userAllBalanceBuilder> {
  _$GUserAllBalanceData_userAllBalance? _$v;

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

  GUserAllBalanceData_userAllBalanceBuilder() {
    GUserAllBalanceData_userAllBalance._initializeBuilder(this);
  }

  GUserAllBalanceData_userAllBalanceBuilder get _$this {
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
  void replace(GUserAllBalanceData_userAllBalance other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserAllBalanceData_userAllBalance;
  }

  @override
  void update(
      void Function(GUserAllBalanceData_userAllBalanceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserAllBalanceData_userAllBalance build() => _build();

  _$GUserAllBalanceData_userAllBalance _build() {
    final _$result = _$v ??
        new _$GUserAllBalanceData_userAllBalance._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GUserAllBalanceData_userAllBalance', 'G__typename'),
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

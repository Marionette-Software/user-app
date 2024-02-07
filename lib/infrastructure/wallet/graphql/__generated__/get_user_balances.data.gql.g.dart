// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_balances.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetUserBalancesData> _$gGetUserBalancesDataSerializer =
    new _$GGetUserBalancesDataSerializer();
Serializer<GGetUserBalancesData_user> _$gGetUserBalancesDataUserSerializer =
    new _$GGetUserBalancesData_userSerializer();
Serializer<GGetUserBalancesData_user_currencies>
    _$gGetUserBalancesDataUserCurrenciesSerializer =
    new _$GGetUserBalancesData_user_currenciesSerializer();

class _$GGetUserBalancesDataSerializer
    implements StructuredSerializer<GGetUserBalancesData> {
  @override
  final Iterable<Type> types = const [
    GGetUserBalancesData,
    _$GGetUserBalancesData
  ];
  @override
  final String wireName = 'GGetUserBalancesData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserBalancesData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GGetUserBalancesData_user)));
    }
    return result;
  }

  @override
  GGetUserBalancesData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserBalancesDataBuilder();

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
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GGetUserBalancesData_user))!
              as GGetUserBalancesData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserBalancesData_userSerializer
    implements StructuredSerializer<GGetUserBalancesData_user> {
  @override
  final Iterable<Type> types = const [
    GGetUserBalancesData_user,
    _$GGetUserBalancesData_user
  ];
  @override
  final String wireName = 'GGetUserBalancesData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserBalancesData_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.currencies;
    if (value != null) {
      result
        ..add('currencies')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GGetUserBalancesData_user_currencies)
            ])));
    }
    return result;
  }

  @override
  GGetUserBalancesData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserBalancesData_userBuilder();

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
        case 'currencies':
          result.currencies.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GGetUserBalancesData_user_currencies)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserBalancesData_user_currenciesSerializer
    implements StructuredSerializer<GGetUserBalancesData_user_currencies> {
  @override
  final Iterable<Type> types = const [
    GGetUserBalancesData_user_currencies,
    _$GGetUserBalancesData_user_currencies
  ];
  @override
  final String wireName = 'GGetUserBalancesData_user_currencies';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserBalancesData_user_currencies object,
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
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.balance;
    if (value != null) {
      result
        ..add('balance')
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
    value = object.lockedBalance;
    if (value != null) {
      result
        ..add('lockedBalance')
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
    return result;
  }

  @override
  GGetUserBalancesData_user_currencies deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserBalancesData_user_currenciesBuilder();

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
        case 'enabled':
          result.enabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'balance':
          result.balance = serializers.deserialize(value,
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
        case 'lockedBalance':
          result.lockedBalance = serializers.deserialize(value,
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
      }
    }

    return result.build();
  }
}

class _$GGetUserBalancesData extends GGetUserBalancesData {
  @override
  final String G__typename;
  @override
  final GGetUserBalancesData_user? user;

  factory _$GGetUserBalancesData(
          [void Function(GGetUserBalancesDataBuilder)? updates]) =>
      (new GGetUserBalancesDataBuilder()..update(updates))._build();

  _$GGetUserBalancesData._({required this.G__typename, this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUserBalancesData', 'G__typename');
  }

  @override
  GGetUserBalancesData rebuild(
          void Function(GGetUserBalancesDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserBalancesDataBuilder toBuilder() =>
      new GGetUserBalancesDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserBalancesData &&
        G__typename == other.G__typename &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserBalancesData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GGetUserBalancesDataBuilder
    implements Builder<GGetUserBalancesData, GGetUserBalancesDataBuilder> {
  _$GGetUserBalancesData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetUserBalancesData_userBuilder? _user;
  GGetUserBalancesData_userBuilder get user =>
      _$this._user ??= new GGetUserBalancesData_userBuilder();
  set user(GGetUserBalancesData_userBuilder? user) => _$this._user = user;

  GGetUserBalancesDataBuilder() {
    GGetUserBalancesData._initializeBuilder(this);
  }

  GGetUserBalancesDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserBalancesData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserBalancesData;
  }

  @override
  void update(void Function(GGetUserBalancesDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserBalancesData build() => _build();

  _$GGetUserBalancesData _build() {
    _$GGetUserBalancesData _$result;
    try {
      _$result = _$v ??
          new _$GGetUserBalancesData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetUserBalancesData', 'G__typename'),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUserBalancesData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserBalancesData_user extends GGetUserBalancesData_user {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetUserBalancesData_user_currencies?>? currencies;

  factory _$GGetUserBalancesData_user(
          [void Function(GGetUserBalancesData_userBuilder)? updates]) =>
      (new GGetUserBalancesData_userBuilder()..update(updates))._build();

  _$GGetUserBalancesData_user._({required this.G__typename, this.currencies})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUserBalancesData_user', 'G__typename');
  }

  @override
  GGetUserBalancesData_user rebuild(
          void Function(GGetUserBalancesData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserBalancesData_userBuilder toBuilder() =>
      new GGetUserBalancesData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserBalancesData_user &&
        G__typename == other.G__typename &&
        currencies == other.currencies;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, currencies.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserBalancesData_user')
          ..add('G__typename', G__typename)
          ..add('currencies', currencies))
        .toString();
  }
}

class GGetUserBalancesData_userBuilder
    implements
        Builder<GGetUserBalancesData_user, GGetUserBalancesData_userBuilder> {
  _$GGetUserBalancesData_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetUserBalancesData_user_currencies?>? _currencies;
  ListBuilder<GGetUserBalancesData_user_currencies?> get currencies =>
      _$this._currencies ??=
          new ListBuilder<GGetUserBalancesData_user_currencies?>();
  set currencies(
          ListBuilder<GGetUserBalancesData_user_currencies?>? currencies) =>
      _$this._currencies = currencies;

  GGetUserBalancesData_userBuilder() {
    GGetUserBalancesData_user._initializeBuilder(this);
  }

  GGetUserBalancesData_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _currencies = $v.currencies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserBalancesData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserBalancesData_user;
  }

  @override
  void update(void Function(GGetUserBalancesData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserBalancesData_user build() => _build();

  _$GGetUserBalancesData_user _build() {
    _$GGetUserBalancesData_user _$result;
    try {
      _$result = _$v ??
          new _$GGetUserBalancesData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetUserBalancesData_user', 'G__typename'),
              currencies: _currencies?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currencies';
        _currencies?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUserBalancesData_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserBalancesData_user_currencies
    extends GGetUserBalancesData_user_currencies {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final bool? enabled;
  @override
  final double? balance;
  @override
  final double? advancedTradingBalance;
  @override
  final double? advancedTradingLockedBalance;
  @override
  final double? lockedBalance;
  @override
  final double? withdrawLockedBalance;
  @override
  final double? stakingLockedBalance;
  @override
  final double? activeStakingBalance;

  factory _$GGetUserBalancesData_user_currencies(
          [void Function(GGetUserBalancesData_user_currenciesBuilder)?
              updates]) =>
      (new GGetUserBalancesData_user_currenciesBuilder()..update(updates))
          ._build();

  _$GGetUserBalancesData_user_currencies._(
      {required this.G__typename,
      this.id,
      this.enabled,
      this.balance,
      this.advancedTradingBalance,
      this.advancedTradingLockedBalance,
      this.lockedBalance,
      this.withdrawLockedBalance,
      this.stakingLockedBalance,
      this.activeStakingBalance})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUserBalancesData_user_currencies', 'G__typename');
  }

  @override
  GGetUserBalancesData_user_currencies rebuild(
          void Function(GGetUserBalancesData_user_currenciesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserBalancesData_user_currenciesBuilder toBuilder() =>
      new GGetUserBalancesData_user_currenciesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserBalancesData_user_currencies &&
        G__typename == other.G__typename &&
        id == other.id &&
        enabled == other.enabled &&
        balance == other.balance &&
        advancedTradingBalance == other.advancedTradingBalance &&
        advancedTradingLockedBalance == other.advancedTradingLockedBalance &&
        lockedBalance == other.lockedBalance &&
        withdrawLockedBalance == other.withdrawLockedBalance &&
        stakingLockedBalance == other.stakingLockedBalance &&
        activeStakingBalance == other.activeStakingBalance;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, balance.hashCode);
    _$hash = $jc(_$hash, advancedTradingBalance.hashCode);
    _$hash = $jc(_$hash, advancedTradingLockedBalance.hashCode);
    _$hash = $jc(_$hash, lockedBalance.hashCode);
    _$hash = $jc(_$hash, withdrawLockedBalance.hashCode);
    _$hash = $jc(_$hash, stakingLockedBalance.hashCode);
    _$hash = $jc(_$hash, activeStakingBalance.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserBalancesData_user_currencies')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('enabled', enabled)
          ..add('balance', balance)
          ..add('advancedTradingBalance', advancedTradingBalance)
          ..add('advancedTradingLockedBalance', advancedTradingLockedBalance)
          ..add('lockedBalance', lockedBalance)
          ..add('withdrawLockedBalance', withdrawLockedBalance)
          ..add('stakingLockedBalance', stakingLockedBalance)
          ..add('activeStakingBalance', activeStakingBalance))
        .toString();
  }
}

class GGetUserBalancesData_user_currenciesBuilder
    implements
        Builder<GGetUserBalancesData_user_currencies,
            GGetUserBalancesData_user_currenciesBuilder> {
  _$GGetUserBalancesData_user_currencies? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  double? _balance;
  double? get balance => _$this._balance;
  set balance(double? balance) => _$this._balance = balance;

  double? _advancedTradingBalance;
  double? get advancedTradingBalance => _$this._advancedTradingBalance;
  set advancedTradingBalance(double? advancedTradingBalance) =>
      _$this._advancedTradingBalance = advancedTradingBalance;

  double? _advancedTradingLockedBalance;
  double? get advancedTradingLockedBalance =>
      _$this._advancedTradingLockedBalance;
  set advancedTradingLockedBalance(double? advancedTradingLockedBalance) =>
      _$this._advancedTradingLockedBalance = advancedTradingLockedBalance;

  double? _lockedBalance;
  double? get lockedBalance => _$this._lockedBalance;
  set lockedBalance(double? lockedBalance) =>
      _$this._lockedBalance = lockedBalance;

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

  GGetUserBalancesData_user_currenciesBuilder() {
    GGetUserBalancesData_user_currencies._initializeBuilder(this);
  }

  GGetUserBalancesData_user_currenciesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _enabled = $v.enabled;
      _balance = $v.balance;
      _advancedTradingBalance = $v.advancedTradingBalance;
      _advancedTradingLockedBalance = $v.advancedTradingLockedBalance;
      _lockedBalance = $v.lockedBalance;
      _withdrawLockedBalance = $v.withdrawLockedBalance;
      _stakingLockedBalance = $v.stakingLockedBalance;
      _activeStakingBalance = $v.activeStakingBalance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserBalancesData_user_currencies other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserBalancesData_user_currencies;
  }

  @override
  void update(
      void Function(GGetUserBalancesData_user_currenciesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserBalancesData_user_currencies build() => _build();

  _$GGetUserBalancesData_user_currencies _build() {
    final _$result = _$v ??
        new _$GGetUserBalancesData_user_currencies._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetUserBalancesData_user_currencies', 'G__typename'),
            id: id,
            enabled: enabled,
            balance: balance,
            advancedTradingBalance: advancedTradingBalance,
            advancedTradingLockedBalance: advancedTradingLockedBalance,
            lockedBalance: lockedBalance,
            withdrawLockedBalance: withdrawLockedBalance,
            stakingLockedBalance: stakingLockedBalance,
            activeStakingBalance: activeStakingBalance);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_balance_update_subscription.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetUserBalanceUpdatedData> _$gGetUserBalanceUpdatedDataSerializer =
    new _$GGetUserBalanceUpdatedDataSerializer();
Serializer<GGetUserBalanceUpdatedData_userBalanceUpdated>
    _$gGetUserBalanceUpdatedDataUserBalanceUpdatedSerializer =
    new _$GGetUserBalanceUpdatedData_userBalanceUpdatedSerializer();

class _$GGetUserBalanceUpdatedDataSerializer
    implements StructuredSerializer<GGetUserBalanceUpdatedData> {
  @override
  final Iterable<Type> types = const [
    GGetUserBalanceUpdatedData,
    _$GGetUserBalanceUpdatedData
  ];
  @override
  final String wireName = 'GGetUserBalanceUpdatedData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserBalanceUpdatedData object,
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
                const FullType(GGetUserBalanceUpdatedData_userBalanceUpdated)));
    }
    return result;
  }

  @override
  GGetUserBalanceUpdatedData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserBalanceUpdatedDataBuilder();

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
                  specifiedType: const FullType(
                      GGetUserBalanceUpdatedData_userBalanceUpdated))!
              as GGetUserBalanceUpdatedData_userBalanceUpdated);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserBalanceUpdatedData_userBalanceUpdatedSerializer
    implements
        StructuredSerializer<GGetUserBalanceUpdatedData_userBalanceUpdated> {
  @override
  final Iterable<Type> types = const [
    GGetUserBalanceUpdatedData_userBalanceUpdated,
    _$GGetUserBalanceUpdatedData_userBalanceUpdated
  ];
  @override
  final String wireName = 'GGetUserBalanceUpdatedData_userBalanceUpdated';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetUserBalanceUpdatedData_userBalanceUpdated object,
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
    value = object.advancedTradingLockedBalance;
    if (value != null) {
      result
        ..add('advancedTradingLockedBalance')
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
    value = object.ts;
    if (value != null) {
      result
        ..add('ts')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lockedBalance;
    if (value != null) {
      result
        ..add('lockedBalance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GGetUserBalanceUpdatedData_userBalanceUpdated deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder();

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
        case 'advancedTradingLockedBalance':
          result.advancedTradingLockedBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'advancedTradingBalance':
          result.advancedTradingBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'ts':
          result.ts = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lockedBalance':
          result.lockedBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserBalanceUpdatedData extends GGetUserBalanceUpdatedData {
  @override
  final String G__typename;
  @override
  final GGetUserBalanceUpdatedData_userBalanceUpdated? userBalanceUpdated;

  factory _$GGetUserBalanceUpdatedData(
          [void Function(GGetUserBalanceUpdatedDataBuilder)? updates]) =>
      (new GGetUserBalanceUpdatedDataBuilder()..update(updates))._build();

  _$GGetUserBalanceUpdatedData._(
      {required this.G__typename, this.userBalanceUpdated})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUserBalanceUpdatedData', 'G__typename');
  }

  @override
  GGetUserBalanceUpdatedData rebuild(
          void Function(GGetUserBalanceUpdatedDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserBalanceUpdatedDataBuilder toBuilder() =>
      new GGetUserBalanceUpdatedDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserBalanceUpdatedData &&
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
    return (newBuiltValueToStringHelper(r'GGetUserBalanceUpdatedData')
          ..add('G__typename', G__typename)
          ..add('userBalanceUpdated', userBalanceUpdated))
        .toString();
  }
}

class GGetUserBalanceUpdatedDataBuilder
    implements
        Builder<GGetUserBalanceUpdatedData, GGetUserBalanceUpdatedDataBuilder> {
  _$GGetUserBalanceUpdatedData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder? _userBalanceUpdated;
  GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder get userBalanceUpdated =>
      _$this._userBalanceUpdated ??=
          new GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder();
  set userBalanceUpdated(
          GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder?
              userBalanceUpdated) =>
      _$this._userBalanceUpdated = userBalanceUpdated;

  GGetUserBalanceUpdatedDataBuilder() {
    GGetUserBalanceUpdatedData._initializeBuilder(this);
  }

  GGetUserBalanceUpdatedDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userBalanceUpdated = $v.userBalanceUpdated?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserBalanceUpdatedData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserBalanceUpdatedData;
  }

  @override
  void update(void Function(GGetUserBalanceUpdatedDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserBalanceUpdatedData build() => _build();

  _$GGetUserBalanceUpdatedData _build() {
    _$GGetUserBalanceUpdatedData _$result;
    try {
      _$result = _$v ??
          new _$GGetUserBalanceUpdatedData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetUserBalanceUpdatedData', 'G__typename'),
              userBalanceUpdated: _userBalanceUpdated?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userBalanceUpdated';
        _userBalanceUpdated?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUserBalanceUpdatedData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserBalanceUpdatedData_userBalanceUpdated
    extends GGetUserBalanceUpdatedData_userBalanceUpdated {
  @override
  final String G__typename;
  @override
  final String? currencyId;
  @override
  final double? balance;
  @override
  final double? advancedTradingLockedBalance;
  @override
  final double? advancedTradingBalance;
  @override
  final String? ts;
  @override
  final double? lockedBalance;

  factory _$GGetUserBalanceUpdatedData_userBalanceUpdated(
          [void Function(GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder)?
              updates]) =>
      (new GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder()
            ..update(updates))
          ._build();

  _$GGetUserBalanceUpdatedData_userBalanceUpdated._(
      {required this.G__typename,
      this.currencyId,
      this.balance,
      this.advancedTradingLockedBalance,
      this.advancedTradingBalance,
      this.ts,
      this.lockedBalance})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetUserBalanceUpdatedData_userBalanceUpdated', 'G__typename');
  }

  @override
  GGetUserBalanceUpdatedData_userBalanceUpdated rebuild(
          void Function(GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder toBuilder() =>
      new GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserBalanceUpdatedData_userBalanceUpdated &&
        G__typename == other.G__typename &&
        currencyId == other.currencyId &&
        balance == other.balance &&
        advancedTradingLockedBalance == other.advancedTradingLockedBalance &&
        advancedTradingBalance == other.advancedTradingBalance &&
        ts == other.ts &&
        lockedBalance == other.lockedBalance;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, currencyId.hashCode);
    _$hash = $jc(_$hash, balance.hashCode);
    _$hash = $jc(_$hash, advancedTradingLockedBalance.hashCode);
    _$hash = $jc(_$hash, advancedTradingBalance.hashCode);
    _$hash = $jc(_$hash, ts.hashCode);
    _$hash = $jc(_$hash, lockedBalance.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetUserBalanceUpdatedData_userBalanceUpdated')
          ..add('G__typename', G__typename)
          ..add('currencyId', currencyId)
          ..add('balance', balance)
          ..add('advancedTradingLockedBalance', advancedTradingLockedBalance)
          ..add('advancedTradingBalance', advancedTradingBalance)
          ..add('ts', ts)
          ..add('lockedBalance', lockedBalance))
        .toString();
  }
}

class GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder
    implements
        Builder<GGetUserBalanceUpdatedData_userBalanceUpdated,
            GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder> {
  _$GGetUserBalanceUpdatedData_userBalanceUpdated? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _currencyId;
  String? get currencyId => _$this._currencyId;
  set currencyId(String? currencyId) => _$this._currencyId = currencyId;

  double? _balance;
  double? get balance => _$this._balance;
  set balance(double? balance) => _$this._balance = balance;

  double? _advancedTradingLockedBalance;
  double? get advancedTradingLockedBalance =>
      _$this._advancedTradingLockedBalance;
  set advancedTradingLockedBalance(double? advancedTradingLockedBalance) =>
      _$this._advancedTradingLockedBalance = advancedTradingLockedBalance;

  double? _advancedTradingBalance;
  double? get advancedTradingBalance => _$this._advancedTradingBalance;
  set advancedTradingBalance(double? advancedTradingBalance) =>
      _$this._advancedTradingBalance = advancedTradingBalance;

  String? _ts;
  String? get ts => _$this._ts;
  set ts(String? ts) => _$this._ts = ts;

  double? _lockedBalance;
  double? get lockedBalance => _$this._lockedBalance;
  set lockedBalance(double? lockedBalance) =>
      _$this._lockedBalance = lockedBalance;

  GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder() {
    GGetUserBalanceUpdatedData_userBalanceUpdated._initializeBuilder(this);
  }

  GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _currencyId = $v.currencyId;
      _balance = $v.balance;
      _advancedTradingLockedBalance = $v.advancedTradingLockedBalance;
      _advancedTradingBalance = $v.advancedTradingBalance;
      _ts = $v.ts;
      _lockedBalance = $v.lockedBalance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserBalanceUpdatedData_userBalanceUpdated other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserBalanceUpdatedData_userBalanceUpdated;
  }

  @override
  void update(
      void Function(GGetUserBalanceUpdatedData_userBalanceUpdatedBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserBalanceUpdatedData_userBalanceUpdated build() => _build();

  _$GGetUserBalanceUpdatedData_userBalanceUpdated _build() {
    final _$result = _$v ??
        new _$GGetUserBalanceUpdatedData_userBalanceUpdated._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetUserBalanceUpdatedData_userBalanceUpdated',
                'G__typename'),
            currencyId: currencyId,
            balance: balance,
            advancedTradingLockedBalance: advancedTradingLockedBalance,
            advancedTradingBalance: advancedTradingBalance,
            ts: ts,
            lockedBalance: lockedBalance);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

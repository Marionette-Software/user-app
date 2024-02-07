// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallets_data.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTradeWalletsDataData> _$gTradeWalletsDataDataSerializer =
    new _$GTradeWalletsDataDataSerializer();
Serializer<GTradeWalletsDataData_user> _$gTradeWalletsDataDataUserSerializer =
    new _$GTradeWalletsDataData_userSerializer();
Serializer<GTradeWalletsDataData_user_currencies>
    _$gTradeWalletsDataDataUserCurrenciesSerializer =
    new _$GTradeWalletsDataData_user_currenciesSerializer();

class _$GTradeWalletsDataDataSerializer
    implements StructuredSerializer<GTradeWalletsDataData> {
  @override
  final Iterable<Type> types = const [
    GTradeWalletsDataData,
    _$GTradeWalletsDataData
  ];
  @override
  final String wireName = 'GTradeWalletsDataData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GTradeWalletsDataData object,
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
            specifiedType: const FullType(GTradeWalletsDataData_user)));
    }
    return result;
  }

  @override
  GTradeWalletsDataData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTradeWalletsDataDataBuilder();

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
                  specifiedType: const FullType(GTradeWalletsDataData_user))!
              as GTradeWalletsDataData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GTradeWalletsDataData_userSerializer
    implements StructuredSerializer<GTradeWalletsDataData_user> {
  @override
  final Iterable<Type> types = const [
    GTradeWalletsDataData_user,
    _$GTradeWalletsDataData_user
  ];
  @override
  final String wireName = 'GTradeWalletsDataData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GTradeWalletsDataData_user object,
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
              const FullType.nullable(GTradeWalletsDataData_user_currencies)
            ])));
    }
    return result;
  }

  @override
  GTradeWalletsDataData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTradeWalletsDataData_userBuilder();

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
                const FullType.nullable(GTradeWalletsDataData_user_currencies)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GTradeWalletsDataData_user_currenciesSerializer
    implements StructuredSerializer<GTradeWalletsDataData_user_currencies> {
  @override
  final Iterable<Type> types = const [
    GTradeWalletsDataData_user_currencies,
    _$GTradeWalletsDataData_user_currencies
  ];
  @override
  final String wireName = 'GTradeWalletsDataData_user_currencies';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GTradeWalletsDataData_user_currencies object,
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
    value = object.advancedTradingBalance;
    if (value != null) {
      result
        ..add('advancedTradingBalance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.balance;
    if (value != null) {
      result
        ..add('balance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GTradeWalletsDataData_user_currencies deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTradeWalletsDataData_user_currenciesBuilder();

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
        case 'advancedTradingBalance':
          result.advancedTradingBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'balance':
          result.balance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GTradeWalletsDataData extends GTradeWalletsDataData {
  @override
  final String G__typename;
  @override
  final GTradeWalletsDataData_user? user;

  factory _$GTradeWalletsDataData(
          [void Function(GTradeWalletsDataDataBuilder)? updates]) =>
      (new GTradeWalletsDataDataBuilder()..update(updates))._build();

  _$GTradeWalletsDataData._({required this.G__typename, this.user})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GTradeWalletsDataData', 'G__typename');
  }

  @override
  GTradeWalletsDataData rebuild(
          void Function(GTradeWalletsDataDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTradeWalletsDataDataBuilder toBuilder() =>
      new GTradeWalletsDataDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTradeWalletsDataData &&
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
    return (newBuiltValueToStringHelper(r'GTradeWalletsDataData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GTradeWalletsDataDataBuilder
    implements Builder<GTradeWalletsDataData, GTradeWalletsDataDataBuilder> {
  _$GTradeWalletsDataData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GTradeWalletsDataData_userBuilder? _user;
  GTradeWalletsDataData_userBuilder get user =>
      _$this._user ??= new GTradeWalletsDataData_userBuilder();
  set user(GTradeWalletsDataData_userBuilder? user) => _$this._user = user;

  GTradeWalletsDataDataBuilder() {
    GTradeWalletsDataData._initializeBuilder(this);
  }

  GTradeWalletsDataDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTradeWalletsDataData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTradeWalletsDataData;
  }

  @override
  void update(void Function(GTradeWalletsDataDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTradeWalletsDataData build() => _build();

  _$GTradeWalletsDataData _build() {
    _$GTradeWalletsDataData _$result;
    try {
      _$result = _$v ??
          new _$GTradeWalletsDataData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GTradeWalletsDataData', 'G__typename'),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GTradeWalletsDataData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GTradeWalletsDataData_user extends GTradeWalletsDataData_user {
  @override
  final String G__typename;
  @override
  final BuiltList<GTradeWalletsDataData_user_currencies?>? currencies;

  factory _$GTradeWalletsDataData_user(
          [void Function(GTradeWalletsDataData_userBuilder)? updates]) =>
      (new GTradeWalletsDataData_userBuilder()..update(updates))._build();

  _$GTradeWalletsDataData_user._({required this.G__typename, this.currencies})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GTradeWalletsDataData_user', 'G__typename');
  }

  @override
  GTradeWalletsDataData_user rebuild(
          void Function(GTradeWalletsDataData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTradeWalletsDataData_userBuilder toBuilder() =>
      new GTradeWalletsDataData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTradeWalletsDataData_user &&
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
    return (newBuiltValueToStringHelper(r'GTradeWalletsDataData_user')
          ..add('G__typename', G__typename)
          ..add('currencies', currencies))
        .toString();
  }
}

class GTradeWalletsDataData_userBuilder
    implements
        Builder<GTradeWalletsDataData_user, GTradeWalletsDataData_userBuilder> {
  _$GTradeWalletsDataData_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GTradeWalletsDataData_user_currencies?>? _currencies;
  ListBuilder<GTradeWalletsDataData_user_currencies?> get currencies =>
      _$this._currencies ??=
          new ListBuilder<GTradeWalletsDataData_user_currencies?>();
  set currencies(
          ListBuilder<GTradeWalletsDataData_user_currencies?>? currencies) =>
      _$this._currencies = currencies;

  GTradeWalletsDataData_userBuilder() {
    GTradeWalletsDataData_user._initializeBuilder(this);
  }

  GTradeWalletsDataData_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _currencies = $v.currencies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTradeWalletsDataData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTradeWalletsDataData_user;
  }

  @override
  void update(void Function(GTradeWalletsDataData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTradeWalletsDataData_user build() => _build();

  _$GTradeWalletsDataData_user _build() {
    _$GTradeWalletsDataData_user _$result;
    try {
      _$result = _$v ??
          new _$GTradeWalletsDataData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GTradeWalletsDataData_user', 'G__typename'),
              currencies: _currencies?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currencies';
        _currencies?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GTradeWalletsDataData_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GTradeWalletsDataData_user_currencies
    extends GTradeWalletsDataData_user_currencies {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final double? advancedTradingBalance;
  @override
  final double? balance;

  factory _$GTradeWalletsDataData_user_currencies(
          [void Function(GTradeWalletsDataData_user_currenciesBuilder)?
              updates]) =>
      (new GTradeWalletsDataData_user_currenciesBuilder()..update(updates))
          ._build();

  _$GTradeWalletsDataData_user_currencies._(
      {required this.G__typename,
      this.id,
      this.advancedTradingBalance,
      this.balance})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GTradeWalletsDataData_user_currencies', 'G__typename');
  }

  @override
  GTradeWalletsDataData_user_currencies rebuild(
          void Function(GTradeWalletsDataData_user_currenciesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTradeWalletsDataData_user_currenciesBuilder toBuilder() =>
      new GTradeWalletsDataData_user_currenciesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTradeWalletsDataData_user_currencies &&
        G__typename == other.G__typename &&
        id == other.id &&
        advancedTradingBalance == other.advancedTradingBalance &&
        balance == other.balance;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, advancedTradingBalance.hashCode);
    _$hash = $jc(_$hash, balance.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GTradeWalletsDataData_user_currencies')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('advancedTradingBalance', advancedTradingBalance)
          ..add('balance', balance))
        .toString();
  }
}

class GTradeWalletsDataData_user_currenciesBuilder
    implements
        Builder<GTradeWalletsDataData_user_currencies,
            GTradeWalletsDataData_user_currenciesBuilder> {
  _$GTradeWalletsDataData_user_currencies? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  double? _advancedTradingBalance;
  double? get advancedTradingBalance => _$this._advancedTradingBalance;
  set advancedTradingBalance(double? advancedTradingBalance) =>
      _$this._advancedTradingBalance = advancedTradingBalance;

  double? _balance;
  double? get balance => _$this._balance;
  set balance(double? balance) => _$this._balance = balance;

  GTradeWalletsDataData_user_currenciesBuilder() {
    GTradeWalletsDataData_user_currencies._initializeBuilder(this);
  }

  GTradeWalletsDataData_user_currenciesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _advancedTradingBalance = $v.advancedTradingBalance;
      _balance = $v.balance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTradeWalletsDataData_user_currencies other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTradeWalletsDataData_user_currencies;
  }

  @override
  void update(
      void Function(GTradeWalletsDataData_user_currenciesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTradeWalletsDataData_user_currencies build() => _build();

  _$GTradeWalletsDataData_user_currencies _build() {
    final _$result = _$v ??
        new _$GTradeWalletsDataData_user_currencies._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GTradeWalletsDataData_user_currencies', 'G__typename'),
            id: id,
            advancedTradingBalance: advancedTradingBalance,
            balance: balance);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_currency_for_filter_history.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetCurrencyForFilterHistoryData>
    _$gGetCurrencyForFilterHistoryDataSerializer =
    new _$GGetCurrencyForFilterHistoryDataSerializer();
Serializer<GGetCurrencyForFilterHistoryData_user>
    _$gGetCurrencyForFilterHistoryDataUserSerializer =
    new _$GGetCurrencyForFilterHistoryData_userSerializer();
Serializer<GGetCurrencyForFilterHistoryData_user_currencies>
    _$gGetCurrencyForFilterHistoryDataUserCurrenciesSerializer =
    new _$GGetCurrencyForFilterHistoryData_user_currenciesSerializer();

class _$GGetCurrencyForFilterHistoryDataSerializer
    implements StructuredSerializer<GGetCurrencyForFilterHistoryData> {
  @override
  final Iterable<Type> types = const [
    GGetCurrencyForFilterHistoryData,
    _$GGetCurrencyForFilterHistoryData
  ];
  @override
  final String wireName = 'GGetCurrencyForFilterHistoryData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetCurrencyForFilterHistoryData object,
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
            specifiedType:
                const FullType(GGetCurrencyForFilterHistoryData_user)));
    }
    return result;
  }

  @override
  GGetCurrencyForFilterHistoryData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetCurrencyForFilterHistoryDataBuilder();

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
                  specifiedType:
                      const FullType(GGetCurrencyForFilterHistoryData_user))!
              as GGetCurrencyForFilterHistoryData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetCurrencyForFilterHistoryData_userSerializer
    implements StructuredSerializer<GGetCurrencyForFilterHistoryData_user> {
  @override
  final Iterable<Type> types = const [
    GGetCurrencyForFilterHistoryData_user,
    _$GGetCurrencyForFilterHistoryData_user
  ];
  @override
  final String wireName = 'GGetCurrencyForFilterHistoryData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetCurrencyForFilterHistoryData_user object,
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
              const FullType.nullable(
                  GGetCurrencyForFilterHistoryData_user_currencies)
            ])));
    }
    return result;
  }

  @override
  GGetCurrencyForFilterHistoryData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetCurrencyForFilterHistoryData_userBuilder();

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
                const FullType.nullable(
                    GGetCurrencyForFilterHistoryData_user_currencies)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetCurrencyForFilterHistoryData_user_currenciesSerializer
    implements
        StructuredSerializer<GGetCurrencyForFilterHistoryData_user_currencies> {
  @override
  final Iterable<Type> types = const [
    GGetCurrencyForFilterHistoryData_user_currencies,
    _$GGetCurrencyForFilterHistoryData_user_currencies
  ];
  @override
  final String wireName = 'GGetCurrencyForFilterHistoryData_user_currencies';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetCurrencyForFilterHistoryData_user_currencies object,
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
    return result;
  }

  @override
  GGetCurrencyForFilterHistoryData_user_currencies deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetCurrencyForFilterHistoryData_user_currenciesBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GGetCurrencyForFilterHistoryData
    extends GGetCurrencyForFilterHistoryData {
  @override
  final String G__typename;
  @override
  final GGetCurrencyForFilterHistoryData_user? user;

  factory _$GGetCurrencyForFilterHistoryData(
          [void Function(GGetCurrencyForFilterHistoryDataBuilder)? updates]) =>
      (new GGetCurrencyForFilterHistoryDataBuilder()..update(updates))._build();

  _$GGetCurrencyForFilterHistoryData._({required this.G__typename, this.user})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetCurrencyForFilterHistoryData', 'G__typename');
  }

  @override
  GGetCurrencyForFilterHistoryData rebuild(
          void Function(GGetCurrencyForFilterHistoryDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetCurrencyForFilterHistoryDataBuilder toBuilder() =>
      new GGetCurrencyForFilterHistoryDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetCurrencyForFilterHistoryData &&
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
    return (newBuiltValueToStringHelper(r'GGetCurrencyForFilterHistoryData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GGetCurrencyForFilterHistoryDataBuilder
    implements
        Builder<GGetCurrencyForFilterHistoryData,
            GGetCurrencyForFilterHistoryDataBuilder> {
  _$GGetCurrencyForFilterHistoryData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetCurrencyForFilterHistoryData_userBuilder? _user;
  GGetCurrencyForFilterHistoryData_userBuilder get user =>
      _$this._user ??= new GGetCurrencyForFilterHistoryData_userBuilder();
  set user(GGetCurrencyForFilterHistoryData_userBuilder? user) =>
      _$this._user = user;

  GGetCurrencyForFilterHistoryDataBuilder() {
    GGetCurrencyForFilterHistoryData._initializeBuilder(this);
  }

  GGetCurrencyForFilterHistoryDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetCurrencyForFilterHistoryData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetCurrencyForFilterHistoryData;
  }

  @override
  void update(void Function(GGetCurrencyForFilterHistoryDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetCurrencyForFilterHistoryData build() => _build();

  _$GGetCurrencyForFilterHistoryData _build() {
    _$GGetCurrencyForFilterHistoryData _$result;
    try {
      _$result = _$v ??
          new _$GGetCurrencyForFilterHistoryData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetCurrencyForFilterHistoryData', 'G__typename'),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetCurrencyForFilterHistoryData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetCurrencyForFilterHistoryData_user
    extends GGetCurrencyForFilterHistoryData_user {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetCurrencyForFilterHistoryData_user_currencies?>?
      currencies;

  factory _$GGetCurrencyForFilterHistoryData_user(
          [void Function(GGetCurrencyForFilterHistoryData_userBuilder)?
              updates]) =>
      (new GGetCurrencyForFilterHistoryData_userBuilder()..update(updates))
          ._build();

  _$GGetCurrencyForFilterHistoryData_user._(
      {required this.G__typename, this.currencies})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetCurrencyForFilterHistoryData_user', 'G__typename');
  }

  @override
  GGetCurrencyForFilterHistoryData_user rebuild(
          void Function(GGetCurrencyForFilterHistoryData_userBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetCurrencyForFilterHistoryData_userBuilder toBuilder() =>
      new GGetCurrencyForFilterHistoryData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetCurrencyForFilterHistoryData_user &&
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
    return (newBuiltValueToStringHelper(
            r'GGetCurrencyForFilterHistoryData_user')
          ..add('G__typename', G__typename)
          ..add('currencies', currencies))
        .toString();
  }
}

class GGetCurrencyForFilterHistoryData_userBuilder
    implements
        Builder<GGetCurrencyForFilterHistoryData_user,
            GGetCurrencyForFilterHistoryData_userBuilder> {
  _$GGetCurrencyForFilterHistoryData_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetCurrencyForFilterHistoryData_user_currencies?>? _currencies;
  ListBuilder<GGetCurrencyForFilterHistoryData_user_currencies?>
      get currencies => _$this._currencies ??=
          new ListBuilder<GGetCurrencyForFilterHistoryData_user_currencies?>();
  set currencies(
          ListBuilder<GGetCurrencyForFilterHistoryData_user_currencies?>?
              currencies) =>
      _$this._currencies = currencies;

  GGetCurrencyForFilterHistoryData_userBuilder() {
    GGetCurrencyForFilterHistoryData_user._initializeBuilder(this);
  }

  GGetCurrencyForFilterHistoryData_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _currencies = $v.currencies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetCurrencyForFilterHistoryData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetCurrencyForFilterHistoryData_user;
  }

  @override
  void update(
      void Function(GGetCurrencyForFilterHistoryData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetCurrencyForFilterHistoryData_user build() => _build();

  _$GGetCurrencyForFilterHistoryData_user _build() {
    _$GGetCurrencyForFilterHistoryData_user _$result;
    try {
      _$result = _$v ??
          new _$GGetCurrencyForFilterHistoryData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetCurrencyForFilterHistoryData_user', 'G__typename'),
              currencies: _currencies?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currencies';
        _currencies?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetCurrencyForFilterHistoryData_user',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetCurrencyForFilterHistoryData_user_currencies
    extends GGetCurrencyForFilterHistoryData_user_currencies {
  @override
  final String G__typename;
  @override
  final String? id;

  factory _$GGetCurrencyForFilterHistoryData_user_currencies(
          [void Function(
                  GGetCurrencyForFilterHistoryData_user_currenciesBuilder)?
              updates]) =>
      (new GGetCurrencyForFilterHistoryData_user_currenciesBuilder()
            ..update(updates))
          ._build();

  _$GGetCurrencyForFilterHistoryData_user_currencies._(
      {required this.G__typename, this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetCurrencyForFilterHistoryData_user_currencies', 'G__typename');
  }

  @override
  GGetCurrencyForFilterHistoryData_user_currencies rebuild(
          void Function(GGetCurrencyForFilterHistoryData_user_currenciesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetCurrencyForFilterHistoryData_user_currenciesBuilder toBuilder() =>
      new GGetCurrencyForFilterHistoryData_user_currenciesBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetCurrencyForFilterHistoryData_user_currencies &&
        G__typename == other.G__typename &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetCurrencyForFilterHistoryData_user_currencies')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GGetCurrencyForFilterHistoryData_user_currenciesBuilder
    implements
        Builder<GGetCurrencyForFilterHistoryData_user_currencies,
            GGetCurrencyForFilterHistoryData_user_currenciesBuilder> {
  _$GGetCurrencyForFilterHistoryData_user_currencies? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GGetCurrencyForFilterHistoryData_user_currenciesBuilder() {
    GGetCurrencyForFilterHistoryData_user_currencies._initializeBuilder(this);
  }

  GGetCurrencyForFilterHistoryData_user_currenciesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetCurrencyForFilterHistoryData_user_currencies other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetCurrencyForFilterHistoryData_user_currencies;
  }

  @override
  void update(
      void Function(GGetCurrencyForFilterHistoryData_user_currenciesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetCurrencyForFilterHistoryData_user_currencies build() => _build();

  _$GGetCurrencyForFilterHistoryData_user_currencies _build() {
    final _$result = _$v ??
        new _$GGetCurrencyForFilterHistoryData_user_currencies._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetCurrencyForFilterHistoryData_user_currencies',
                'G__typename'),
            id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

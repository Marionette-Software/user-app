// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_trades_history.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetUserTradesHistoryData> _$gGetUserTradesHistoryDataSerializer =
    new _$GGetUserTradesHistoryDataSerializer();
Serializer<GGetUserTradesHistoryData_userTrades>
    _$gGetUserTradesHistoryDataUserTradesSerializer =
    new _$GGetUserTradesHistoryData_userTradesSerializer();
Serializer<GGetUserTradesHistoryData_userTrades_result>
    _$gGetUserTradesHistoryDataUserTradesResultSerializer =
    new _$GGetUserTradesHistoryData_userTrades_resultSerializer();

class _$GGetUserTradesHistoryDataSerializer
    implements StructuredSerializer<GGetUserTradesHistoryData> {
  @override
  final Iterable<Type> types = const [
    GGetUserTradesHistoryData,
    _$GGetUserTradesHistoryData
  ];
  @override
  final String wireName = 'GGetUserTradesHistoryData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserTradesHistoryData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.userTrades;
    if (value != null) {
      result
        ..add('userTrades')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GGetUserTradesHistoryData_userTrades)));
    }
    return result;
  }

  @override
  GGetUserTradesHistoryData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserTradesHistoryDataBuilder();

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
        case 'userTrades':
          result.userTrades.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetUserTradesHistoryData_userTrades))!
              as GGetUserTradesHistoryData_userTrades);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserTradesHistoryData_userTradesSerializer
    implements StructuredSerializer<GGetUserTradesHistoryData_userTrades> {
  @override
  final Iterable<Type> types = const [
    GGetUserTradesHistoryData_userTrades,
    _$GGetUserTradesHistoryData_userTrades
  ];
  @override
  final String wireName = 'GGetUserTradesHistoryData_userTrades';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserTradesHistoryData_userTrades object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.result;
    if (value != null) {
      result
        ..add('result')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GGetUserTradesHistoryData_userTrades_result)
            ])));
    }
    return result;
  }

  @override
  GGetUserTradesHistoryData_userTrades deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserTradesHistoryData_userTradesBuilder();

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
        case 'result':
          result.result.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GGetUserTradesHistoryData_userTrades_result)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserTradesHistoryData_userTrades_resultSerializer
    implements
        StructuredSerializer<GGetUserTradesHistoryData_userTrades_result> {
  @override
  final Iterable<Type> types = const [
    GGetUserTradesHistoryData_userTrades_result,
    _$GGetUserTradesHistoryData_userTrades_result
  ];
  @override
  final String wireName = 'GGetUserTradesHistoryData_userTrades_result';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetUserTradesHistoryData_userTrades_result object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sellUserId;
    if (value != null) {
      result
        ..add('sellUserId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.buyUserId;
    if (value != null) {
      result
        ..add('buyUserId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetUserTradesHistoryData_userTrades_result deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserTradesHistoryData_userTrades_resultBuilder();

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
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sellUserId':
          result.sellUserId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'buyUserId':
          result.buyUserId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserTradesHistoryData extends GGetUserTradesHistoryData {
  @override
  final String G__typename;
  @override
  final GGetUserTradesHistoryData_userTrades? userTrades;

  factory _$GGetUserTradesHistoryData(
          [void Function(GGetUserTradesHistoryDataBuilder)? updates]) =>
      (new GGetUserTradesHistoryDataBuilder()..update(updates))._build();

  _$GGetUserTradesHistoryData._({required this.G__typename, this.userTrades})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUserTradesHistoryData', 'G__typename');
  }

  @override
  GGetUserTradesHistoryData rebuild(
          void Function(GGetUserTradesHistoryDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserTradesHistoryDataBuilder toBuilder() =>
      new GGetUserTradesHistoryDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserTradesHistoryData &&
        G__typename == other.G__typename &&
        userTrades == other.userTrades;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, userTrades.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserTradesHistoryData')
          ..add('G__typename', G__typename)
          ..add('userTrades', userTrades))
        .toString();
  }
}

class GGetUserTradesHistoryDataBuilder
    implements
        Builder<GGetUserTradesHistoryData, GGetUserTradesHistoryDataBuilder> {
  _$GGetUserTradesHistoryData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetUserTradesHistoryData_userTradesBuilder? _userTrades;
  GGetUserTradesHistoryData_userTradesBuilder get userTrades =>
      _$this._userTrades ??= new GGetUserTradesHistoryData_userTradesBuilder();
  set userTrades(GGetUserTradesHistoryData_userTradesBuilder? userTrades) =>
      _$this._userTrades = userTrades;

  GGetUserTradesHistoryDataBuilder() {
    GGetUserTradesHistoryData._initializeBuilder(this);
  }

  GGetUserTradesHistoryDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userTrades = $v.userTrades?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserTradesHistoryData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserTradesHistoryData;
  }

  @override
  void update(void Function(GGetUserTradesHistoryDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserTradesHistoryData build() => _build();

  _$GGetUserTradesHistoryData _build() {
    _$GGetUserTradesHistoryData _$result;
    try {
      _$result = _$v ??
          new _$GGetUserTradesHistoryData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetUserTradesHistoryData', 'G__typename'),
              userTrades: _userTrades?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userTrades';
        _userTrades?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUserTradesHistoryData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserTradesHistoryData_userTrades
    extends GGetUserTradesHistoryData_userTrades {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetUserTradesHistoryData_userTrades_result?>? result;

  factory _$GGetUserTradesHistoryData_userTrades(
          [void Function(GGetUserTradesHistoryData_userTradesBuilder)?
              updates]) =>
      (new GGetUserTradesHistoryData_userTradesBuilder()..update(updates))
          ._build();

  _$GGetUserTradesHistoryData_userTrades._(
      {required this.G__typename, this.result})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUserTradesHistoryData_userTrades', 'G__typename');
  }

  @override
  GGetUserTradesHistoryData_userTrades rebuild(
          void Function(GGetUserTradesHistoryData_userTradesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserTradesHistoryData_userTradesBuilder toBuilder() =>
      new GGetUserTradesHistoryData_userTradesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserTradesHistoryData_userTrades &&
        G__typename == other.G__typename &&
        result == other.result;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, result.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserTradesHistoryData_userTrades')
          ..add('G__typename', G__typename)
          ..add('result', result))
        .toString();
  }
}

class GGetUserTradesHistoryData_userTradesBuilder
    implements
        Builder<GGetUserTradesHistoryData_userTrades,
            GGetUserTradesHistoryData_userTradesBuilder> {
  _$GGetUserTradesHistoryData_userTrades? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetUserTradesHistoryData_userTrades_result?>? _result;
  ListBuilder<GGetUserTradesHistoryData_userTrades_result?> get result =>
      _$this._result ??=
          new ListBuilder<GGetUserTradesHistoryData_userTrades_result?>();
  set result(
          ListBuilder<GGetUserTradesHistoryData_userTrades_result?>? result) =>
      _$this._result = result;

  GGetUserTradesHistoryData_userTradesBuilder() {
    GGetUserTradesHistoryData_userTrades._initializeBuilder(this);
  }

  GGetUserTradesHistoryData_userTradesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _result = $v.result?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserTradesHistoryData_userTrades other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserTradesHistoryData_userTrades;
  }

  @override
  void update(
      void Function(GGetUserTradesHistoryData_userTradesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserTradesHistoryData_userTrades build() => _build();

  _$GGetUserTradesHistoryData_userTrades _build() {
    _$GGetUserTradesHistoryData_userTrades _$result;
    try {
      _$result = _$v ??
          new _$GGetUserTradesHistoryData_userTrades._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetUserTradesHistoryData_userTrades', 'G__typename'),
              result: _result?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'result';
        _result?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUserTradesHistoryData_userTrades',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserTradesHistoryData_userTrades_result
    extends GGetUserTradesHistoryData_userTrades_result {
  @override
  final String G__typename;
  @override
  final double? price;
  @override
  final double? amount;
  @override
  final String? createdAt;
  @override
  final String? sellUserId;
  @override
  final String? buyUserId;

  factory _$GGetUserTradesHistoryData_userTrades_result(
          [void Function(GGetUserTradesHistoryData_userTrades_resultBuilder)?
              updates]) =>
      (new GGetUserTradesHistoryData_userTrades_resultBuilder()
            ..update(updates))
          ._build();

  _$GGetUserTradesHistoryData_userTrades_result._(
      {required this.G__typename,
      this.price,
      this.amount,
      this.createdAt,
      this.sellUserId,
      this.buyUserId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetUserTradesHistoryData_userTrades_result', 'G__typename');
  }

  @override
  GGetUserTradesHistoryData_userTrades_result rebuild(
          void Function(GGetUserTradesHistoryData_userTrades_resultBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserTradesHistoryData_userTrades_resultBuilder toBuilder() =>
      new GGetUserTradesHistoryData_userTrades_resultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserTradesHistoryData_userTrades_result &&
        G__typename == other.G__typename &&
        price == other.price &&
        amount == other.amount &&
        createdAt == other.createdAt &&
        sellUserId == other.sellUserId &&
        buyUserId == other.buyUserId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, sellUserId.hashCode);
    _$hash = $jc(_$hash, buyUserId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetUserTradesHistoryData_userTrades_result')
          ..add('G__typename', G__typename)
          ..add('price', price)
          ..add('amount', amount)
          ..add('createdAt', createdAt)
          ..add('sellUserId', sellUserId)
          ..add('buyUserId', buyUserId))
        .toString();
  }
}

class GGetUserTradesHistoryData_userTrades_resultBuilder
    implements
        Builder<GGetUserTradesHistoryData_userTrades_result,
            GGetUserTradesHistoryData_userTrades_resultBuilder> {
  _$GGetUserTradesHistoryData_userTrades_result? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _sellUserId;
  String? get sellUserId => _$this._sellUserId;
  set sellUserId(String? sellUserId) => _$this._sellUserId = sellUserId;

  String? _buyUserId;
  String? get buyUserId => _$this._buyUserId;
  set buyUserId(String? buyUserId) => _$this._buyUserId = buyUserId;

  GGetUserTradesHistoryData_userTrades_resultBuilder() {
    GGetUserTradesHistoryData_userTrades_result._initializeBuilder(this);
  }

  GGetUserTradesHistoryData_userTrades_resultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _price = $v.price;
      _amount = $v.amount;
      _createdAt = $v.createdAt;
      _sellUserId = $v.sellUserId;
      _buyUserId = $v.buyUserId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserTradesHistoryData_userTrades_result other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserTradesHistoryData_userTrades_result;
  }

  @override
  void update(
      void Function(GGetUserTradesHistoryData_userTrades_resultBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserTradesHistoryData_userTrades_result build() => _build();

  _$GGetUserTradesHistoryData_userTrades_result _build() {
    final _$result = _$v ??
        new _$GGetUserTradesHistoryData_userTrades_result._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetUserTradesHistoryData_userTrades_result', 'G__typename'),
            price: price,
            amount: amount,
            createdAt: createdAt,
            sellUserId: sellUserId,
            buyUserId: buyUserId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

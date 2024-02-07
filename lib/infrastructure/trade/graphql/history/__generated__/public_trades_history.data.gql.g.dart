// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_trades_history.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetPublicTradesHistoryData>
    _$gGetPublicTradesHistoryDataSerializer =
    new _$GGetPublicTradesHistoryDataSerializer();
Serializer<GGetPublicTradesHistoryData_publicTrades>
    _$gGetPublicTradesHistoryDataPublicTradesSerializer =
    new _$GGetPublicTradesHistoryData_publicTradesSerializer();
Serializer<GGetPublicTradesHistoryData_publicTrades_result>
    _$gGetPublicTradesHistoryDataPublicTradesResultSerializer =
    new _$GGetPublicTradesHistoryData_publicTrades_resultSerializer();

class _$GGetPublicTradesHistoryDataSerializer
    implements StructuredSerializer<GGetPublicTradesHistoryData> {
  @override
  final Iterable<Type> types = const [
    GGetPublicTradesHistoryData,
    _$GGetPublicTradesHistoryData
  ];
  @override
  final String wireName = 'GGetPublicTradesHistoryData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetPublicTradesHistoryData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.publicTrades;
    if (value != null) {
      result
        ..add('publicTrades')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GGetPublicTradesHistoryData_publicTrades)));
    }
    return result;
  }

  @override
  GGetPublicTradesHistoryData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetPublicTradesHistoryDataBuilder();

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
        case 'publicTrades':
          result.publicTrades.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetPublicTradesHistoryData_publicTrades))!
              as GGetPublicTradesHistoryData_publicTrades);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetPublicTradesHistoryData_publicTradesSerializer
    implements StructuredSerializer<GGetPublicTradesHistoryData_publicTrades> {
  @override
  final Iterable<Type> types = const [
    GGetPublicTradesHistoryData_publicTrades,
    _$GGetPublicTradesHistoryData_publicTrades
  ];
  @override
  final String wireName = 'GGetPublicTradesHistoryData_publicTrades';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetPublicTradesHistoryData_publicTrades object,
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
                  GGetPublicTradesHistoryData_publicTrades_result)
            ])));
    }
    return result;
  }

  @override
  GGetPublicTradesHistoryData_publicTrades deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetPublicTradesHistoryData_publicTradesBuilder();

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
                    GGetPublicTradesHistoryData_publicTrades_result)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetPublicTradesHistoryData_publicTrades_resultSerializer
    implements
        StructuredSerializer<GGetPublicTradesHistoryData_publicTrades_result> {
  @override
  final Iterable<Type> types = const [
    GGetPublicTradesHistoryData_publicTrades_result,
    _$GGetPublicTradesHistoryData_publicTrades_result
  ];
  @override
  final String wireName = 'GGetPublicTradesHistoryData_publicTrades_result';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetPublicTradesHistoryData_publicTrades_result object,
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
    value = object.makerOrderSide;
    if (value != null) {
      result
        ..add('makerOrderSide')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetPublicTradesHistoryData_publicTrades_result deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetPublicTradesHistoryData_publicTrades_resultBuilder();

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
        case 'makerOrderSide':
          result.makerOrderSide = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetPublicTradesHistoryData extends GGetPublicTradesHistoryData {
  @override
  final String G__typename;
  @override
  final GGetPublicTradesHistoryData_publicTrades? publicTrades;

  factory _$GGetPublicTradesHistoryData(
          [void Function(GGetPublicTradesHistoryDataBuilder)? updates]) =>
      (new GGetPublicTradesHistoryDataBuilder()..update(updates))._build();

  _$GGetPublicTradesHistoryData._(
      {required this.G__typename, this.publicTrades})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetPublicTradesHistoryData', 'G__typename');
  }

  @override
  GGetPublicTradesHistoryData rebuild(
          void Function(GGetPublicTradesHistoryDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetPublicTradesHistoryDataBuilder toBuilder() =>
      new GGetPublicTradesHistoryDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetPublicTradesHistoryData &&
        G__typename == other.G__typename &&
        publicTrades == other.publicTrades;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, publicTrades.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetPublicTradesHistoryData')
          ..add('G__typename', G__typename)
          ..add('publicTrades', publicTrades))
        .toString();
  }
}

class GGetPublicTradesHistoryDataBuilder
    implements
        Builder<GGetPublicTradesHistoryData,
            GGetPublicTradesHistoryDataBuilder> {
  _$GGetPublicTradesHistoryData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetPublicTradesHistoryData_publicTradesBuilder? _publicTrades;
  GGetPublicTradesHistoryData_publicTradesBuilder get publicTrades =>
      _$this._publicTrades ??=
          new GGetPublicTradesHistoryData_publicTradesBuilder();
  set publicTrades(
          GGetPublicTradesHistoryData_publicTradesBuilder? publicTrades) =>
      _$this._publicTrades = publicTrades;

  GGetPublicTradesHistoryDataBuilder() {
    GGetPublicTradesHistoryData._initializeBuilder(this);
  }

  GGetPublicTradesHistoryDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _publicTrades = $v.publicTrades?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetPublicTradesHistoryData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetPublicTradesHistoryData;
  }

  @override
  void update(void Function(GGetPublicTradesHistoryDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetPublicTradesHistoryData build() => _build();

  _$GGetPublicTradesHistoryData _build() {
    _$GGetPublicTradesHistoryData _$result;
    try {
      _$result = _$v ??
          new _$GGetPublicTradesHistoryData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetPublicTradesHistoryData', 'G__typename'),
              publicTrades: _publicTrades?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'publicTrades';
        _publicTrades?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetPublicTradesHistoryData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetPublicTradesHistoryData_publicTrades
    extends GGetPublicTradesHistoryData_publicTrades {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetPublicTradesHistoryData_publicTrades_result?>? result;

  factory _$GGetPublicTradesHistoryData_publicTrades(
          [void Function(GGetPublicTradesHistoryData_publicTradesBuilder)?
              updates]) =>
      (new GGetPublicTradesHistoryData_publicTradesBuilder()..update(updates))
          ._build();

  _$GGetPublicTradesHistoryData_publicTrades._(
      {required this.G__typename, this.result})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetPublicTradesHistoryData_publicTrades', 'G__typename');
  }

  @override
  GGetPublicTradesHistoryData_publicTrades rebuild(
          void Function(GGetPublicTradesHistoryData_publicTradesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetPublicTradesHistoryData_publicTradesBuilder toBuilder() =>
      new GGetPublicTradesHistoryData_publicTradesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetPublicTradesHistoryData_publicTrades &&
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
    return (newBuiltValueToStringHelper(
            r'GGetPublicTradesHistoryData_publicTrades')
          ..add('G__typename', G__typename)
          ..add('result', result))
        .toString();
  }
}

class GGetPublicTradesHistoryData_publicTradesBuilder
    implements
        Builder<GGetPublicTradesHistoryData_publicTrades,
            GGetPublicTradesHistoryData_publicTradesBuilder> {
  _$GGetPublicTradesHistoryData_publicTrades? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetPublicTradesHistoryData_publicTrades_result?>? _result;
  ListBuilder<GGetPublicTradesHistoryData_publicTrades_result?> get result =>
      _$this._result ??=
          new ListBuilder<GGetPublicTradesHistoryData_publicTrades_result?>();
  set result(
          ListBuilder<GGetPublicTradesHistoryData_publicTrades_result?>?
              result) =>
      _$this._result = result;

  GGetPublicTradesHistoryData_publicTradesBuilder() {
    GGetPublicTradesHistoryData_publicTrades._initializeBuilder(this);
  }

  GGetPublicTradesHistoryData_publicTradesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _result = $v.result?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetPublicTradesHistoryData_publicTrades other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetPublicTradesHistoryData_publicTrades;
  }

  @override
  void update(
      void Function(GGetPublicTradesHistoryData_publicTradesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetPublicTradesHistoryData_publicTrades build() => _build();

  _$GGetPublicTradesHistoryData_publicTrades _build() {
    _$GGetPublicTradesHistoryData_publicTrades _$result;
    try {
      _$result = _$v ??
          new _$GGetPublicTradesHistoryData_publicTrades._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetPublicTradesHistoryData_publicTrades', 'G__typename'),
              result: _result?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'result';
        _result?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetPublicTradesHistoryData_publicTrades',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetPublicTradesHistoryData_publicTrades_result
    extends GGetPublicTradesHistoryData_publicTrades_result {
  @override
  final String G__typename;
  @override
  final double? price;
  @override
  final double? amount;
  @override
  final String? createdAt;
  @override
  final String? makerOrderSide;

  factory _$GGetPublicTradesHistoryData_publicTrades_result(
          [void Function(
                  GGetPublicTradesHistoryData_publicTrades_resultBuilder)?
              updates]) =>
      (new GGetPublicTradesHistoryData_publicTrades_resultBuilder()
            ..update(updates))
          ._build();

  _$GGetPublicTradesHistoryData_publicTrades_result._(
      {required this.G__typename,
      this.price,
      this.amount,
      this.createdAt,
      this.makerOrderSide})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetPublicTradesHistoryData_publicTrades_result', 'G__typename');
  }

  @override
  GGetPublicTradesHistoryData_publicTrades_result rebuild(
          void Function(GGetPublicTradesHistoryData_publicTrades_resultBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetPublicTradesHistoryData_publicTrades_resultBuilder toBuilder() =>
      new GGetPublicTradesHistoryData_publicTrades_resultBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetPublicTradesHistoryData_publicTrades_result &&
        G__typename == other.G__typename &&
        price == other.price &&
        amount == other.amount &&
        createdAt == other.createdAt &&
        makerOrderSide == other.makerOrderSide;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, makerOrderSide.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetPublicTradesHistoryData_publicTrades_result')
          ..add('G__typename', G__typename)
          ..add('price', price)
          ..add('amount', amount)
          ..add('createdAt', createdAt)
          ..add('makerOrderSide', makerOrderSide))
        .toString();
  }
}

class GGetPublicTradesHistoryData_publicTrades_resultBuilder
    implements
        Builder<GGetPublicTradesHistoryData_publicTrades_result,
            GGetPublicTradesHistoryData_publicTrades_resultBuilder> {
  _$GGetPublicTradesHistoryData_publicTrades_result? _$v;

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

  String? _makerOrderSide;
  String? get makerOrderSide => _$this._makerOrderSide;
  set makerOrderSide(String? makerOrderSide) =>
      _$this._makerOrderSide = makerOrderSide;

  GGetPublicTradesHistoryData_publicTrades_resultBuilder() {
    GGetPublicTradesHistoryData_publicTrades_result._initializeBuilder(this);
  }

  GGetPublicTradesHistoryData_publicTrades_resultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _price = $v.price;
      _amount = $v.amount;
      _createdAt = $v.createdAt;
      _makerOrderSide = $v.makerOrderSide;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetPublicTradesHistoryData_publicTrades_result other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetPublicTradesHistoryData_publicTrades_result;
  }

  @override
  void update(
      void Function(GGetPublicTradesHistoryData_publicTrades_resultBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetPublicTradesHistoryData_publicTrades_result build() => _build();

  _$GGetPublicTradesHistoryData_publicTrades_result _build() {
    final _$result = _$v ??
        new _$GGetPublicTradesHistoryData_publicTrades_result._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetPublicTradesHistoryData_publicTrades_result',
                'G__typename'),
            price: price,
            amount: amount,
            createdAt: createdAt,
            makerOrderSide: makerOrderSide);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

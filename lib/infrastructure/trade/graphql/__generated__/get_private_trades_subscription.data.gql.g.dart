// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_private_trades_subscription.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetPrivateTradesData> _$gGetPrivateTradesDataSerializer =
    new _$GGetPrivateTradesDataSerializer();
Serializer<GGetPrivateTradesData_privateTrades>
    _$gGetPrivateTradesDataPrivateTradesSerializer =
    new _$GGetPrivateTradesData_privateTradesSerializer();

class _$GGetPrivateTradesDataSerializer
    implements StructuredSerializer<GGetPrivateTradesData> {
  @override
  final Iterable<Type> types = const [
    GGetPrivateTradesData,
    _$GGetPrivateTradesData
  ];
  @override
  final String wireName = 'GGetPrivateTradesData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetPrivateTradesData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.privateTrades;
    if (value != null) {
      result
        ..add('privateTrades')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GGetPrivateTradesData_privateTrades)));
    }
    return result;
  }

  @override
  GGetPrivateTradesData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetPrivateTradesDataBuilder();

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
        case 'privateTrades':
          result.privateTrades.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetPrivateTradesData_privateTrades))!
              as GGetPrivateTradesData_privateTrades);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetPrivateTradesData_privateTradesSerializer
    implements StructuredSerializer<GGetPrivateTradesData_privateTrades> {
  @override
  final Iterable<Type> types = const [
    GGetPrivateTradesData_privateTrades,
    _$GGetPrivateTradesData_privateTrades
  ];
  @override
  final String wireName = 'GGetPrivateTradesData_privateTrades';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetPrivateTradesData_privateTrades object,
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
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.side;
    if (value != null) {
      result
        ..add('side')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.role;
    if (value != null) {
      result
        ..add('role')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetPrivateTradesData_privateTrades deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetPrivateTradesData_privateTradesBuilder();

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
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'side':
          result.side = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetPrivateTradesData extends GGetPrivateTradesData {
  @override
  final String G__typename;
  @override
  final GGetPrivateTradesData_privateTrades? privateTrades;

  factory _$GGetPrivateTradesData(
          [void Function(GGetPrivateTradesDataBuilder)? updates]) =>
      (new GGetPrivateTradesDataBuilder()..update(updates))._build();

  _$GGetPrivateTradesData._({required this.G__typename, this.privateTrades})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetPrivateTradesData', 'G__typename');
  }

  @override
  GGetPrivateTradesData rebuild(
          void Function(GGetPrivateTradesDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetPrivateTradesDataBuilder toBuilder() =>
      new GGetPrivateTradesDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetPrivateTradesData &&
        G__typename == other.G__typename &&
        privateTrades == other.privateTrades;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, privateTrades.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetPrivateTradesData')
          ..add('G__typename', G__typename)
          ..add('privateTrades', privateTrades))
        .toString();
  }
}

class GGetPrivateTradesDataBuilder
    implements Builder<GGetPrivateTradesData, GGetPrivateTradesDataBuilder> {
  _$GGetPrivateTradesData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetPrivateTradesData_privateTradesBuilder? _privateTrades;
  GGetPrivateTradesData_privateTradesBuilder get privateTrades =>
      _$this._privateTrades ??=
          new GGetPrivateTradesData_privateTradesBuilder();
  set privateTrades(
          GGetPrivateTradesData_privateTradesBuilder? privateTrades) =>
      _$this._privateTrades = privateTrades;

  GGetPrivateTradesDataBuilder() {
    GGetPrivateTradesData._initializeBuilder(this);
  }

  GGetPrivateTradesDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _privateTrades = $v.privateTrades?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetPrivateTradesData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetPrivateTradesData;
  }

  @override
  void update(void Function(GGetPrivateTradesDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetPrivateTradesData build() => _build();

  _$GGetPrivateTradesData _build() {
    _$GGetPrivateTradesData _$result;
    try {
      _$result = _$v ??
          new _$GGetPrivateTradesData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetPrivateTradesData', 'G__typename'),
              privateTrades: _privateTrades?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'privateTrades';
        _privateTrades?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetPrivateTradesData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetPrivateTradesData_privateTrades
    extends GGetPrivateTradesData_privateTrades {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final double? amount;
  @override
  final double? price;
  @override
  final String? side;
  @override
  final String? role;
  @override
  final String? createdAt;

  factory _$GGetPrivateTradesData_privateTrades(
          [void Function(GGetPrivateTradesData_privateTradesBuilder)?
              updates]) =>
      (new GGetPrivateTradesData_privateTradesBuilder()..update(updates))
          ._build();

  _$GGetPrivateTradesData_privateTrades._(
      {required this.G__typename,
      this.id,
      this.amount,
      this.price,
      this.side,
      this.role,
      this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetPrivateTradesData_privateTrades', 'G__typename');
  }

  @override
  GGetPrivateTradesData_privateTrades rebuild(
          void Function(GGetPrivateTradesData_privateTradesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetPrivateTradesData_privateTradesBuilder toBuilder() =>
      new GGetPrivateTradesData_privateTradesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetPrivateTradesData_privateTrades &&
        G__typename == other.G__typename &&
        id == other.id &&
        amount == other.amount &&
        price == other.price &&
        side == other.side &&
        role == other.role &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, side.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetPrivateTradesData_privateTrades')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('amount', amount)
          ..add('price', price)
          ..add('side', side)
          ..add('role', role)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GGetPrivateTradesData_privateTradesBuilder
    implements
        Builder<GGetPrivateTradesData_privateTrades,
            GGetPrivateTradesData_privateTradesBuilder> {
  _$GGetPrivateTradesData_privateTrades? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  String? _side;
  String? get side => _$this._side;
  set side(String? side) => _$this._side = side;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  GGetPrivateTradesData_privateTradesBuilder() {
    GGetPrivateTradesData_privateTrades._initializeBuilder(this);
  }

  GGetPrivateTradesData_privateTradesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _amount = $v.amount;
      _price = $v.price;
      _side = $v.side;
      _role = $v.role;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetPrivateTradesData_privateTrades other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetPrivateTradesData_privateTrades;
  }

  @override
  void update(
      void Function(GGetPrivateTradesData_privateTradesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetPrivateTradesData_privateTrades build() => _build();

  _$GGetPrivateTradesData_privateTrades _build() {
    final _$result = _$v ??
        new _$GGetPrivateTradesData_privateTrades._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetPrivateTradesData_privateTrades', 'G__typename'),
            id: id,
            amount: amount,
            price: price,
            side: side,
            role: role,
            createdAt: createdAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

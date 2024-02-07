// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_order.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetUserOrderData> _$gGetUserOrderDataSerializer =
    new _$GGetUserOrderDataSerializer();
Serializer<GGetUserOrderData_userOrder> _$gGetUserOrderDataUserOrderSerializer =
    new _$GGetUserOrderData_userOrderSerializer();

class _$GGetUserOrderDataSerializer
    implements StructuredSerializer<GGetUserOrderData> {
  @override
  final Iterable<Type> types = const [GGetUserOrderData, _$GGetUserOrderData];
  @override
  final String wireName = 'GGetUserOrderData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetUserOrderData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.userOrder;
    if (value != null) {
      result
        ..add('userOrder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GGetUserOrderData_userOrder)));
    }
    return result;
  }

  @override
  GGetUserOrderData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserOrderDataBuilder();

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
        case 'userOrder':
          result.userOrder.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GGetUserOrderData_userOrder))!
              as GGetUserOrderData_userOrder);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserOrderData_userOrderSerializer
    implements StructuredSerializer<GGetUserOrderData_userOrder> {
  @override
  final Iterable<Type> types = const [
    GGetUserOrderData_userOrder,
    _$GGetUserOrderData_userOrder
  ];
  @override
  final String wireName = 'GGetUserOrderData_userOrder';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserOrderData_userOrder object,
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
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetUserOrderData_userOrder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserOrderData_userOrderBuilder();

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
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserOrderData extends GGetUserOrderData {
  @override
  final String G__typename;
  @override
  final GGetUserOrderData_userOrder? userOrder;

  factory _$GGetUserOrderData(
          [void Function(GGetUserOrderDataBuilder)? updates]) =>
      (new GGetUserOrderDataBuilder()..update(updates))._build();

  _$GGetUserOrderData._({required this.G__typename, this.userOrder})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUserOrderData', 'G__typename');
  }

  @override
  GGetUserOrderData rebuild(void Function(GGetUserOrderDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserOrderDataBuilder toBuilder() =>
      new GGetUserOrderDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserOrderData &&
        G__typename == other.G__typename &&
        userOrder == other.userOrder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, userOrder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserOrderData')
          ..add('G__typename', G__typename)
          ..add('userOrder', userOrder))
        .toString();
  }
}

class GGetUserOrderDataBuilder
    implements Builder<GGetUserOrderData, GGetUserOrderDataBuilder> {
  _$GGetUserOrderData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetUserOrderData_userOrderBuilder? _userOrder;
  GGetUserOrderData_userOrderBuilder get userOrder =>
      _$this._userOrder ??= new GGetUserOrderData_userOrderBuilder();
  set userOrder(GGetUserOrderData_userOrderBuilder? userOrder) =>
      _$this._userOrder = userOrder;

  GGetUserOrderDataBuilder() {
    GGetUserOrderData._initializeBuilder(this);
  }

  GGetUserOrderDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userOrder = $v.userOrder?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserOrderData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserOrderData;
  }

  @override
  void update(void Function(GGetUserOrderDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserOrderData build() => _build();

  _$GGetUserOrderData _build() {
    _$GGetUserOrderData _$result;
    try {
      _$result = _$v ??
          new _$GGetUserOrderData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetUserOrderData', 'G__typename'),
              userOrder: _userOrder?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userOrder';
        _userOrder?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUserOrderData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserOrderData_userOrder extends GGetUserOrderData_userOrder {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? status;

  factory _$GGetUserOrderData_userOrder(
          [void Function(GGetUserOrderData_userOrderBuilder)? updates]) =>
      (new GGetUserOrderData_userOrderBuilder()..update(updates))._build();

  _$GGetUserOrderData_userOrder._(
      {required this.G__typename, this.id, this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUserOrderData_userOrder', 'G__typename');
  }

  @override
  GGetUserOrderData_userOrder rebuild(
          void Function(GGetUserOrderData_userOrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserOrderData_userOrderBuilder toBuilder() =>
      new GGetUserOrderData_userOrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserOrderData_userOrder &&
        G__typename == other.G__typename &&
        id == other.id &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserOrderData_userOrder')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('status', status))
        .toString();
  }
}

class GGetUserOrderData_userOrderBuilder
    implements
        Builder<GGetUserOrderData_userOrder,
            GGetUserOrderData_userOrderBuilder> {
  _$GGetUserOrderData_userOrder? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  GGetUserOrderData_userOrderBuilder() {
    GGetUserOrderData_userOrder._initializeBuilder(this);
  }

  GGetUserOrderData_userOrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserOrderData_userOrder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserOrderData_userOrder;
  }

  @override
  void update(void Function(GGetUserOrderData_userOrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserOrderData_userOrder build() => _build();

  _$GGetUserOrderData_userOrder _build() {
    final _$result = _$v ??
        new _$GGetUserOrderData_userOrder._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GGetUserOrderData_userOrder', 'G__typename'),
            id: id,
            status: status);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

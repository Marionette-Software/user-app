// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateOrderData> _$gCreateOrderDataSerializer =
    new _$GCreateOrderDataSerializer();
Serializer<GCreateOrderData_openOrder> _$gCreateOrderDataOpenOrderSerializer =
    new _$GCreateOrderData_openOrderSerializer();

class _$GCreateOrderDataSerializer
    implements StructuredSerializer<GCreateOrderData> {
  @override
  final Iterable<Type> types = const [GCreateOrderData, _$GCreateOrderData];
  @override
  final String wireName = 'GCreateOrderData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateOrderData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.openOrder;
    if (value != null) {
      result
        ..add('openOrder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GCreateOrderData_openOrder)));
    }
    return result;
  }

  @override
  GCreateOrderData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateOrderDataBuilder();

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
        case 'openOrder':
          result.openOrder.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GCreateOrderData_openOrder))!
              as GCreateOrderData_openOrder);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateOrderData_openOrderSerializer
    implements StructuredSerializer<GCreateOrderData_openOrder> {
  @override
  final Iterable<Type> types = const [
    GCreateOrderData_openOrder,
    _$GCreateOrderData_openOrder
  ];
  @override
  final String wireName = 'GCreateOrderData_openOrder';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateOrderData_openOrder object,
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
  GCreateOrderData_openOrder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateOrderData_openOrderBuilder();

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

class _$GCreateOrderData extends GCreateOrderData {
  @override
  final String G__typename;
  @override
  final GCreateOrderData_openOrder? openOrder;

  factory _$GCreateOrderData(
          [void Function(GCreateOrderDataBuilder)? updates]) =>
      (new GCreateOrderDataBuilder()..update(updates))._build();

  _$GCreateOrderData._({required this.G__typename, this.openOrder})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateOrderData', 'G__typename');
  }

  @override
  GCreateOrderData rebuild(void Function(GCreateOrderDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateOrderDataBuilder toBuilder() =>
      new GCreateOrderDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateOrderData &&
        G__typename == other.G__typename &&
        openOrder == other.openOrder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, openOrder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateOrderData')
          ..add('G__typename', G__typename)
          ..add('openOrder', openOrder))
        .toString();
  }
}

class GCreateOrderDataBuilder
    implements Builder<GCreateOrderData, GCreateOrderDataBuilder> {
  _$GCreateOrderData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateOrderData_openOrderBuilder? _openOrder;
  GCreateOrderData_openOrderBuilder get openOrder =>
      _$this._openOrder ??= new GCreateOrderData_openOrderBuilder();
  set openOrder(GCreateOrderData_openOrderBuilder? openOrder) =>
      _$this._openOrder = openOrder;

  GCreateOrderDataBuilder() {
    GCreateOrderData._initializeBuilder(this);
  }

  GCreateOrderDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _openOrder = $v.openOrder?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateOrderData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateOrderData;
  }

  @override
  void update(void Function(GCreateOrderDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateOrderData build() => _build();

  _$GCreateOrderData _build() {
    _$GCreateOrderData _$result;
    try {
      _$result = _$v ??
          new _$GCreateOrderData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateOrderData', 'G__typename'),
              openOrder: _openOrder?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'openOrder';
        _openOrder?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateOrderData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateOrderData_openOrder extends GCreateOrderData_openOrder {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? status;

  factory _$GCreateOrderData_openOrder(
          [void Function(GCreateOrderData_openOrderBuilder)? updates]) =>
      (new GCreateOrderData_openOrderBuilder()..update(updates))._build();

  _$GCreateOrderData_openOrder._(
      {required this.G__typename, this.id, this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateOrderData_openOrder', 'G__typename');
  }

  @override
  GCreateOrderData_openOrder rebuild(
          void Function(GCreateOrderData_openOrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateOrderData_openOrderBuilder toBuilder() =>
      new GCreateOrderData_openOrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateOrderData_openOrder &&
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
    return (newBuiltValueToStringHelper(r'GCreateOrderData_openOrder')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('status', status))
        .toString();
  }
}

class GCreateOrderData_openOrderBuilder
    implements
        Builder<GCreateOrderData_openOrder, GCreateOrderData_openOrderBuilder> {
  _$GCreateOrderData_openOrder? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  GCreateOrderData_openOrderBuilder() {
    GCreateOrderData_openOrder._initializeBuilder(this);
  }

  GCreateOrderData_openOrderBuilder get _$this {
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
  void replace(GCreateOrderData_openOrder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateOrderData_openOrder;
  }

  @override
  void update(void Function(GCreateOrderData_openOrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateOrderData_openOrder build() => _build();

  _$GCreateOrderData_openOrder _build() {
    final _$result = _$v ??
        new _$GCreateOrderData_openOrder._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GCreateOrderData_openOrder', 'G__typename'),
            id: id,
            status: status);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

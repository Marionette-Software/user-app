// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_all_orders.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCancelAllOrdersData> _$gCancelAllOrdersDataSerializer =
    new _$GCancelAllOrdersDataSerializer();

class _$GCancelAllOrdersDataSerializer
    implements StructuredSerializer<GCancelAllOrdersData> {
  @override
  final Iterable<Type> types = const [
    GCancelAllOrdersData,
    _$GCancelAllOrdersData
  ];
  @override
  final String wireName = 'GCancelAllOrdersData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCancelAllOrdersData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.cancelAllOrders;
    if (value != null) {
      result
        ..add('cancelAllOrders')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GCancelAllOrdersData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCancelAllOrdersDataBuilder();

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
        case 'cancelAllOrders':
          result.cancelAllOrders = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCancelAllOrdersData extends GCancelAllOrdersData {
  @override
  final String G__typename;
  @override
  final String? cancelAllOrders;

  factory _$GCancelAllOrdersData(
          [void Function(GCancelAllOrdersDataBuilder)? updates]) =>
      (new GCancelAllOrdersDataBuilder()..update(updates))._build();

  _$GCancelAllOrdersData._({required this.G__typename, this.cancelAllOrders})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCancelAllOrdersData', 'G__typename');
  }

  @override
  GCancelAllOrdersData rebuild(
          void Function(GCancelAllOrdersDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCancelAllOrdersDataBuilder toBuilder() =>
      new GCancelAllOrdersDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCancelAllOrdersData &&
        G__typename == other.G__typename &&
        cancelAllOrders == other.cancelAllOrders;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, cancelAllOrders.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCancelAllOrdersData')
          ..add('G__typename', G__typename)
          ..add('cancelAllOrders', cancelAllOrders))
        .toString();
  }
}

class GCancelAllOrdersDataBuilder
    implements Builder<GCancelAllOrdersData, GCancelAllOrdersDataBuilder> {
  _$GCancelAllOrdersData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _cancelAllOrders;
  String? get cancelAllOrders => _$this._cancelAllOrders;
  set cancelAllOrders(String? cancelAllOrders) =>
      _$this._cancelAllOrders = cancelAllOrders;

  GCancelAllOrdersDataBuilder() {
    GCancelAllOrdersData._initializeBuilder(this);
  }

  GCancelAllOrdersDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _cancelAllOrders = $v.cancelAllOrders;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCancelAllOrdersData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCancelAllOrdersData;
  }

  @override
  void update(void Function(GCancelAllOrdersDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCancelAllOrdersData build() => _build();

  _$GCancelAllOrdersData _build() {
    final _$result = _$v ??
        new _$GCancelAllOrdersData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GCancelAllOrdersData', 'G__typename'),
            cancelAllOrders: cancelAllOrders);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

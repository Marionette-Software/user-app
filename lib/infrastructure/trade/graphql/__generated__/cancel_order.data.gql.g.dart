// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_order.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCancelOrderActionData> _$gCancelOrderActionDataSerializer =
    new _$GCancelOrderActionDataSerializer();

class _$GCancelOrderActionDataSerializer
    implements StructuredSerializer<GCancelOrderActionData> {
  @override
  final Iterable<Type> types = const [
    GCancelOrderActionData,
    _$GCancelOrderActionData
  ];
  @override
  final String wireName = 'GCancelOrderActionData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCancelOrderActionData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.cancelOrder;
    if (value != null) {
      result
        ..add('cancelOrder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GCancelOrderActionData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCancelOrderActionDataBuilder();

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
        case 'cancelOrder':
          result.cancelOrder = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCancelOrderActionData extends GCancelOrderActionData {
  @override
  final String G__typename;
  @override
  final String? cancelOrder;

  factory _$GCancelOrderActionData(
          [void Function(GCancelOrderActionDataBuilder)? updates]) =>
      (new GCancelOrderActionDataBuilder()..update(updates))._build();

  _$GCancelOrderActionData._({required this.G__typename, this.cancelOrder})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCancelOrderActionData', 'G__typename');
  }

  @override
  GCancelOrderActionData rebuild(
          void Function(GCancelOrderActionDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCancelOrderActionDataBuilder toBuilder() =>
      new GCancelOrderActionDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCancelOrderActionData &&
        G__typename == other.G__typename &&
        cancelOrder == other.cancelOrder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, cancelOrder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCancelOrderActionData')
          ..add('G__typename', G__typename)
          ..add('cancelOrder', cancelOrder))
        .toString();
  }
}

class GCancelOrderActionDataBuilder
    implements Builder<GCancelOrderActionData, GCancelOrderActionDataBuilder> {
  _$GCancelOrderActionData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _cancelOrder;
  String? get cancelOrder => _$this._cancelOrder;
  set cancelOrder(String? cancelOrder) => _$this._cancelOrder = cancelOrder;

  GCancelOrderActionDataBuilder() {
    GCancelOrderActionData._initializeBuilder(this);
  }

  GCancelOrderActionDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _cancelOrder = $v.cancelOrder;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCancelOrderActionData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCancelOrderActionData;
  }

  @override
  void update(void Function(GCancelOrderActionDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCancelOrderActionData build() => _build();

  _$GCancelOrderActionData _build() {
    final _$result = _$v ??
        new _$GCancelOrderActionData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GCancelOrderActionData', 'G__typename'),
            cancelOrder: cancelOrder);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

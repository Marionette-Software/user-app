// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_stake.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCancelCurrencyStateData> _$gCancelCurrencyStateDataSerializer =
    new _$GCancelCurrencyStateDataSerializer();

class _$GCancelCurrencyStateDataSerializer
    implements StructuredSerializer<GCancelCurrencyStateData> {
  @override
  final Iterable<Type> types = const [
    GCancelCurrencyStateData,
    _$GCancelCurrencyStateData
  ];
  @override
  final String wireName = 'GCancelCurrencyStateData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCancelCurrencyStateData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.cancelStake;
    if (value != null) {
      result
        ..add('cancelStake')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GCancelCurrencyStateData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCancelCurrencyStateDataBuilder();

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
        case 'cancelStake':
          result.cancelStake = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCancelCurrencyStateData extends GCancelCurrencyStateData {
  @override
  final String G__typename;
  @override
  final String? cancelStake;

  factory _$GCancelCurrencyStateData(
          [void Function(GCancelCurrencyStateDataBuilder)? updates]) =>
      (new GCancelCurrencyStateDataBuilder()..update(updates))._build();

  _$GCancelCurrencyStateData._({required this.G__typename, this.cancelStake})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCancelCurrencyStateData', 'G__typename');
  }

  @override
  GCancelCurrencyStateData rebuild(
          void Function(GCancelCurrencyStateDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCancelCurrencyStateDataBuilder toBuilder() =>
      new GCancelCurrencyStateDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCancelCurrencyStateData &&
        G__typename == other.G__typename &&
        cancelStake == other.cancelStake;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, cancelStake.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCancelCurrencyStateData')
          ..add('G__typename', G__typename)
          ..add('cancelStake', cancelStake))
        .toString();
  }
}

class GCancelCurrencyStateDataBuilder
    implements
        Builder<GCancelCurrencyStateData, GCancelCurrencyStateDataBuilder> {
  _$GCancelCurrencyStateData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _cancelStake;
  String? get cancelStake => _$this._cancelStake;
  set cancelStake(String? cancelStake) => _$this._cancelStake = cancelStake;

  GCancelCurrencyStateDataBuilder() {
    GCancelCurrencyStateData._initializeBuilder(this);
  }

  GCancelCurrencyStateDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _cancelStake = $v.cancelStake;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCancelCurrencyStateData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCancelCurrencyStateData;
  }

  @override
  void update(void Function(GCancelCurrencyStateDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCancelCurrencyStateData build() => _build();

  _$GCancelCurrencyStateData _build() {
    final _$result = _$v ??
        new _$GCancelCurrencyStateData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GCancelCurrencyStateData', 'G__typename'),
            cancelStake: cancelStake);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

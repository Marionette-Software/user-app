// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_favorite_market.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GsetFavoriteMarketData> _$gsetFavoriteMarketDataSerializer =
    new _$GsetFavoriteMarketDataSerializer();

class _$GsetFavoriteMarketDataSerializer
    implements StructuredSerializer<GsetFavoriteMarketData> {
  @override
  final Iterable<Type> types = const [
    GsetFavoriteMarketData,
    _$GsetFavoriteMarketData
  ];
  @override
  final String wireName = 'GsetFavoriteMarketData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GsetFavoriteMarketData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.setFavoriteMarket;
    if (value != null) {
      result
        ..add('setFavoriteMarket')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GsetFavoriteMarketData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GsetFavoriteMarketDataBuilder();

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
        case 'setFavoriteMarket':
          result.setFavoriteMarket = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GsetFavoriteMarketData extends GsetFavoriteMarketData {
  @override
  final String G__typename;
  @override
  final bool? setFavoriteMarket;

  factory _$GsetFavoriteMarketData(
          [void Function(GsetFavoriteMarketDataBuilder)? updates]) =>
      (new GsetFavoriteMarketDataBuilder()..update(updates))._build();

  _$GsetFavoriteMarketData._(
      {required this.G__typename, this.setFavoriteMarket})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GsetFavoriteMarketData', 'G__typename');
  }

  @override
  GsetFavoriteMarketData rebuild(
          void Function(GsetFavoriteMarketDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GsetFavoriteMarketDataBuilder toBuilder() =>
      new GsetFavoriteMarketDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GsetFavoriteMarketData &&
        G__typename == other.G__typename &&
        setFavoriteMarket == other.setFavoriteMarket;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, setFavoriteMarket.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GsetFavoriteMarketData')
          ..add('G__typename', G__typename)
          ..add('setFavoriteMarket', setFavoriteMarket))
        .toString();
  }
}

class GsetFavoriteMarketDataBuilder
    implements Builder<GsetFavoriteMarketData, GsetFavoriteMarketDataBuilder> {
  _$GsetFavoriteMarketData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _setFavoriteMarket;
  bool? get setFavoriteMarket => _$this._setFavoriteMarket;
  set setFavoriteMarket(bool? setFavoriteMarket) =>
      _$this._setFavoriteMarket = setFavoriteMarket;

  GsetFavoriteMarketDataBuilder() {
    GsetFavoriteMarketData._initializeBuilder(this);
  }

  GsetFavoriteMarketDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _setFavoriteMarket = $v.setFavoriteMarket;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GsetFavoriteMarketData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GsetFavoriteMarketData;
  }

  @override
  void update(void Function(GsetFavoriteMarketDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GsetFavoriteMarketData build() => _build();

  _$GsetFavoriteMarketData _build() {
    final _$result = _$v ??
        new _$GsetFavoriteMarketData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GsetFavoriteMarketData', 'G__typename'),
            setFavoriteMarket: setFavoriteMarket);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

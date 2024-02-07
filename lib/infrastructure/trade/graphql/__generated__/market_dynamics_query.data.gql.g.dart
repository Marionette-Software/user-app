// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_dynamics_query.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetMarketDynamicsData> _$gGetMarketDynamicsDataSerializer =
    new _$GGetMarketDynamicsDataSerializer();
Serializer<GGetMarketDynamicsData_marketDynamics>
    _$gGetMarketDynamicsDataMarketDynamicsSerializer =
    new _$GGetMarketDynamicsData_marketDynamicsSerializer();

class _$GGetMarketDynamicsDataSerializer
    implements StructuredSerializer<GGetMarketDynamicsData> {
  @override
  final Iterable<Type> types = const [
    GGetMarketDynamicsData,
    _$GGetMarketDynamicsData
  ];
  @override
  final String wireName = 'GGetMarketDynamicsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetMarketDynamicsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.marketDynamics;
    if (value != null) {
      result
        ..add('marketDynamics')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GGetMarketDynamicsData_marketDynamics)));
    }
    return result;
  }

  @override
  GGetMarketDynamicsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetMarketDynamicsDataBuilder();

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
        case 'marketDynamics':
          result.marketDynamics.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetMarketDynamicsData_marketDynamics))!
              as GGetMarketDynamicsData_marketDynamics);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetMarketDynamicsData_marketDynamicsSerializer
    implements StructuredSerializer<GGetMarketDynamicsData_marketDynamics> {
  @override
  final Iterable<Type> types = const [
    GGetMarketDynamicsData_marketDynamics,
    _$GGetMarketDynamicsData_marketDynamics
  ];
  @override
  final String wireName = 'GGetMarketDynamicsData_marketDynamics';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetMarketDynamicsData_marketDynamics object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.startPrice;
    if (value != null) {
      result
        ..add('startPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.lastPrice;
    if (value != null) {
      result
        ..add('lastPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.amount24h;
    if (value != null) {
      result
        ..add('amount24h')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.lowPrice;
    if (value != null) {
      result
        ..add('lowPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.highPrice;
    if (value != null) {
      result
        ..add('highPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GGetMarketDynamicsData_marketDynamics deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetMarketDynamicsData_marketDynamicsBuilder();

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
        case 'startPrice':
          result.startPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'lastPrice':
          result.lastPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'amount24h':
          result.amount24h = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'lowPrice':
          result.lowPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'highPrice':
          result.highPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetMarketDynamicsData extends GGetMarketDynamicsData {
  @override
  final String G__typename;
  @override
  final GGetMarketDynamicsData_marketDynamics? marketDynamics;

  factory _$GGetMarketDynamicsData(
          [void Function(GGetMarketDynamicsDataBuilder)? updates]) =>
      (new GGetMarketDynamicsDataBuilder()..update(updates))._build();

  _$GGetMarketDynamicsData._({required this.G__typename, this.marketDynamics})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetMarketDynamicsData', 'G__typename');
  }

  @override
  GGetMarketDynamicsData rebuild(
          void Function(GGetMarketDynamicsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetMarketDynamicsDataBuilder toBuilder() =>
      new GGetMarketDynamicsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetMarketDynamicsData &&
        G__typename == other.G__typename &&
        marketDynamics == other.marketDynamics;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, marketDynamics.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetMarketDynamicsData')
          ..add('G__typename', G__typename)
          ..add('marketDynamics', marketDynamics))
        .toString();
  }
}

class GGetMarketDynamicsDataBuilder
    implements Builder<GGetMarketDynamicsData, GGetMarketDynamicsDataBuilder> {
  _$GGetMarketDynamicsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetMarketDynamicsData_marketDynamicsBuilder? _marketDynamics;
  GGetMarketDynamicsData_marketDynamicsBuilder get marketDynamics =>
      _$this._marketDynamics ??=
          new GGetMarketDynamicsData_marketDynamicsBuilder();
  set marketDynamics(
          GGetMarketDynamicsData_marketDynamicsBuilder? marketDynamics) =>
      _$this._marketDynamics = marketDynamics;

  GGetMarketDynamicsDataBuilder() {
    GGetMarketDynamicsData._initializeBuilder(this);
  }

  GGetMarketDynamicsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _marketDynamics = $v.marketDynamics?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetMarketDynamicsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetMarketDynamicsData;
  }

  @override
  void update(void Function(GGetMarketDynamicsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetMarketDynamicsData build() => _build();

  _$GGetMarketDynamicsData _build() {
    _$GGetMarketDynamicsData _$result;
    try {
      _$result = _$v ??
          new _$GGetMarketDynamicsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetMarketDynamicsData', 'G__typename'),
              marketDynamics: _marketDynamics?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'marketDynamics';
        _marketDynamics?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetMarketDynamicsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetMarketDynamicsData_marketDynamics
    extends GGetMarketDynamicsData_marketDynamics {
  @override
  final String G__typename;
  @override
  final double? startPrice;
  @override
  final double? lastPrice;
  @override
  final double? amount24h;
  @override
  final double? lowPrice;
  @override
  final double? highPrice;

  factory _$GGetMarketDynamicsData_marketDynamics(
          [void Function(GGetMarketDynamicsData_marketDynamicsBuilder)?
              updates]) =>
      (new GGetMarketDynamicsData_marketDynamicsBuilder()..update(updates))
          ._build();

  _$GGetMarketDynamicsData_marketDynamics._(
      {required this.G__typename,
      this.startPrice,
      this.lastPrice,
      this.amount24h,
      this.lowPrice,
      this.highPrice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetMarketDynamicsData_marketDynamics', 'G__typename');
  }

  @override
  GGetMarketDynamicsData_marketDynamics rebuild(
          void Function(GGetMarketDynamicsData_marketDynamicsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetMarketDynamicsData_marketDynamicsBuilder toBuilder() =>
      new GGetMarketDynamicsData_marketDynamicsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetMarketDynamicsData_marketDynamics &&
        G__typename == other.G__typename &&
        startPrice == other.startPrice &&
        lastPrice == other.lastPrice &&
        amount24h == other.amount24h &&
        lowPrice == other.lowPrice &&
        highPrice == other.highPrice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, startPrice.hashCode);
    _$hash = $jc(_$hash, lastPrice.hashCode);
    _$hash = $jc(_$hash, amount24h.hashCode);
    _$hash = $jc(_$hash, lowPrice.hashCode);
    _$hash = $jc(_$hash, highPrice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetMarketDynamicsData_marketDynamics')
          ..add('G__typename', G__typename)
          ..add('startPrice', startPrice)
          ..add('lastPrice', lastPrice)
          ..add('amount24h', amount24h)
          ..add('lowPrice', lowPrice)
          ..add('highPrice', highPrice))
        .toString();
  }
}

class GGetMarketDynamicsData_marketDynamicsBuilder
    implements
        Builder<GGetMarketDynamicsData_marketDynamics,
            GGetMarketDynamicsData_marketDynamicsBuilder> {
  _$GGetMarketDynamicsData_marketDynamics? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  double? _startPrice;
  double? get startPrice => _$this._startPrice;
  set startPrice(double? startPrice) => _$this._startPrice = startPrice;

  double? _lastPrice;
  double? get lastPrice => _$this._lastPrice;
  set lastPrice(double? lastPrice) => _$this._lastPrice = lastPrice;

  double? _amount24h;
  double? get amount24h => _$this._amount24h;
  set amount24h(double? amount24h) => _$this._amount24h = amount24h;

  double? _lowPrice;
  double? get lowPrice => _$this._lowPrice;
  set lowPrice(double? lowPrice) => _$this._lowPrice = lowPrice;

  double? _highPrice;
  double? get highPrice => _$this._highPrice;
  set highPrice(double? highPrice) => _$this._highPrice = highPrice;

  GGetMarketDynamicsData_marketDynamicsBuilder() {
    GGetMarketDynamicsData_marketDynamics._initializeBuilder(this);
  }

  GGetMarketDynamicsData_marketDynamicsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _startPrice = $v.startPrice;
      _lastPrice = $v.lastPrice;
      _amount24h = $v.amount24h;
      _lowPrice = $v.lowPrice;
      _highPrice = $v.highPrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetMarketDynamicsData_marketDynamics other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetMarketDynamicsData_marketDynamics;
  }

  @override
  void update(
      void Function(GGetMarketDynamicsData_marketDynamicsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetMarketDynamicsData_marketDynamics build() => _build();

  _$GGetMarketDynamicsData_marketDynamics _build() {
    final _$result = _$v ??
        new _$GGetMarketDynamicsData_marketDynamics._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetMarketDynamicsData_marketDynamics', 'G__typename'),
            startPrice: startPrice,
            lastPrice: lastPrice,
            amount24h: amount24h,
            lowPrice: lowPrice,
            highPrice: highPrice);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

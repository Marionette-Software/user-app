// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_dynamics_subscription.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GMarketDynamicsData> _$gMarketDynamicsDataSerializer =
    new _$GMarketDynamicsDataSerializer();
Serializer<GMarketDynamicsData_marketDynamics>
    _$gMarketDynamicsDataMarketDynamicsSerializer =
    new _$GMarketDynamicsData_marketDynamicsSerializer();

class _$GMarketDynamicsDataSerializer
    implements StructuredSerializer<GMarketDynamicsData> {
  @override
  final Iterable<Type> types = const [
    GMarketDynamicsData,
    _$GMarketDynamicsData
  ];
  @override
  final String wireName = 'GMarketDynamicsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GMarketDynamicsData object,
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
            specifiedType: const FullType(GMarketDynamicsData_marketDynamics)));
    }
    return result;
  }

  @override
  GMarketDynamicsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMarketDynamicsDataBuilder();

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
                      const FullType(GMarketDynamicsData_marketDynamics))!
              as GMarketDynamicsData_marketDynamics);
          break;
      }
    }

    return result.build();
  }
}

class _$GMarketDynamicsData_marketDynamicsSerializer
    implements StructuredSerializer<GMarketDynamicsData_marketDynamics> {
  @override
  final Iterable<Type> types = const [
    GMarketDynamicsData_marketDynamics,
    _$GMarketDynamicsData_marketDynamics
  ];
  @override
  final String wireName = 'GMarketDynamicsData_marketDynamics';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GMarketDynamicsData_marketDynamics object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.marketId;
    if (value != null) {
      result
        ..add('marketId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
  GMarketDynamicsData_marketDynamics deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMarketDynamicsData_marketDynamicsBuilder();

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
        case 'marketId':
          result.marketId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$GMarketDynamicsData extends GMarketDynamicsData {
  @override
  final String G__typename;
  @override
  final GMarketDynamicsData_marketDynamics? marketDynamics;

  factory _$GMarketDynamicsData(
          [void Function(GMarketDynamicsDataBuilder)? updates]) =>
      (new GMarketDynamicsDataBuilder()..update(updates))._build();

  _$GMarketDynamicsData._({required this.G__typename, this.marketDynamics})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GMarketDynamicsData', 'G__typename');
  }

  @override
  GMarketDynamicsData rebuild(
          void Function(GMarketDynamicsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMarketDynamicsDataBuilder toBuilder() =>
      new GMarketDynamicsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMarketDynamicsData &&
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
    return (newBuiltValueToStringHelper(r'GMarketDynamicsData')
          ..add('G__typename', G__typename)
          ..add('marketDynamics', marketDynamics))
        .toString();
  }
}

class GMarketDynamicsDataBuilder
    implements Builder<GMarketDynamicsData, GMarketDynamicsDataBuilder> {
  _$GMarketDynamicsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GMarketDynamicsData_marketDynamicsBuilder? _marketDynamics;
  GMarketDynamicsData_marketDynamicsBuilder get marketDynamics =>
      _$this._marketDynamics ??=
          new GMarketDynamicsData_marketDynamicsBuilder();
  set marketDynamics(
          GMarketDynamicsData_marketDynamicsBuilder? marketDynamics) =>
      _$this._marketDynamics = marketDynamics;

  GMarketDynamicsDataBuilder() {
    GMarketDynamicsData._initializeBuilder(this);
  }

  GMarketDynamicsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _marketDynamics = $v.marketDynamics?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMarketDynamicsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMarketDynamicsData;
  }

  @override
  void update(void Function(GMarketDynamicsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMarketDynamicsData build() => _build();

  _$GMarketDynamicsData _build() {
    _$GMarketDynamicsData _$result;
    try {
      _$result = _$v ??
          new _$GMarketDynamicsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GMarketDynamicsData', 'G__typename'),
              marketDynamics: _marketDynamics?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'marketDynamics';
        _marketDynamics?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GMarketDynamicsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GMarketDynamicsData_marketDynamics
    extends GMarketDynamicsData_marketDynamics {
  @override
  final String G__typename;
  @override
  final String? marketId;
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

  factory _$GMarketDynamicsData_marketDynamics(
          [void Function(GMarketDynamicsData_marketDynamicsBuilder)?
              updates]) =>
      (new GMarketDynamicsData_marketDynamicsBuilder()..update(updates))
          ._build();

  _$GMarketDynamicsData_marketDynamics._(
      {required this.G__typename,
      this.marketId,
      this.startPrice,
      this.lastPrice,
      this.amount24h,
      this.lowPrice,
      this.highPrice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GMarketDynamicsData_marketDynamics', 'G__typename');
  }

  @override
  GMarketDynamicsData_marketDynamics rebuild(
          void Function(GMarketDynamicsData_marketDynamicsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMarketDynamicsData_marketDynamicsBuilder toBuilder() =>
      new GMarketDynamicsData_marketDynamicsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMarketDynamicsData_marketDynamics &&
        G__typename == other.G__typename &&
        marketId == other.marketId &&
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
    _$hash = $jc(_$hash, marketId.hashCode);
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
    return (newBuiltValueToStringHelper(r'GMarketDynamicsData_marketDynamics')
          ..add('G__typename', G__typename)
          ..add('marketId', marketId)
          ..add('startPrice', startPrice)
          ..add('lastPrice', lastPrice)
          ..add('amount24h', amount24h)
          ..add('lowPrice', lowPrice)
          ..add('highPrice', highPrice))
        .toString();
  }
}

class GMarketDynamicsData_marketDynamicsBuilder
    implements
        Builder<GMarketDynamicsData_marketDynamics,
            GMarketDynamicsData_marketDynamicsBuilder> {
  _$GMarketDynamicsData_marketDynamics? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _marketId;
  String? get marketId => _$this._marketId;
  set marketId(String? marketId) => _$this._marketId = marketId;

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

  GMarketDynamicsData_marketDynamicsBuilder() {
    GMarketDynamicsData_marketDynamics._initializeBuilder(this);
  }

  GMarketDynamicsData_marketDynamicsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _marketId = $v.marketId;
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
  void replace(GMarketDynamicsData_marketDynamics other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMarketDynamicsData_marketDynamics;
  }

  @override
  void update(
      void Function(GMarketDynamicsData_marketDynamicsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMarketDynamicsData_marketDynamics build() => _build();

  _$GMarketDynamicsData_marketDynamics _build() {
    final _$result = _$v ??
        new _$GMarketDynamicsData_marketDynamics._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GMarketDynamicsData_marketDynamics', 'G__typename'),
            marketId: marketId,
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

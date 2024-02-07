// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_market_rate.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetMarketRateData> _$gGetMarketRateDataSerializer =
    new _$GGetMarketRateDataSerializer();
Serializer<GGetMarketRateData_marketRate>
    _$gGetMarketRateDataMarketRateSerializer =
    new _$GGetMarketRateData_marketRateSerializer();

class _$GGetMarketRateDataSerializer
    implements StructuredSerializer<GGetMarketRateData> {
  @override
  final Iterable<Type> types = const [GGetMarketRateData, _$GGetMarketRateData];
  @override
  final String wireName = 'GGetMarketRateData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetMarketRateData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.marketRate;
    if (value != null) {
      result
        ..add('marketRate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GGetMarketRateData_marketRate)));
    }
    return result;
  }

  @override
  GGetMarketRateData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetMarketRateDataBuilder();

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
        case 'marketRate':
          result.marketRate.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GGetMarketRateData_marketRate))!
              as GGetMarketRateData_marketRate);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetMarketRateData_marketRateSerializer
    implements StructuredSerializer<GGetMarketRateData_marketRate> {
  @override
  final Iterable<Type> types = const [
    GGetMarketRateData_marketRate,
    _$GGetMarketRateData_marketRate
  ];
  @override
  final String wireName = 'GGetMarketRateData_marketRate';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetMarketRateData_marketRate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.market;
    if (value != null) {
      result
        ..add('market')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rate;
    if (value != null) {
      result
        ..add('rate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.ts;
    if (value != null) {
      result
        ..add('ts')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetMarketRateData_marketRate deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetMarketRateData_marketRateBuilder();

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
        case 'market':
          result.market = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'ts':
          result.ts = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetMarketRateData extends GGetMarketRateData {
  @override
  final String G__typename;
  @override
  final GGetMarketRateData_marketRate? marketRate;

  factory _$GGetMarketRateData(
          [void Function(GGetMarketRateDataBuilder)? updates]) =>
      (new GGetMarketRateDataBuilder()..update(updates))._build();

  _$GGetMarketRateData._({required this.G__typename, this.marketRate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetMarketRateData', 'G__typename');
  }

  @override
  GGetMarketRateData rebuild(
          void Function(GGetMarketRateDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetMarketRateDataBuilder toBuilder() =>
      new GGetMarketRateDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetMarketRateData &&
        G__typename == other.G__typename &&
        marketRate == other.marketRate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, marketRate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetMarketRateData')
          ..add('G__typename', G__typename)
          ..add('marketRate', marketRate))
        .toString();
  }
}

class GGetMarketRateDataBuilder
    implements Builder<GGetMarketRateData, GGetMarketRateDataBuilder> {
  _$GGetMarketRateData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetMarketRateData_marketRateBuilder? _marketRate;
  GGetMarketRateData_marketRateBuilder get marketRate =>
      _$this._marketRate ??= new GGetMarketRateData_marketRateBuilder();
  set marketRate(GGetMarketRateData_marketRateBuilder? marketRate) =>
      _$this._marketRate = marketRate;

  GGetMarketRateDataBuilder() {
    GGetMarketRateData._initializeBuilder(this);
  }

  GGetMarketRateDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _marketRate = $v.marketRate?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetMarketRateData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetMarketRateData;
  }

  @override
  void update(void Function(GGetMarketRateDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetMarketRateData build() => _build();

  _$GGetMarketRateData _build() {
    _$GGetMarketRateData _$result;
    try {
      _$result = _$v ??
          new _$GGetMarketRateData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetMarketRateData', 'G__typename'),
              marketRate: _marketRate?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'marketRate';
        _marketRate?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetMarketRateData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetMarketRateData_marketRate extends GGetMarketRateData_marketRate {
  @override
  final String G__typename;
  @override
  final String? market;
  @override
  final double? rate;
  @override
  final String? ts;

  factory _$GGetMarketRateData_marketRate(
          [void Function(GGetMarketRateData_marketRateBuilder)? updates]) =>
      (new GGetMarketRateData_marketRateBuilder()..update(updates))._build();

  _$GGetMarketRateData_marketRate._(
      {required this.G__typename, this.market, this.rate, this.ts})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetMarketRateData_marketRate', 'G__typename');
  }

  @override
  GGetMarketRateData_marketRate rebuild(
          void Function(GGetMarketRateData_marketRateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetMarketRateData_marketRateBuilder toBuilder() =>
      new GGetMarketRateData_marketRateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetMarketRateData_marketRate &&
        G__typename == other.G__typename &&
        market == other.market &&
        rate == other.rate &&
        ts == other.ts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, market.hashCode);
    _$hash = $jc(_$hash, rate.hashCode);
    _$hash = $jc(_$hash, ts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetMarketRateData_marketRate')
          ..add('G__typename', G__typename)
          ..add('market', market)
          ..add('rate', rate)
          ..add('ts', ts))
        .toString();
  }
}

class GGetMarketRateData_marketRateBuilder
    implements
        Builder<GGetMarketRateData_marketRate,
            GGetMarketRateData_marketRateBuilder> {
  _$GGetMarketRateData_marketRate? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  double? _rate;
  double? get rate => _$this._rate;
  set rate(double? rate) => _$this._rate = rate;

  String? _ts;
  String? get ts => _$this._ts;
  set ts(String? ts) => _$this._ts = ts;

  GGetMarketRateData_marketRateBuilder() {
    GGetMarketRateData_marketRate._initializeBuilder(this);
  }

  GGetMarketRateData_marketRateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _market = $v.market;
      _rate = $v.rate;
      _ts = $v.ts;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetMarketRateData_marketRate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetMarketRateData_marketRate;
  }

  @override
  void update(void Function(GGetMarketRateData_marketRateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetMarketRateData_marketRate build() => _build();

  _$GGetMarketRateData_marketRate _build() {
    final _$result = _$v ??
        new _$GGetMarketRateData_marketRate._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GGetMarketRateData_marketRate', 'G__typename'),
            market: market,
            rate: rate,
            ts: ts);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

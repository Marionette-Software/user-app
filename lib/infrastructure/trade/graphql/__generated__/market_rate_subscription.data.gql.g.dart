// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_rate_subscription.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GMarketRateData> _$gMarketRateDataSerializer =
    new _$GMarketRateDataSerializer();
Serializer<GMarketRateData_marketRate> _$gMarketRateDataMarketRateSerializer =
    new _$GMarketRateData_marketRateSerializer();

class _$GMarketRateDataSerializer
    implements StructuredSerializer<GMarketRateData> {
  @override
  final Iterable<Type> types = const [GMarketRateData, _$GMarketRateData];
  @override
  final String wireName = 'GMarketRateData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GMarketRateData object,
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
            specifiedType: const FullType(GMarketRateData_marketRate)));
    }
    return result;
  }

  @override
  GMarketRateData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMarketRateDataBuilder();

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
                  specifiedType: const FullType(GMarketRateData_marketRate))!
              as GMarketRateData_marketRate);
          break;
      }
    }

    return result.build();
  }
}

class _$GMarketRateData_marketRateSerializer
    implements StructuredSerializer<GMarketRateData_marketRate> {
  @override
  final Iterable<Type> types = const [
    GMarketRateData_marketRate,
    _$GMarketRateData_marketRate
  ];
  @override
  final String wireName = 'GMarketRateData_marketRate';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GMarketRateData_marketRate object,
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
  GMarketRateData_marketRate deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMarketRateData_marketRateBuilder();

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

class _$GMarketRateData extends GMarketRateData {
  @override
  final String G__typename;
  @override
  final GMarketRateData_marketRate? marketRate;

  factory _$GMarketRateData([void Function(GMarketRateDataBuilder)? updates]) =>
      (new GMarketRateDataBuilder()..update(updates))._build();

  _$GMarketRateData._({required this.G__typename, this.marketRate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GMarketRateData', 'G__typename');
  }

  @override
  GMarketRateData rebuild(void Function(GMarketRateDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMarketRateDataBuilder toBuilder() =>
      new GMarketRateDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMarketRateData &&
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
    return (newBuiltValueToStringHelper(r'GMarketRateData')
          ..add('G__typename', G__typename)
          ..add('marketRate', marketRate))
        .toString();
  }
}

class GMarketRateDataBuilder
    implements Builder<GMarketRateData, GMarketRateDataBuilder> {
  _$GMarketRateData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GMarketRateData_marketRateBuilder? _marketRate;
  GMarketRateData_marketRateBuilder get marketRate =>
      _$this._marketRate ??= new GMarketRateData_marketRateBuilder();
  set marketRate(GMarketRateData_marketRateBuilder? marketRate) =>
      _$this._marketRate = marketRate;

  GMarketRateDataBuilder() {
    GMarketRateData._initializeBuilder(this);
  }

  GMarketRateDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _marketRate = $v.marketRate?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMarketRateData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMarketRateData;
  }

  @override
  void update(void Function(GMarketRateDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMarketRateData build() => _build();

  _$GMarketRateData _build() {
    _$GMarketRateData _$result;
    try {
      _$result = _$v ??
          new _$GMarketRateData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GMarketRateData', 'G__typename'),
              marketRate: _marketRate?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'marketRate';
        _marketRate?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GMarketRateData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GMarketRateData_marketRate extends GMarketRateData_marketRate {
  @override
  final String G__typename;
  @override
  final String? market;
  @override
  final double? rate;
  @override
  final String? ts;

  factory _$GMarketRateData_marketRate(
          [void Function(GMarketRateData_marketRateBuilder)? updates]) =>
      (new GMarketRateData_marketRateBuilder()..update(updates))._build();

  _$GMarketRateData_marketRate._(
      {required this.G__typename, this.market, this.rate, this.ts})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GMarketRateData_marketRate', 'G__typename');
  }

  @override
  GMarketRateData_marketRate rebuild(
          void Function(GMarketRateData_marketRateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMarketRateData_marketRateBuilder toBuilder() =>
      new GMarketRateData_marketRateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMarketRateData_marketRate &&
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
    return (newBuiltValueToStringHelper(r'GMarketRateData_marketRate')
          ..add('G__typename', G__typename)
          ..add('market', market)
          ..add('rate', rate)
          ..add('ts', ts))
        .toString();
  }
}

class GMarketRateData_marketRateBuilder
    implements
        Builder<GMarketRateData_marketRate, GMarketRateData_marketRateBuilder> {
  _$GMarketRateData_marketRate? _$v;

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

  GMarketRateData_marketRateBuilder() {
    GMarketRateData_marketRate._initializeBuilder(this);
  }

  GMarketRateData_marketRateBuilder get _$this {
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
  void replace(GMarketRateData_marketRate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMarketRateData_marketRate;
  }

  @override
  void update(void Function(GMarketRateData_marketRateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMarketRateData_marketRate build() => _build();

  _$GMarketRateData_marketRate _build() {
    final _$result = _$v ??
        new _$GMarketRateData_marketRate._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GMarketRateData_marketRate', 'G__typename'),
            market: market,
            rate: rate,
            ts: ts);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

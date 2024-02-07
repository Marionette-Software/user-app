// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_wallet_history_kline.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWalletHistoryKlineData> _$gWalletHistoryKlineDataSerializer =
    new _$GWalletHistoryKlineDataSerializer();
Serializer<GWalletHistoryKlineData_kline>
    _$gWalletHistoryKlineDataKlineSerializer =
    new _$GWalletHistoryKlineData_klineSerializer();

class _$GWalletHistoryKlineDataSerializer
    implements StructuredSerializer<GWalletHistoryKlineData> {
  @override
  final Iterable<Type> types = const [
    GWalletHistoryKlineData,
    _$GWalletHistoryKlineData
  ];
  @override
  final String wireName = 'GWalletHistoryKlineData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWalletHistoryKlineData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.kline;
    if (value != null) {
      result
        ..add('kline')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GWalletHistoryKlineData_kline)
            ])));
    }
    return result;
  }

  @override
  GWalletHistoryKlineData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWalletHistoryKlineDataBuilder();

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
        case 'kline':
          result.kline.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GWalletHistoryKlineData_kline)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GWalletHistoryKlineData_klineSerializer
    implements StructuredSerializer<GWalletHistoryKlineData_kline> {
  @override
  final Iterable<Type> types = const [
    GWalletHistoryKlineData_kline,
    _$GWalletHistoryKlineData_kline
  ];
  @override
  final String wireName = 'GWalletHistoryKlineData_kline';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWalletHistoryKlineData_kline object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.close;
    if (value != null) {
      result
        ..add('close')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.low;
    if (value != null) {
      result
        ..add('low')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.high;
    if (value != null) {
      result
        ..add('high')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.volume;
    if (value != null) {
      result
        ..add('volume')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GWalletHistoryKlineData_kline deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWalletHistoryKlineData_klineBuilder();

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
        case 'close':
          result.close = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'low':
          result.low = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'high':
          result.high = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'volume':
          result.volume = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GWalletHistoryKlineData extends GWalletHistoryKlineData {
  @override
  final String G__typename;
  @override
  final BuiltList<GWalletHistoryKlineData_kline?>? kline;

  factory _$GWalletHistoryKlineData(
          [void Function(GWalletHistoryKlineDataBuilder)? updates]) =>
      (new GWalletHistoryKlineDataBuilder()..update(updates))._build();

  _$GWalletHistoryKlineData._({required this.G__typename, this.kline})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWalletHistoryKlineData', 'G__typename');
  }

  @override
  GWalletHistoryKlineData rebuild(
          void Function(GWalletHistoryKlineDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWalletHistoryKlineDataBuilder toBuilder() =>
      new GWalletHistoryKlineDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWalletHistoryKlineData &&
        G__typename == other.G__typename &&
        kline == other.kline;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, kline.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWalletHistoryKlineData')
          ..add('G__typename', G__typename)
          ..add('kline', kline))
        .toString();
  }
}

class GWalletHistoryKlineDataBuilder
    implements
        Builder<GWalletHistoryKlineData, GWalletHistoryKlineDataBuilder> {
  _$GWalletHistoryKlineData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GWalletHistoryKlineData_kline?>? _kline;
  ListBuilder<GWalletHistoryKlineData_kline?> get kline =>
      _$this._kline ??= new ListBuilder<GWalletHistoryKlineData_kline?>();
  set kline(ListBuilder<GWalletHistoryKlineData_kline?>? kline) =>
      _$this._kline = kline;

  GWalletHistoryKlineDataBuilder() {
    GWalletHistoryKlineData._initializeBuilder(this);
  }

  GWalletHistoryKlineDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _kline = $v.kline?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWalletHistoryKlineData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWalletHistoryKlineData;
  }

  @override
  void update(void Function(GWalletHistoryKlineDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWalletHistoryKlineData build() => _build();

  _$GWalletHistoryKlineData _build() {
    _$GWalletHistoryKlineData _$result;
    try {
      _$result = _$v ??
          new _$GWalletHistoryKlineData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GWalletHistoryKlineData', 'G__typename'),
              kline: _kline?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'kline';
        _kline?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWalletHistoryKlineData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWalletHistoryKlineData_kline extends GWalletHistoryKlineData_kline {
  @override
  final String G__typename;
  @override
  final double? close;
  @override
  final double? low;
  @override
  final double? high;
  @override
  final int? timestamp;
  @override
  final double? volume;

  factory _$GWalletHistoryKlineData_kline(
          [void Function(GWalletHistoryKlineData_klineBuilder)? updates]) =>
      (new GWalletHistoryKlineData_klineBuilder()..update(updates))._build();

  _$GWalletHistoryKlineData_kline._(
      {required this.G__typename,
      this.close,
      this.low,
      this.high,
      this.timestamp,
      this.volume})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWalletHistoryKlineData_kline', 'G__typename');
  }

  @override
  GWalletHistoryKlineData_kline rebuild(
          void Function(GWalletHistoryKlineData_klineBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWalletHistoryKlineData_klineBuilder toBuilder() =>
      new GWalletHistoryKlineData_klineBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWalletHistoryKlineData_kline &&
        G__typename == other.G__typename &&
        close == other.close &&
        low == other.low &&
        high == other.high &&
        timestamp == other.timestamp &&
        volume == other.volume;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, close.hashCode);
    _$hash = $jc(_$hash, low.hashCode);
    _$hash = $jc(_$hash, high.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, volume.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWalletHistoryKlineData_kline')
          ..add('G__typename', G__typename)
          ..add('close', close)
          ..add('low', low)
          ..add('high', high)
          ..add('timestamp', timestamp)
          ..add('volume', volume))
        .toString();
  }
}

class GWalletHistoryKlineData_klineBuilder
    implements
        Builder<GWalletHistoryKlineData_kline,
            GWalletHistoryKlineData_klineBuilder> {
  _$GWalletHistoryKlineData_kline? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  double? _close;
  double? get close => _$this._close;
  set close(double? close) => _$this._close = close;

  double? _low;
  double? get low => _$this._low;
  set low(double? low) => _$this._low = low;

  double? _high;
  double? get high => _$this._high;
  set high(double? high) => _$this._high = high;

  int? _timestamp;
  int? get timestamp => _$this._timestamp;
  set timestamp(int? timestamp) => _$this._timestamp = timestamp;

  double? _volume;
  double? get volume => _$this._volume;
  set volume(double? volume) => _$this._volume = volume;

  GWalletHistoryKlineData_klineBuilder() {
    GWalletHistoryKlineData_kline._initializeBuilder(this);
  }

  GWalletHistoryKlineData_klineBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _close = $v.close;
      _low = $v.low;
      _high = $v.high;
      _timestamp = $v.timestamp;
      _volume = $v.volume;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWalletHistoryKlineData_kline other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWalletHistoryKlineData_kline;
  }

  @override
  void update(void Function(GWalletHistoryKlineData_klineBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWalletHistoryKlineData_kline build() => _build();

  _$GWalletHistoryKlineData_kline _build() {
    final _$result = _$v ??
        new _$GWalletHistoryKlineData_kline._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GWalletHistoryKlineData_kline', 'G__typename'),
            close: close,
            low: low,
            high: high,
            timestamp: timestamp,
            volume: volume);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

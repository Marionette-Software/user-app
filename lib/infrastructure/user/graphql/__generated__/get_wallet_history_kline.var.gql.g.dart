// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_wallet_history_kline.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWalletHistoryKlineVars> _$gWalletHistoryKlineVarsSerializer =
    new _$GWalletHistoryKlineVarsSerializer();

class _$GWalletHistoryKlineVarsSerializer
    implements StructuredSerializer<GWalletHistoryKlineVars> {
  @override
  final Iterable<Type> types = const [
    GWalletHistoryKlineVars,
    _$GWalletHistoryKlineVars
  ];
  @override
  final String wireName = 'GWalletHistoryKlineVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWalletHistoryKlineVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'market',
      serializers.serialize(object.market,
          specifiedType: const FullType(String)),
      'interval',
      serializers.serialize(object.interval,
          specifiedType: const FullType(String)),
      'timeFrom',
      serializers.serialize(object.timeFrom,
          specifiedType: const FullType(int)),
      'timeTo',
      serializers.serialize(object.timeTo, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GWalletHistoryKlineVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWalletHistoryKlineVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'market':
          result.market = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'interval':
          result.interval = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'timeFrom':
          result.timeFrom = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'timeTo':
          result.timeTo = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GWalletHistoryKlineVars extends GWalletHistoryKlineVars {
  @override
  final String market;
  @override
  final String interval;
  @override
  final int timeFrom;
  @override
  final int timeTo;

  factory _$GWalletHistoryKlineVars(
          [void Function(GWalletHistoryKlineVarsBuilder)? updates]) =>
      (new GWalletHistoryKlineVarsBuilder()..update(updates))._build();

  _$GWalletHistoryKlineVars._(
      {required this.market,
      required this.interval,
      required this.timeFrom,
      required this.timeTo})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        market, r'GWalletHistoryKlineVars', 'market');
    BuiltValueNullFieldError.checkNotNull(
        interval, r'GWalletHistoryKlineVars', 'interval');
    BuiltValueNullFieldError.checkNotNull(
        timeFrom, r'GWalletHistoryKlineVars', 'timeFrom');
    BuiltValueNullFieldError.checkNotNull(
        timeTo, r'GWalletHistoryKlineVars', 'timeTo');
  }

  @override
  GWalletHistoryKlineVars rebuild(
          void Function(GWalletHistoryKlineVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWalletHistoryKlineVarsBuilder toBuilder() =>
      new GWalletHistoryKlineVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWalletHistoryKlineVars &&
        market == other.market &&
        interval == other.interval &&
        timeFrom == other.timeFrom &&
        timeTo == other.timeTo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, market.hashCode);
    _$hash = $jc(_$hash, interval.hashCode);
    _$hash = $jc(_$hash, timeFrom.hashCode);
    _$hash = $jc(_$hash, timeTo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWalletHistoryKlineVars')
          ..add('market', market)
          ..add('interval', interval)
          ..add('timeFrom', timeFrom)
          ..add('timeTo', timeTo))
        .toString();
  }
}

class GWalletHistoryKlineVarsBuilder
    implements
        Builder<GWalletHistoryKlineVars, GWalletHistoryKlineVarsBuilder> {
  _$GWalletHistoryKlineVars? _$v;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  String? _interval;
  String? get interval => _$this._interval;
  set interval(String? interval) => _$this._interval = interval;

  int? _timeFrom;
  int? get timeFrom => _$this._timeFrom;
  set timeFrom(int? timeFrom) => _$this._timeFrom = timeFrom;

  int? _timeTo;
  int? get timeTo => _$this._timeTo;
  set timeTo(int? timeTo) => _$this._timeTo = timeTo;

  GWalletHistoryKlineVarsBuilder();

  GWalletHistoryKlineVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _market = $v.market;
      _interval = $v.interval;
      _timeFrom = $v.timeFrom;
      _timeTo = $v.timeTo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWalletHistoryKlineVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWalletHistoryKlineVars;
  }

  @override
  void update(void Function(GWalletHistoryKlineVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWalletHistoryKlineVars build() => _build();

  _$GWalletHistoryKlineVars _build() {
    final _$result = _$v ??
        new _$GWalletHistoryKlineVars._(
            market: BuiltValueNullFieldError.checkNotNull(
                market, r'GWalletHistoryKlineVars', 'market'),
            interval: BuiltValueNullFieldError.checkNotNull(
                interval, r'GWalletHistoryKlineVars', 'interval'),
            timeFrom: BuiltValueNullFieldError.checkNotNull(
                timeFrom, r'GWalletHistoryKlineVars', 'timeFrom'),
            timeTo: BuiltValueNullFieldError.checkNotNull(
                timeTo, r'GWalletHistoryKlineVars', 'timeTo'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

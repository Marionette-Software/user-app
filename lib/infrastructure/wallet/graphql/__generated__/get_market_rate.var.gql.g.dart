// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_market_rate.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetMarketRateVars> _$gGetMarketRateVarsSerializer =
    new _$GGetMarketRateVarsSerializer();

class _$GGetMarketRateVarsSerializer
    implements StructuredSerializer<GGetMarketRateVars> {
  @override
  final Iterable<Type> types = const [GGetMarketRateVars, _$GGetMarketRateVars];
  @override
  final String wireName = 'GGetMarketRateVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetMarketRateVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'market',
      serializers.serialize(object.market,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetMarketRateVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetMarketRateVarsBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GGetMarketRateVars extends GGetMarketRateVars {
  @override
  final String market;

  factory _$GGetMarketRateVars(
          [void Function(GGetMarketRateVarsBuilder)? updates]) =>
      (new GGetMarketRateVarsBuilder()..update(updates))._build();

  _$GGetMarketRateVars._({required this.market}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        market, r'GGetMarketRateVars', 'market');
  }

  @override
  GGetMarketRateVars rebuild(
          void Function(GGetMarketRateVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetMarketRateVarsBuilder toBuilder() =>
      new GGetMarketRateVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetMarketRateVars && market == other.market;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, market.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetMarketRateVars')
          ..add('market', market))
        .toString();
  }
}

class GGetMarketRateVarsBuilder
    implements Builder<GGetMarketRateVars, GGetMarketRateVarsBuilder> {
  _$GGetMarketRateVars? _$v;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  GGetMarketRateVarsBuilder();

  GGetMarketRateVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _market = $v.market;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetMarketRateVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetMarketRateVars;
  }

  @override
  void update(void Function(GGetMarketRateVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetMarketRateVars build() => _build();

  _$GGetMarketRateVars _build() {
    final _$result = _$v ??
        new _$GGetMarketRateVars._(
            market: BuiltValueNullFieldError.checkNotNull(
                market, r'GGetMarketRateVars', 'market'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

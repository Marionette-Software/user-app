// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_rate_subscription.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GMarketRateVars> _$gMarketRateVarsSerializer =
    new _$GMarketRateVarsSerializer();

class _$GMarketRateVarsSerializer
    implements StructuredSerializer<GMarketRateVars> {
  @override
  final Iterable<Type> types = const [GMarketRateVars, _$GMarketRateVars];
  @override
  final String wireName = 'GMarketRateVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GMarketRateVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'market',
      serializers.serialize(object.market,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GMarketRateVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMarketRateVarsBuilder();

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

class _$GMarketRateVars extends GMarketRateVars {
  @override
  final String market;

  factory _$GMarketRateVars([void Function(GMarketRateVarsBuilder)? updates]) =>
      (new GMarketRateVarsBuilder()..update(updates))._build();

  _$GMarketRateVars._({required this.market}) : super._() {
    BuiltValueNullFieldError.checkNotNull(market, r'GMarketRateVars', 'market');
  }

  @override
  GMarketRateVars rebuild(void Function(GMarketRateVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMarketRateVarsBuilder toBuilder() =>
      new GMarketRateVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMarketRateVars && market == other.market;
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
    return (newBuiltValueToStringHelper(r'GMarketRateVars')
          ..add('market', market))
        .toString();
  }
}

class GMarketRateVarsBuilder
    implements Builder<GMarketRateVars, GMarketRateVarsBuilder> {
  _$GMarketRateVars? _$v;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  GMarketRateVarsBuilder();

  GMarketRateVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _market = $v.market;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMarketRateVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMarketRateVars;
  }

  @override
  void update(void Function(GMarketRateVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMarketRateVars build() => _build();

  _$GMarketRateVars _build() {
    final _$result = _$v ??
        new _$GMarketRateVars._(
            market: BuiltValueNullFieldError.checkNotNull(
                market, r'GMarketRateVars', 'market'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

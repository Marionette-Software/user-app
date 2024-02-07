// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_dynamics_query.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetMarketDynamicsVars> _$gGetMarketDynamicsVarsSerializer =
    new _$GGetMarketDynamicsVarsSerializer();

class _$GGetMarketDynamicsVarsSerializer
    implements StructuredSerializer<GGetMarketDynamicsVars> {
  @override
  final Iterable<Type> types = const [
    GGetMarketDynamicsVars,
    _$GGetMarketDynamicsVars
  ];
  @override
  final String wireName = 'GGetMarketDynamicsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetMarketDynamicsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'market',
      serializers.serialize(object.market,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetMarketDynamicsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetMarketDynamicsVarsBuilder();

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

class _$GGetMarketDynamicsVars extends GGetMarketDynamicsVars {
  @override
  final String market;

  factory _$GGetMarketDynamicsVars(
          [void Function(GGetMarketDynamicsVarsBuilder)? updates]) =>
      (new GGetMarketDynamicsVarsBuilder()..update(updates))._build();

  _$GGetMarketDynamicsVars._({required this.market}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        market, r'GGetMarketDynamicsVars', 'market');
  }

  @override
  GGetMarketDynamicsVars rebuild(
          void Function(GGetMarketDynamicsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetMarketDynamicsVarsBuilder toBuilder() =>
      new GGetMarketDynamicsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetMarketDynamicsVars && market == other.market;
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
    return (newBuiltValueToStringHelper(r'GGetMarketDynamicsVars')
          ..add('market', market))
        .toString();
  }
}

class GGetMarketDynamicsVarsBuilder
    implements Builder<GGetMarketDynamicsVars, GGetMarketDynamicsVarsBuilder> {
  _$GGetMarketDynamicsVars? _$v;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  GGetMarketDynamicsVarsBuilder();

  GGetMarketDynamicsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _market = $v.market;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetMarketDynamicsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetMarketDynamicsVars;
  }

  @override
  void update(void Function(GGetMarketDynamicsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetMarketDynamicsVars build() => _build();

  _$GGetMarketDynamicsVars _build() {
    final _$result = _$v ??
        new _$GGetMarketDynamicsVars._(
            market: BuiltValueNullFieldError.checkNotNull(
                market, r'GGetMarketDynamicsVars', 'market'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

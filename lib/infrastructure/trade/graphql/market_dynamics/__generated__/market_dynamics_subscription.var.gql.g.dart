// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_dynamics_subscription.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GMarketDynamicsVars> _$gMarketDynamicsVarsSerializer =
    new _$GMarketDynamicsVarsSerializer();

class _$GMarketDynamicsVarsSerializer
    implements StructuredSerializer<GMarketDynamicsVars> {
  @override
  final Iterable<Type> types = const [
    GMarketDynamicsVars,
    _$GMarketDynamicsVars
  ];
  @override
  final String wireName = 'GMarketDynamicsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GMarketDynamicsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.market;
    if (value != null) {
      result
        ..add('market')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GMarketDynamicsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMarketDynamicsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'market':
          result.market = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GMarketDynamicsVars extends GMarketDynamicsVars {
  @override
  final String? market;

  factory _$GMarketDynamicsVars(
          [void Function(GMarketDynamicsVarsBuilder)? updates]) =>
      (new GMarketDynamicsVarsBuilder()..update(updates))._build();

  _$GMarketDynamicsVars._({this.market}) : super._();

  @override
  GMarketDynamicsVars rebuild(
          void Function(GMarketDynamicsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMarketDynamicsVarsBuilder toBuilder() =>
      new GMarketDynamicsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMarketDynamicsVars && market == other.market;
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
    return (newBuiltValueToStringHelper(r'GMarketDynamicsVars')
          ..add('market', market))
        .toString();
  }
}

class GMarketDynamicsVarsBuilder
    implements Builder<GMarketDynamicsVars, GMarketDynamicsVarsBuilder> {
  _$GMarketDynamicsVars? _$v;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  GMarketDynamicsVarsBuilder();

  GMarketDynamicsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _market = $v.market;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMarketDynamicsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMarketDynamicsVars;
  }

  @override
  void update(void Function(GMarketDynamicsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMarketDynamicsVars build() => _build();

  _$GMarketDynamicsVars _build() {
    final _$result = _$v ?? new _$GMarketDynamicsVars._(market: market);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

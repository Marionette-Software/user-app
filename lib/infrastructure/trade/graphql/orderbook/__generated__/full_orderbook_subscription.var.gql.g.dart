// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_orderbook_subscription.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPublicFullOrderBookSubscriptionVars>
    _$gPublicFullOrderBookSubscriptionVarsSerializer =
    new _$GPublicFullOrderBookSubscriptionVarsSerializer();

class _$GPublicFullOrderBookSubscriptionVarsSerializer
    implements StructuredSerializer<GPublicFullOrderBookSubscriptionVars> {
  @override
  final Iterable<Type> types = const [
    GPublicFullOrderBookSubscriptionVars,
    _$GPublicFullOrderBookSubscriptionVars
  ];
  @override
  final String wireName = 'GPublicFullOrderBookSubscriptionVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPublicFullOrderBookSubscriptionVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'market',
      serializers.serialize(object.market,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPublicFullOrderBookSubscriptionVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPublicFullOrderBookSubscriptionVarsBuilder();

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

class _$GPublicFullOrderBookSubscriptionVars
    extends GPublicFullOrderBookSubscriptionVars {
  @override
  final String market;

  factory _$GPublicFullOrderBookSubscriptionVars(
          [void Function(GPublicFullOrderBookSubscriptionVarsBuilder)?
              updates]) =>
      (new GPublicFullOrderBookSubscriptionVarsBuilder()..update(updates))
          ._build();

  _$GPublicFullOrderBookSubscriptionVars._({required this.market}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        market, r'GPublicFullOrderBookSubscriptionVars', 'market');
  }

  @override
  GPublicFullOrderBookSubscriptionVars rebuild(
          void Function(GPublicFullOrderBookSubscriptionVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicFullOrderBookSubscriptionVarsBuilder toBuilder() =>
      new GPublicFullOrderBookSubscriptionVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPublicFullOrderBookSubscriptionVars &&
        market == other.market;
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
    return (newBuiltValueToStringHelper(r'GPublicFullOrderBookSubscriptionVars')
          ..add('market', market))
        .toString();
  }
}

class GPublicFullOrderBookSubscriptionVarsBuilder
    implements
        Builder<GPublicFullOrderBookSubscriptionVars,
            GPublicFullOrderBookSubscriptionVarsBuilder> {
  _$GPublicFullOrderBookSubscriptionVars? _$v;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  GPublicFullOrderBookSubscriptionVarsBuilder();

  GPublicFullOrderBookSubscriptionVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _market = $v.market;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPublicFullOrderBookSubscriptionVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPublicFullOrderBookSubscriptionVars;
  }

  @override
  void update(
      void Function(GPublicFullOrderBookSubscriptionVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicFullOrderBookSubscriptionVars build() => _build();

  _$GPublicFullOrderBookSubscriptionVars _build() {
    final _$result = _$v ??
        new _$GPublicFullOrderBookSubscriptionVars._(
            market: BuiltValueNullFieldError.checkNotNull(
                market, r'GPublicFullOrderBookSubscriptionVars', 'market'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

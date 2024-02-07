// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diff_orderbook_subscription.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPublicDiffOrderBookSubscriptionVars>
    _$gPublicDiffOrderBookSubscriptionVarsSerializer =
    new _$GPublicDiffOrderBookSubscriptionVarsSerializer();

class _$GPublicDiffOrderBookSubscriptionVarsSerializer
    implements StructuredSerializer<GPublicDiffOrderBookSubscriptionVars> {
  @override
  final Iterable<Type> types = const [
    GPublicDiffOrderBookSubscriptionVars,
    _$GPublicDiffOrderBookSubscriptionVars
  ];
  @override
  final String wireName = 'GPublicDiffOrderBookSubscriptionVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPublicDiffOrderBookSubscriptionVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'market',
      serializers.serialize(object.market,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPublicDiffOrderBookSubscriptionVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPublicDiffOrderBookSubscriptionVarsBuilder();

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

class _$GPublicDiffOrderBookSubscriptionVars
    extends GPublicDiffOrderBookSubscriptionVars {
  @override
  final String market;

  factory _$GPublicDiffOrderBookSubscriptionVars(
          [void Function(GPublicDiffOrderBookSubscriptionVarsBuilder)?
              updates]) =>
      (new GPublicDiffOrderBookSubscriptionVarsBuilder()..update(updates))
          ._build();

  _$GPublicDiffOrderBookSubscriptionVars._({required this.market}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        market, r'GPublicDiffOrderBookSubscriptionVars', 'market');
  }

  @override
  GPublicDiffOrderBookSubscriptionVars rebuild(
          void Function(GPublicDiffOrderBookSubscriptionVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicDiffOrderBookSubscriptionVarsBuilder toBuilder() =>
      new GPublicDiffOrderBookSubscriptionVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPublicDiffOrderBookSubscriptionVars &&
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
    return (newBuiltValueToStringHelper(r'GPublicDiffOrderBookSubscriptionVars')
          ..add('market', market))
        .toString();
  }
}

class GPublicDiffOrderBookSubscriptionVarsBuilder
    implements
        Builder<GPublicDiffOrderBookSubscriptionVars,
            GPublicDiffOrderBookSubscriptionVarsBuilder> {
  _$GPublicDiffOrderBookSubscriptionVars? _$v;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  GPublicDiffOrderBookSubscriptionVarsBuilder();

  GPublicDiffOrderBookSubscriptionVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _market = $v.market;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPublicDiffOrderBookSubscriptionVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPublicDiffOrderBookSubscriptionVars;
  }

  @override
  void update(
      void Function(GPublicDiffOrderBookSubscriptionVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicDiffOrderBookSubscriptionVars build() => _build();

  _$GPublicDiffOrderBookSubscriptionVars _build() {
    final _$result = _$v ??
        new _$GPublicDiffOrderBookSubscriptionVars._(
            market: BuiltValueNullFieldError.checkNotNull(
                market, r'GPublicDiffOrderBookSubscriptionVars', 'market'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

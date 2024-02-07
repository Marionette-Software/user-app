// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_trades_subscription.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPublicTradesSubscriptionVars>
    _$gPublicTradesSubscriptionVarsSerializer =
    new _$GPublicTradesSubscriptionVarsSerializer();

class _$GPublicTradesSubscriptionVarsSerializer
    implements StructuredSerializer<GPublicTradesSubscriptionVars> {
  @override
  final Iterable<Type> types = const [
    GPublicTradesSubscriptionVars,
    _$GPublicTradesSubscriptionVars
  ];
  @override
  final String wireName = 'GPublicTradesSubscriptionVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPublicTradesSubscriptionVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'market',
      serializers.serialize(object.market,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPublicTradesSubscriptionVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPublicTradesSubscriptionVarsBuilder();

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

class _$GPublicTradesSubscriptionVars extends GPublicTradesSubscriptionVars {
  @override
  final String market;

  factory _$GPublicTradesSubscriptionVars(
          [void Function(GPublicTradesSubscriptionVarsBuilder)? updates]) =>
      (new GPublicTradesSubscriptionVarsBuilder()..update(updates))._build();

  _$GPublicTradesSubscriptionVars._({required this.market}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        market, r'GPublicTradesSubscriptionVars', 'market');
  }

  @override
  GPublicTradesSubscriptionVars rebuild(
          void Function(GPublicTradesSubscriptionVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicTradesSubscriptionVarsBuilder toBuilder() =>
      new GPublicTradesSubscriptionVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPublicTradesSubscriptionVars && market == other.market;
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
    return (newBuiltValueToStringHelper(r'GPublicTradesSubscriptionVars')
          ..add('market', market))
        .toString();
  }
}

class GPublicTradesSubscriptionVarsBuilder
    implements
        Builder<GPublicTradesSubscriptionVars,
            GPublicTradesSubscriptionVarsBuilder> {
  _$GPublicTradesSubscriptionVars? _$v;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  GPublicTradesSubscriptionVarsBuilder();

  GPublicTradesSubscriptionVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _market = $v.market;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPublicTradesSubscriptionVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPublicTradesSubscriptionVars;
  }

  @override
  void update(void Function(GPublicTradesSubscriptionVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicTradesSubscriptionVars build() => _build();

  _$GPublicTradesSubscriptionVars _build() {
    final _$result = _$v ??
        new _$GPublicTradesSubscriptionVars._(
            market: BuiltValueNullFieldError.checkNotNull(
                market, r'GPublicTradesSubscriptionVars', 'market'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

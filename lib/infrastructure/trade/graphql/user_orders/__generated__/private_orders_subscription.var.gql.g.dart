// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_orders_subscription.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPrivateOrdersSubscriptionVars>
    _$gPrivateOrdersSubscriptionVarsSerializer =
    new _$GPrivateOrdersSubscriptionVarsSerializer();

class _$GPrivateOrdersSubscriptionVarsSerializer
    implements StructuredSerializer<GPrivateOrdersSubscriptionVars> {
  @override
  final Iterable<Type> types = const [
    GPrivateOrdersSubscriptionVars,
    _$GPrivateOrdersSubscriptionVars
  ];
  @override
  final String wireName = 'GPrivateOrdersSubscriptionVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPrivateOrdersSubscriptionVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'market',
      serializers.serialize(object.market,
          specifiedType: const FullType(String)),
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPrivateOrdersSubscriptionVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPrivateOrdersSubscriptionVarsBuilder();

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
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPrivateOrdersSubscriptionVars extends GPrivateOrdersSubscriptionVars {
  @override
  final String market;
  @override
  final String token;

  factory _$GPrivateOrdersSubscriptionVars(
          [void Function(GPrivateOrdersSubscriptionVarsBuilder)? updates]) =>
      (new GPrivateOrdersSubscriptionVarsBuilder()..update(updates))._build();

  _$GPrivateOrdersSubscriptionVars._(
      {required this.market, required this.token})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        market, r'GPrivateOrdersSubscriptionVars', 'market');
    BuiltValueNullFieldError.checkNotNull(
        token, r'GPrivateOrdersSubscriptionVars', 'token');
  }

  @override
  GPrivateOrdersSubscriptionVars rebuild(
          void Function(GPrivateOrdersSubscriptionVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPrivateOrdersSubscriptionVarsBuilder toBuilder() =>
      new GPrivateOrdersSubscriptionVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPrivateOrdersSubscriptionVars &&
        market == other.market &&
        token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, market.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPrivateOrdersSubscriptionVars')
          ..add('market', market)
          ..add('token', token))
        .toString();
  }
}

class GPrivateOrdersSubscriptionVarsBuilder
    implements
        Builder<GPrivateOrdersSubscriptionVars,
            GPrivateOrdersSubscriptionVarsBuilder> {
  _$GPrivateOrdersSubscriptionVars? _$v;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  GPrivateOrdersSubscriptionVarsBuilder();

  GPrivateOrdersSubscriptionVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _market = $v.market;
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPrivateOrdersSubscriptionVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPrivateOrdersSubscriptionVars;
  }

  @override
  void update(void Function(GPrivateOrdersSubscriptionVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPrivateOrdersSubscriptionVars build() => _build();

  _$GPrivateOrdersSubscriptionVars _build() {
    final _$result = _$v ??
        new _$GPrivateOrdersSubscriptionVars._(
            market: BuiltValueNullFieldError.checkNotNull(
                market, r'GPrivateOrdersSubscriptionVars', 'market'),
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'GPrivateOrdersSubscriptionVars', 'token'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

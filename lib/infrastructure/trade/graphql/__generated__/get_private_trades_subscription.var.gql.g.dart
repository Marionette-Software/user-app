// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_private_trades_subscription.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetPrivateTradesVars> _$gGetPrivateTradesVarsSerializer =
    new _$GGetPrivateTradesVarsSerializer();

class _$GGetPrivateTradesVarsSerializer
    implements StructuredSerializer<GGetPrivateTradesVars> {
  @override
  final Iterable<Type> types = const [
    GGetPrivateTradesVars,
    _$GGetPrivateTradesVars
  ];
  @override
  final String wireName = 'GGetPrivateTradesVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetPrivateTradesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];
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
  GGetPrivateTradesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetPrivateTradesVarsBuilder();

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
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetPrivateTradesVars extends GGetPrivateTradesVars {
  @override
  final String? market;
  @override
  final String token;

  factory _$GGetPrivateTradesVars(
          [void Function(GGetPrivateTradesVarsBuilder)? updates]) =>
      (new GGetPrivateTradesVarsBuilder()..update(updates))._build();

  _$GGetPrivateTradesVars._({this.market, required this.token}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        token, r'GGetPrivateTradesVars', 'token');
  }

  @override
  GGetPrivateTradesVars rebuild(
          void Function(GGetPrivateTradesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetPrivateTradesVarsBuilder toBuilder() =>
      new GGetPrivateTradesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetPrivateTradesVars &&
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
    return (newBuiltValueToStringHelper(r'GGetPrivateTradesVars')
          ..add('market', market)
          ..add('token', token))
        .toString();
  }
}

class GGetPrivateTradesVarsBuilder
    implements Builder<GGetPrivateTradesVars, GGetPrivateTradesVarsBuilder> {
  _$GGetPrivateTradesVars? _$v;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  GGetPrivateTradesVarsBuilder();

  GGetPrivateTradesVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _market = $v.market;
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetPrivateTradesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetPrivateTradesVars;
  }

  @override
  void update(void Function(GGetPrivateTradesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetPrivateTradesVars build() => _build();

  _$GGetPrivateTradesVars _build() {
    final _$result = _$v ??
        new _$GGetPrivateTradesVars._(
            market: market,
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'GGetPrivateTradesVars', 'token'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_orderbook.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPublicOrderBookVars> _$gPublicOrderBookVarsSerializer =
    new _$GPublicOrderBookVarsSerializer();

class _$GPublicOrderBookVarsSerializer
    implements StructuredSerializer<GPublicOrderBookVars> {
  @override
  final Iterable<Type> types = const [
    GPublicOrderBookVars,
    _$GPublicOrderBookVars
  ];
  @override
  final String wireName = 'GPublicOrderBookVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPublicOrderBookVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'market',
      serializers.serialize(object.market,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPublicOrderBookVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPublicOrderBookVarsBuilder();

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

class _$GPublicOrderBookVars extends GPublicOrderBookVars {
  @override
  final String market;

  factory _$GPublicOrderBookVars(
          [void Function(GPublicOrderBookVarsBuilder)? updates]) =>
      (new GPublicOrderBookVarsBuilder()..update(updates))._build();

  _$GPublicOrderBookVars._({required this.market}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        market, r'GPublicOrderBookVars', 'market');
  }

  @override
  GPublicOrderBookVars rebuild(
          void Function(GPublicOrderBookVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicOrderBookVarsBuilder toBuilder() =>
      new GPublicOrderBookVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPublicOrderBookVars && market == other.market;
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
    return (newBuiltValueToStringHelper(r'GPublicOrderBookVars')
          ..add('market', market))
        .toString();
  }
}

class GPublicOrderBookVarsBuilder
    implements Builder<GPublicOrderBookVars, GPublicOrderBookVarsBuilder> {
  _$GPublicOrderBookVars? _$v;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  GPublicOrderBookVarsBuilder();

  GPublicOrderBookVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _market = $v.market;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPublicOrderBookVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPublicOrderBookVars;
  }

  @override
  void update(void Function(GPublicOrderBookVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicOrderBookVars build() => _build();

  _$GPublicOrderBookVars _build() {
    final _$result = _$v ??
        new _$GPublicOrderBookVars._(
            market: BuiltValueNullFieldError.checkNotNull(
                market, r'GPublicOrderBookVars', 'market'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

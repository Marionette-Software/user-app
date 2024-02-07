// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_favorite_market.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GsetFavoriteMarketVars> _$gsetFavoriteMarketVarsSerializer =
    new _$GsetFavoriteMarketVarsSerializer();

class _$GsetFavoriteMarketVarsSerializer
    implements StructuredSerializer<GsetFavoriteMarketVars> {
  @override
  final Iterable<Type> types = const [
    GsetFavoriteMarketVars,
    _$GsetFavoriteMarketVars
  ];
  @override
  final String wireName = 'GsetFavoriteMarketVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GsetFavoriteMarketVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'marketId',
      serializers.serialize(object.marketId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GsetFavoriteMarketVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GsetFavoriteMarketVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'marketId':
          result.marketId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GsetFavoriteMarketVars extends GsetFavoriteMarketVars {
  @override
  final String marketId;

  factory _$GsetFavoriteMarketVars(
          [void Function(GsetFavoriteMarketVarsBuilder)? updates]) =>
      (new GsetFavoriteMarketVarsBuilder()..update(updates))._build();

  _$GsetFavoriteMarketVars._({required this.marketId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        marketId, r'GsetFavoriteMarketVars', 'marketId');
  }

  @override
  GsetFavoriteMarketVars rebuild(
          void Function(GsetFavoriteMarketVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GsetFavoriteMarketVarsBuilder toBuilder() =>
      new GsetFavoriteMarketVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GsetFavoriteMarketVars && marketId == other.marketId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, marketId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GsetFavoriteMarketVars')
          ..add('marketId', marketId))
        .toString();
  }
}

class GsetFavoriteMarketVarsBuilder
    implements Builder<GsetFavoriteMarketVars, GsetFavoriteMarketVarsBuilder> {
  _$GsetFavoriteMarketVars? _$v;

  String? _marketId;
  String? get marketId => _$this._marketId;
  set marketId(String? marketId) => _$this._marketId = marketId;

  GsetFavoriteMarketVarsBuilder();

  GsetFavoriteMarketVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _marketId = $v.marketId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GsetFavoriteMarketVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GsetFavoriteMarketVars;
  }

  @override
  void update(void Function(GsetFavoriteMarketVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GsetFavoriteMarketVars build() => _build();

  _$GsetFavoriteMarketVars _build() {
    final _$result = _$v ??
        new _$GsetFavoriteMarketVars._(
            marketId: BuiltValueNullFieldError.checkNotNull(
                marketId, r'GsetFavoriteMarketVars', 'marketId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_markets.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetMarketsVars> _$gGetMarketsVarsSerializer =
    new _$GGetMarketsVarsSerializer();

class _$GGetMarketsVarsSerializer
    implements StructuredSerializer<GGetMarketsVars> {
  @override
  final Iterable<Type> types = const [GGetMarketsVars, _$GGetMarketsVars];
  @override
  final String wireName = 'GGetMarketsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetMarketsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GGetMarketsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GGetMarketsVarsBuilder().build();
  }
}

class _$GGetMarketsVars extends GGetMarketsVars {
  factory _$GGetMarketsVars([void Function(GGetMarketsVarsBuilder)? updates]) =>
      (new GGetMarketsVarsBuilder()..update(updates))._build();

  _$GGetMarketsVars._() : super._();

  @override
  GGetMarketsVars rebuild(void Function(GGetMarketsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetMarketsVarsBuilder toBuilder() =>
      new GGetMarketsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetMarketsVars;
  }

  @override
  int get hashCode {
    return 574418873;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GGetMarketsVars').toString();
  }
}

class GGetMarketsVarsBuilder
    implements Builder<GGetMarketsVars, GGetMarketsVarsBuilder> {
  _$GGetMarketsVars? _$v;

  GGetMarketsVarsBuilder();

  @override
  void replace(GGetMarketsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetMarketsVars;
  }

  @override
  void update(void Function(GGetMarketsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetMarketsVars build() => _build();

  _$GGetMarketsVars _build() {
    final _$result = _$v ?? new _$GGetMarketsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

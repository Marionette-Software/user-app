// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_key.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetApiKeysVars> _$gGetApiKeysVarsSerializer =
    new _$GGetApiKeysVarsSerializer();

class _$GGetApiKeysVarsSerializer
    implements StructuredSerializer<GGetApiKeysVars> {
  @override
  final Iterable<Type> types = const [GGetApiKeysVars, _$GGetApiKeysVars];
  @override
  final String wireName = 'GGetApiKeysVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetApiKeysVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GGetApiKeysVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GGetApiKeysVarsBuilder().build();
  }
}

class _$GGetApiKeysVars extends GGetApiKeysVars {
  factory _$GGetApiKeysVars([void Function(GGetApiKeysVarsBuilder)? updates]) =>
      (new GGetApiKeysVarsBuilder()..update(updates))._build();

  _$GGetApiKeysVars._() : super._();

  @override
  GGetApiKeysVars rebuild(void Function(GGetApiKeysVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetApiKeysVarsBuilder toBuilder() =>
      new GGetApiKeysVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetApiKeysVars;
  }

  @override
  int get hashCode {
    return 197639408;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GGetApiKeysVars').toString();
  }
}

class GGetApiKeysVarsBuilder
    implements Builder<GGetApiKeysVars, GGetApiKeysVarsBuilder> {
  _$GGetApiKeysVars? _$v;

  GGetApiKeysVarsBuilder();

  @override
  void replace(GGetApiKeysVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetApiKeysVars;
  }

  @override
  void update(void Function(GGetApiKeysVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetApiKeysVars build() => _build();

  _$GGetApiKeysVars _build() {
    final _$result = _$v ?? new _$GGetApiKeysVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

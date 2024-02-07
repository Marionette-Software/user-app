// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ref_user.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetRefUserVars> _$gGetRefUserVarsSerializer =
    new _$GGetRefUserVarsSerializer();

class _$GGetRefUserVarsSerializer
    implements StructuredSerializer<GGetRefUserVars> {
  @override
  final Iterable<Type> types = const [GGetRefUserVars, _$GGetRefUserVars];
  @override
  final String wireName = 'GGetRefUserVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetRefUserVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GGetRefUserVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GGetRefUserVarsBuilder().build();
  }
}

class _$GGetRefUserVars extends GGetRefUserVars {
  factory _$GGetRefUserVars([void Function(GGetRefUserVarsBuilder)? updates]) =>
      (new GGetRefUserVarsBuilder()..update(updates))._build();

  _$GGetRefUserVars._() : super._();

  @override
  GGetRefUserVars rebuild(void Function(GGetRefUserVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetRefUserVarsBuilder toBuilder() =>
      new GGetRefUserVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetRefUserVars;
  }

  @override
  int get hashCode {
    return 363145257;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GGetRefUserVars').toString();
  }
}

class GGetRefUserVarsBuilder
    implements Builder<GGetRefUserVars, GGetRefUserVarsBuilder> {
  _$GGetRefUserVars? _$v;

  GGetRefUserVarsBuilder();

  @override
  void replace(GGetRefUserVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetRefUserVars;
  }

  @override
  void update(void Function(GGetRefUserVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetRefUserVars build() => _build();

  _$GGetRefUserVars _build() {
    final _$result = _$v ?? new _$GGetRefUserVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_2fa.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GRequest2FAVars> _$gRequest2FAVarsSerializer =
    new _$GRequest2FAVarsSerializer();

class _$GRequest2FAVarsSerializer
    implements StructuredSerializer<GRequest2FAVars> {
  @override
  final Iterable<Type> types = const [GRequest2FAVars, _$GRequest2FAVars];
  @override
  final String wireName = 'GRequest2FAVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GRequest2FAVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GRequest2FAVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GRequest2FAVarsBuilder().build();
  }
}

class _$GRequest2FAVars extends GRequest2FAVars {
  factory _$GRequest2FAVars([void Function(GRequest2FAVarsBuilder)? updates]) =>
      (new GRequest2FAVarsBuilder()..update(updates))._build();

  _$GRequest2FAVars._() : super._();

  @override
  GRequest2FAVars rebuild(void Function(GRequest2FAVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRequest2FAVarsBuilder toBuilder() =>
      new GRequest2FAVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRequest2FAVars;
  }

  @override
  int get hashCode {
    return 127993167;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GRequest2FAVars').toString();
  }
}

class GRequest2FAVarsBuilder
    implements Builder<GRequest2FAVars, GRequest2FAVarsBuilder> {
  _$GRequest2FAVars? _$v;

  GRequest2FAVarsBuilder();

  @override
  void replace(GRequest2FAVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRequest2FAVars;
  }

  @override
  void update(void Function(GRequest2FAVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GRequest2FAVars build() => _build();

  _$GRequest2FAVars _build() {
    final _$result = _$v ?? new _$GRequest2FAVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

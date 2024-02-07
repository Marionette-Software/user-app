// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_currencies_request.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetCurrenciesVars> _$gGetCurrenciesVarsSerializer =
    new _$GGetCurrenciesVarsSerializer();

class _$GGetCurrenciesVarsSerializer
    implements StructuredSerializer<GGetCurrenciesVars> {
  @override
  final Iterable<Type> types = const [GGetCurrenciesVars, _$GGetCurrenciesVars];
  @override
  final String wireName = 'GGetCurrenciesVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetCurrenciesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GGetCurrenciesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GGetCurrenciesVarsBuilder().build();
  }
}

class _$GGetCurrenciesVars extends GGetCurrenciesVars {
  factory _$GGetCurrenciesVars(
          [void Function(GGetCurrenciesVarsBuilder)? updates]) =>
      (new GGetCurrenciesVarsBuilder()..update(updates))._build();

  _$GGetCurrenciesVars._() : super._();

  @override
  GGetCurrenciesVars rebuild(
          void Function(GGetCurrenciesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetCurrenciesVarsBuilder toBuilder() =>
      new GGetCurrenciesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetCurrenciesVars;
  }

  @override
  int get hashCode {
    return 320227650;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GGetCurrenciesVars').toString();
  }
}

class GGetCurrenciesVarsBuilder
    implements Builder<GGetCurrenciesVars, GGetCurrenciesVarsBuilder> {
  _$GGetCurrenciesVars? _$v;

  GGetCurrenciesVarsBuilder();

  @override
  void replace(GGetCurrenciesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetCurrenciesVars;
  }

  @override
  void update(void Function(GGetCurrenciesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetCurrenciesVars build() => _build();

  _$GGetCurrenciesVars _build() {
    final _$result = _$v ?? new _$GGetCurrenciesVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

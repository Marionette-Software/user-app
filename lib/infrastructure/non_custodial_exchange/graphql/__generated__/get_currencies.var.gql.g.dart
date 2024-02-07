// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_currencies.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetNonCustodialCurrenciesVars>
    _$gGetNonCustodialCurrenciesVarsSerializer =
    new _$GGetNonCustodialCurrenciesVarsSerializer();

class _$GGetNonCustodialCurrenciesVarsSerializer
    implements StructuredSerializer<GGetNonCustodialCurrenciesVars> {
  @override
  final Iterable<Type> types = const [
    GGetNonCustodialCurrenciesVars,
    _$GGetNonCustodialCurrenciesVars
  ];
  @override
  final String wireName = 'GGetNonCustodialCurrenciesVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetNonCustodialCurrenciesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GGetNonCustodialCurrenciesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GGetNonCustodialCurrenciesVarsBuilder().build();
  }
}

class _$GGetNonCustodialCurrenciesVars extends GGetNonCustodialCurrenciesVars {
  factory _$GGetNonCustodialCurrenciesVars(
          [void Function(GGetNonCustodialCurrenciesVarsBuilder)? updates]) =>
      (new GGetNonCustodialCurrenciesVarsBuilder()..update(updates))._build();

  _$GGetNonCustodialCurrenciesVars._() : super._();

  @override
  GGetNonCustodialCurrenciesVars rebuild(
          void Function(GGetNonCustodialCurrenciesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetNonCustodialCurrenciesVarsBuilder toBuilder() =>
      new GGetNonCustodialCurrenciesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetNonCustodialCurrenciesVars;
  }

  @override
  int get hashCode {
    return 1048398490;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GGetNonCustodialCurrenciesVars')
        .toString();
  }
}

class GGetNonCustodialCurrenciesVarsBuilder
    implements
        Builder<GGetNonCustodialCurrenciesVars,
            GGetNonCustodialCurrenciesVarsBuilder> {
  _$GGetNonCustodialCurrenciesVars? _$v;

  GGetNonCustodialCurrenciesVarsBuilder();

  @override
  void replace(GGetNonCustodialCurrenciesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetNonCustodialCurrenciesVars;
  }

  @override
  void update(void Function(GGetNonCustodialCurrenciesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetNonCustodialCurrenciesVars build() => _build();

  _$GGetNonCustodialCurrenciesVars _build() {
    final _$result = _$v ?? new _$GGetNonCustodialCurrenciesVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

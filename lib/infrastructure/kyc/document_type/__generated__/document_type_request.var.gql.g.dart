// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_type_request.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GKYCDocumentTypesVars> _$gKYCDocumentTypesVarsSerializer =
    new _$GKYCDocumentTypesVarsSerializer();

class _$GKYCDocumentTypesVarsSerializer
    implements StructuredSerializer<GKYCDocumentTypesVars> {
  @override
  final Iterable<Type> types = const [
    GKYCDocumentTypesVars,
    _$GKYCDocumentTypesVars
  ];
  @override
  final String wireName = 'GKYCDocumentTypesVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GKYCDocumentTypesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GKYCDocumentTypesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GKYCDocumentTypesVarsBuilder().build();
  }
}

class _$GKYCDocumentTypesVars extends GKYCDocumentTypesVars {
  factory _$GKYCDocumentTypesVars(
          [void Function(GKYCDocumentTypesVarsBuilder)? updates]) =>
      (new GKYCDocumentTypesVarsBuilder()..update(updates))._build();

  _$GKYCDocumentTypesVars._() : super._();

  @override
  GKYCDocumentTypesVars rebuild(
          void Function(GKYCDocumentTypesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GKYCDocumentTypesVarsBuilder toBuilder() =>
      new GKYCDocumentTypesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GKYCDocumentTypesVars;
  }

  @override
  int get hashCode {
    return 147428649;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GKYCDocumentTypesVars').toString();
  }
}

class GKYCDocumentTypesVarsBuilder
    implements Builder<GKYCDocumentTypesVars, GKYCDocumentTypesVarsBuilder> {
  _$GKYCDocumentTypesVars? _$v;

  GKYCDocumentTypesVarsBuilder();

  @override
  void replace(GKYCDocumentTypesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GKYCDocumentTypesVars;
  }

  @override
  void update(void Function(GKYCDocumentTypesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GKYCDocumentTypesVars build() => _build();

  _$GKYCDocumentTypesVars _build() {
    final _$result = _$v ?? new _$GKYCDocumentTypesVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

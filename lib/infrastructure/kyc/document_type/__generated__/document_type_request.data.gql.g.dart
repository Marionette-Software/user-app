// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_type_request.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GKYCDocumentTypesData> _$gKYCDocumentTypesDataSerializer =
    new _$GKYCDocumentTypesDataSerializer();

class _$GKYCDocumentTypesDataSerializer
    implements StructuredSerializer<GKYCDocumentTypesData> {
  @override
  final Iterable<Type> types = const [
    GKYCDocumentTypesData,
    _$GKYCDocumentTypesData
  ];
  @override
  final String wireName = 'GKYCDocumentTypesData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GKYCDocumentTypesData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.KYCDocumentTypes;
    if (value != null) {
      result
        ..add('KYCDocumentTypes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType.nullable(String)])));
    }
    return result;
  }

  @override
  GKYCDocumentTypesData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GKYCDocumentTypesDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'KYCDocumentTypes':
          result.KYCDocumentTypes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType.nullable(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GKYCDocumentTypesData extends GKYCDocumentTypesData {
  @override
  final String G__typename;
  @override
  final BuiltList<String?>? KYCDocumentTypes;

  factory _$GKYCDocumentTypesData(
          [void Function(GKYCDocumentTypesDataBuilder)? updates]) =>
      (new GKYCDocumentTypesDataBuilder()..update(updates))._build();

  _$GKYCDocumentTypesData._({required this.G__typename, this.KYCDocumentTypes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GKYCDocumentTypesData', 'G__typename');
  }

  @override
  GKYCDocumentTypesData rebuild(
          void Function(GKYCDocumentTypesDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GKYCDocumentTypesDataBuilder toBuilder() =>
      new GKYCDocumentTypesDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GKYCDocumentTypesData &&
        G__typename == other.G__typename &&
        KYCDocumentTypes == other.KYCDocumentTypes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, KYCDocumentTypes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GKYCDocumentTypesData')
          ..add('G__typename', G__typename)
          ..add('KYCDocumentTypes', KYCDocumentTypes))
        .toString();
  }
}

class GKYCDocumentTypesDataBuilder
    implements Builder<GKYCDocumentTypesData, GKYCDocumentTypesDataBuilder> {
  _$GKYCDocumentTypesData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<String?>? _KYCDocumentTypes;
  ListBuilder<String?> get KYCDocumentTypes =>
      _$this._KYCDocumentTypes ??= new ListBuilder<String?>();
  set KYCDocumentTypes(ListBuilder<String?>? KYCDocumentTypes) =>
      _$this._KYCDocumentTypes = KYCDocumentTypes;

  GKYCDocumentTypesDataBuilder() {
    GKYCDocumentTypesData._initializeBuilder(this);
  }

  GKYCDocumentTypesDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _KYCDocumentTypes = $v.KYCDocumentTypes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GKYCDocumentTypesData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GKYCDocumentTypesData;
  }

  @override
  void update(void Function(GKYCDocumentTypesDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GKYCDocumentTypesData build() => _build();

  _$GKYCDocumentTypesData _build() {
    _$GKYCDocumentTypesData _$result;
    try {
      _$result = _$v ??
          new _$GKYCDocumentTypesData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GKYCDocumentTypesData', 'G__typename'),
              KYCDocumentTypes: _KYCDocumentTypes?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'KYCDocumentTypes';
        _KYCDocumentTypes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GKYCDocumentTypesData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

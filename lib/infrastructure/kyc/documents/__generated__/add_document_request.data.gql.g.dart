// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_document_request.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAddUserDocumentData> _$gAddUserDocumentDataSerializer =
    new _$GAddUserDocumentDataSerializer();

class _$GAddUserDocumentDataSerializer
    implements StructuredSerializer<GAddUserDocumentData> {
  @override
  final Iterable<Type> types = const [
    GAddUserDocumentData,
    _$GAddUserDocumentData
  ];
  @override
  final String wireName = 'GAddUserDocumentData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAddUserDocumentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.addDocument;
    if (value != null) {
      result
        ..add('addDocument')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GAddUserDocumentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddUserDocumentDataBuilder();

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
        case 'addDocument':
          result.addDocument = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GAddUserDocumentData extends GAddUserDocumentData {
  @override
  final String G__typename;
  @override
  final String? addDocument;

  factory _$GAddUserDocumentData(
          [void Function(GAddUserDocumentDataBuilder)? updates]) =>
      (new GAddUserDocumentDataBuilder()..update(updates))._build();

  _$GAddUserDocumentData._({required this.G__typename, this.addDocument})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAddUserDocumentData', 'G__typename');
  }

  @override
  GAddUserDocumentData rebuild(
          void Function(GAddUserDocumentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAddUserDocumentDataBuilder toBuilder() =>
      new GAddUserDocumentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAddUserDocumentData &&
        G__typename == other.G__typename &&
        addDocument == other.addDocument;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, addDocument.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAddUserDocumentData')
          ..add('G__typename', G__typename)
          ..add('addDocument', addDocument))
        .toString();
  }
}

class GAddUserDocumentDataBuilder
    implements Builder<GAddUserDocumentData, GAddUserDocumentDataBuilder> {
  _$GAddUserDocumentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _addDocument;
  String? get addDocument => _$this._addDocument;
  set addDocument(String? addDocument) => _$this._addDocument = addDocument;

  GAddUserDocumentDataBuilder() {
    GAddUserDocumentData._initializeBuilder(this);
  }

  GAddUserDocumentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _addDocument = $v.addDocument;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddUserDocumentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAddUserDocumentData;
  }

  @override
  void update(void Function(GAddUserDocumentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAddUserDocumentData build() => _build();

  _$GAddUserDocumentData _build() {
    final _$result = _$v ??
        new _$GAddUserDocumentData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GAddUserDocumentData', 'G__typename'),
            addDocument: addDocument);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

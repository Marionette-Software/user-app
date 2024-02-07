// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_document_request.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAddUserDocumentVars> _$gAddUserDocumentVarsSerializer =
    new _$GAddUserDocumentVarsSerializer();

class _$GAddUserDocumentVarsSerializer
    implements StructuredSerializer<GAddUserDocumentVars> {
  @override
  final Iterable<Type> types = const [
    GAddUserDocumentVars,
    _$GAddUserDocumentVars
  ];
  @override
  final String wireName = 'GAddUserDocumentVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAddUserDocumentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'doc_type',
      serializers.serialize(object.doc_type,
          specifiedType: const FullType(String)),
      'doc_number',
      serializers.serialize(object.doc_number,
          specifiedType: const FullType(String)),
      'file',
      serializers.serialize(object.file,
          specifiedType: const FullType(_i1.MultipartFile)),
      'doc_expire',
      serializers.serialize(object.doc_expire,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GAddUserDocumentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddUserDocumentVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'doc_type':
          result.doc_type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'doc_number':
          result.doc_number = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'file':
          result.file = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.MultipartFile))!
              as _i1.MultipartFile;
          break;
        case 'doc_expire':
          result.doc_expire = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAddUserDocumentVars extends GAddUserDocumentVars {
  @override
  final String doc_type;
  @override
  final String doc_number;
  @override
  final _i1.MultipartFile file;
  @override
  final String doc_expire;

  factory _$GAddUserDocumentVars(
          [void Function(GAddUserDocumentVarsBuilder)? updates]) =>
      (new GAddUserDocumentVarsBuilder()..update(updates))._build();

  _$GAddUserDocumentVars._(
      {required this.doc_type,
      required this.doc_number,
      required this.file,
      required this.doc_expire})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        doc_type, r'GAddUserDocumentVars', 'doc_type');
    BuiltValueNullFieldError.checkNotNull(
        doc_number, r'GAddUserDocumentVars', 'doc_number');
    BuiltValueNullFieldError.checkNotNull(
        file, r'GAddUserDocumentVars', 'file');
    BuiltValueNullFieldError.checkNotNull(
        doc_expire, r'GAddUserDocumentVars', 'doc_expire');
  }

  @override
  GAddUserDocumentVars rebuild(
          void Function(GAddUserDocumentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAddUserDocumentVarsBuilder toBuilder() =>
      new GAddUserDocumentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAddUserDocumentVars &&
        doc_type == other.doc_type &&
        doc_number == other.doc_number &&
        file == other.file &&
        doc_expire == other.doc_expire;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, doc_type.hashCode);
    _$hash = $jc(_$hash, doc_number.hashCode);
    _$hash = $jc(_$hash, file.hashCode);
    _$hash = $jc(_$hash, doc_expire.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAddUserDocumentVars')
          ..add('doc_type', doc_type)
          ..add('doc_number', doc_number)
          ..add('file', file)
          ..add('doc_expire', doc_expire))
        .toString();
  }
}

class GAddUserDocumentVarsBuilder
    implements Builder<GAddUserDocumentVars, GAddUserDocumentVarsBuilder> {
  _$GAddUserDocumentVars? _$v;

  String? _doc_type;
  String? get doc_type => _$this._doc_type;
  set doc_type(String? doc_type) => _$this._doc_type = doc_type;

  String? _doc_number;
  String? get doc_number => _$this._doc_number;
  set doc_number(String? doc_number) => _$this._doc_number = doc_number;

  _i1.MultipartFile? _file;
  _i1.MultipartFile? get file => _$this._file;
  set file(_i1.MultipartFile? file) => _$this._file = file;

  String? _doc_expire;
  String? get doc_expire => _$this._doc_expire;
  set doc_expire(String? doc_expire) => _$this._doc_expire = doc_expire;

  GAddUserDocumentVarsBuilder();

  GAddUserDocumentVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _doc_type = $v.doc_type;
      _doc_number = $v.doc_number;
      _file = $v.file;
      _doc_expire = $v.doc_expire;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddUserDocumentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAddUserDocumentVars;
  }

  @override
  void update(void Function(GAddUserDocumentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAddUserDocumentVars build() => _build();

  _$GAddUserDocumentVars _build() {
    final _$result = _$v ??
        new _$GAddUserDocumentVars._(
            doc_type: BuiltValueNullFieldError.checkNotNull(
                doc_type, r'GAddUserDocumentVars', 'doc_type'),
            doc_number: BuiltValueNullFieldError.checkNotNull(
                doc_number, r'GAddUserDocumentVars', 'doc_number'),
            file: BuiltValueNullFieldError.checkNotNull(
                file, r'GAddUserDocumentVars', 'file'),
            doc_expire: BuiltValueNullFieldError.checkNotNull(
                doc_expire, r'GAddUserDocumentVars', 'doc_expire'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_recipient.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateNonCustodialRecipientData>
    _$gCreateNonCustodialRecipientDataSerializer =
    new _$GCreateNonCustodialRecipientDataSerializer();
Serializer<GCreateNonCustodialRecipientData_createRecipient>
    _$gCreateNonCustodialRecipientDataCreateRecipientSerializer =
    new _$GCreateNonCustodialRecipientData_createRecipientSerializer();

class _$GCreateNonCustodialRecipientDataSerializer
    implements StructuredSerializer<GCreateNonCustodialRecipientData> {
  @override
  final Iterable<Type> types = const [
    GCreateNonCustodialRecipientData,
    _$GCreateNonCustodialRecipientData
  ];
  @override
  final String wireName = 'GCreateNonCustodialRecipientData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateNonCustodialRecipientData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.createRecipient;
    if (value != null) {
      result
        ..add('createRecipient')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GCreateNonCustodialRecipientData_createRecipient)));
    }
    return result;
  }

  @override
  GCreateNonCustodialRecipientData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateNonCustodialRecipientDataBuilder();

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
        case 'createRecipient':
          result.createRecipient.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GCreateNonCustodialRecipientData_createRecipient))!
              as GCreateNonCustodialRecipientData_createRecipient);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateNonCustodialRecipientData_createRecipientSerializer
    implements
        StructuredSerializer<GCreateNonCustodialRecipientData_createRecipient> {
  @override
  final Iterable<Type> types = const [
    GCreateNonCustodialRecipientData_createRecipient,
    _$GCreateNonCustodialRecipientData_createRecipient
  ];
  @override
  final String wireName = 'GCreateNonCustodialRecipientData_createRecipient';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GCreateNonCustodialRecipientData_createRecipient object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GCreateNonCustodialRecipientData_createRecipient deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GCreateNonCustodialRecipientData_createRecipientBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateNonCustodialRecipientData
    extends GCreateNonCustodialRecipientData {
  @override
  final String G__typename;
  @override
  final GCreateNonCustodialRecipientData_createRecipient? createRecipient;

  factory _$GCreateNonCustodialRecipientData(
          [void Function(GCreateNonCustodialRecipientDataBuilder)? updates]) =>
      (new GCreateNonCustodialRecipientDataBuilder()..update(updates))._build();

  _$GCreateNonCustodialRecipientData._(
      {required this.G__typename, this.createRecipient})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateNonCustodialRecipientData', 'G__typename');
  }

  @override
  GCreateNonCustodialRecipientData rebuild(
          void Function(GCreateNonCustodialRecipientDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateNonCustodialRecipientDataBuilder toBuilder() =>
      new GCreateNonCustodialRecipientDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateNonCustodialRecipientData &&
        G__typename == other.G__typename &&
        createRecipient == other.createRecipient;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, createRecipient.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateNonCustodialRecipientData')
          ..add('G__typename', G__typename)
          ..add('createRecipient', createRecipient))
        .toString();
  }
}

class GCreateNonCustodialRecipientDataBuilder
    implements
        Builder<GCreateNonCustodialRecipientData,
            GCreateNonCustodialRecipientDataBuilder> {
  _$GCreateNonCustodialRecipientData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateNonCustodialRecipientData_createRecipientBuilder? _createRecipient;
  GCreateNonCustodialRecipientData_createRecipientBuilder get createRecipient =>
      _$this._createRecipient ??=
          new GCreateNonCustodialRecipientData_createRecipientBuilder();
  set createRecipient(
          GCreateNonCustodialRecipientData_createRecipientBuilder?
              createRecipient) =>
      _$this._createRecipient = createRecipient;

  GCreateNonCustodialRecipientDataBuilder() {
    GCreateNonCustodialRecipientData._initializeBuilder(this);
  }

  GCreateNonCustodialRecipientDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createRecipient = $v.createRecipient?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateNonCustodialRecipientData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateNonCustodialRecipientData;
  }

  @override
  void update(void Function(GCreateNonCustodialRecipientDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateNonCustodialRecipientData build() => _build();

  _$GCreateNonCustodialRecipientData _build() {
    _$GCreateNonCustodialRecipientData _$result;
    try {
      _$result = _$v ??
          new _$GCreateNonCustodialRecipientData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GCreateNonCustodialRecipientData', 'G__typename'),
              createRecipient: _createRecipient?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createRecipient';
        _createRecipient?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateNonCustodialRecipientData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateNonCustodialRecipientData_createRecipient
    extends GCreateNonCustodialRecipientData_createRecipient {
  @override
  final String G__typename;
  @override
  final String? id;

  factory _$GCreateNonCustodialRecipientData_createRecipient(
          [void Function(
                  GCreateNonCustodialRecipientData_createRecipientBuilder)?
              updates]) =>
      (new GCreateNonCustodialRecipientData_createRecipientBuilder()
            ..update(updates))
          ._build();

  _$GCreateNonCustodialRecipientData_createRecipient._(
      {required this.G__typename, this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GCreateNonCustodialRecipientData_createRecipient', 'G__typename');
  }

  @override
  GCreateNonCustodialRecipientData_createRecipient rebuild(
          void Function(GCreateNonCustodialRecipientData_createRecipientBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateNonCustodialRecipientData_createRecipientBuilder toBuilder() =>
      new GCreateNonCustodialRecipientData_createRecipientBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateNonCustodialRecipientData_createRecipient &&
        G__typename == other.G__typename &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GCreateNonCustodialRecipientData_createRecipient')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GCreateNonCustodialRecipientData_createRecipientBuilder
    implements
        Builder<GCreateNonCustodialRecipientData_createRecipient,
            GCreateNonCustodialRecipientData_createRecipientBuilder> {
  _$GCreateNonCustodialRecipientData_createRecipient? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GCreateNonCustodialRecipientData_createRecipientBuilder() {
    GCreateNonCustodialRecipientData_createRecipient._initializeBuilder(this);
  }

  GCreateNonCustodialRecipientData_createRecipientBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateNonCustodialRecipientData_createRecipient other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateNonCustodialRecipientData_createRecipient;
  }

  @override
  void update(
      void Function(GCreateNonCustodialRecipientData_createRecipientBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateNonCustodialRecipientData_createRecipient build() => _build();

  _$GCreateNonCustodialRecipientData_createRecipient _build() {
    final _$result = _$v ??
        new _$GCreateNonCustodialRecipientData_createRecipient._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GCreateNonCustodialRecipientData_createRecipient',
                'G__typename'),
            id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

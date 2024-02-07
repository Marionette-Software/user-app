// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_recipient_request.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateRecipientData> _$gCreateRecipientDataSerializer =
    new _$GCreateRecipientDataSerializer();
Serializer<GCreateRecipientData_createRecipient>
    _$gCreateRecipientDataCreateRecipientSerializer =
    new _$GCreateRecipientData_createRecipientSerializer();

class _$GCreateRecipientDataSerializer
    implements StructuredSerializer<GCreateRecipientData> {
  @override
  final Iterable<Type> types = const [
    GCreateRecipientData,
    _$GCreateRecipientData
  ];
  @override
  final String wireName = 'GCreateRecipientData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateRecipientData object,
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
            specifiedType:
                const FullType(GCreateRecipientData_createRecipient)));
    }
    return result;
  }

  @override
  GCreateRecipientData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateRecipientDataBuilder();

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
                  specifiedType:
                      const FullType(GCreateRecipientData_createRecipient))!
              as GCreateRecipientData_createRecipient);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateRecipientData_createRecipientSerializer
    implements StructuredSerializer<GCreateRecipientData_createRecipient> {
  @override
  final Iterable<Type> types = const [
    GCreateRecipientData_createRecipient,
    _$GCreateRecipientData_createRecipient
  ];
  @override
  final String wireName = 'GCreateRecipientData_createRecipient';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateRecipientData_createRecipient object,
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
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GCreateRecipientData_createRecipient deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateRecipientData_createRecipientBuilder();

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
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateRecipientData extends GCreateRecipientData {
  @override
  final String G__typename;
  @override
  final GCreateRecipientData_createRecipient? createRecipient;

  factory _$GCreateRecipientData(
          [void Function(GCreateRecipientDataBuilder)? updates]) =>
      (new GCreateRecipientDataBuilder()..update(updates))._build();

  _$GCreateRecipientData._({required this.G__typename, this.createRecipient})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateRecipientData', 'G__typename');
  }

  @override
  GCreateRecipientData rebuild(
          void Function(GCreateRecipientDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateRecipientDataBuilder toBuilder() =>
      new GCreateRecipientDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateRecipientData &&
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
    return (newBuiltValueToStringHelper(r'GCreateRecipientData')
          ..add('G__typename', G__typename)
          ..add('createRecipient', createRecipient))
        .toString();
  }
}

class GCreateRecipientDataBuilder
    implements Builder<GCreateRecipientData, GCreateRecipientDataBuilder> {
  _$GCreateRecipientData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateRecipientData_createRecipientBuilder? _createRecipient;
  GCreateRecipientData_createRecipientBuilder get createRecipient =>
      _$this._createRecipient ??=
          new GCreateRecipientData_createRecipientBuilder();
  set createRecipient(
          GCreateRecipientData_createRecipientBuilder? createRecipient) =>
      _$this._createRecipient = createRecipient;

  GCreateRecipientDataBuilder() {
    GCreateRecipientData._initializeBuilder(this);
  }

  GCreateRecipientDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createRecipient = $v.createRecipient?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateRecipientData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateRecipientData;
  }

  @override
  void update(void Function(GCreateRecipientDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateRecipientData build() => _build();

  _$GCreateRecipientData _build() {
    _$GCreateRecipientData _$result;
    try {
      _$result = _$v ??
          new _$GCreateRecipientData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateRecipientData', 'G__typename'),
              createRecipient: _createRecipient?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createRecipient';
        _createRecipient?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateRecipientData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateRecipientData_createRecipient
    extends GCreateRecipientData_createRecipient {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? data;
  @override
  final String? description;

  factory _$GCreateRecipientData_createRecipient(
          [void Function(GCreateRecipientData_createRecipientBuilder)?
              updates]) =>
      (new GCreateRecipientData_createRecipientBuilder()..update(updates))
          ._build();

  _$GCreateRecipientData_createRecipient._(
      {required this.G__typename, this.id, this.data, this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateRecipientData_createRecipient', 'G__typename');
  }

  @override
  GCreateRecipientData_createRecipient rebuild(
          void Function(GCreateRecipientData_createRecipientBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateRecipientData_createRecipientBuilder toBuilder() =>
      new GCreateRecipientData_createRecipientBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateRecipientData_createRecipient &&
        G__typename == other.G__typename &&
        id == other.id &&
        data == other.data &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateRecipientData_createRecipient')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('data', data)
          ..add('description', description))
        .toString();
  }
}

class GCreateRecipientData_createRecipientBuilder
    implements
        Builder<GCreateRecipientData_createRecipient,
            GCreateRecipientData_createRecipientBuilder> {
  _$GCreateRecipientData_createRecipient? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _data;
  String? get data => _$this._data;
  set data(String? data) => _$this._data = data;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  GCreateRecipientData_createRecipientBuilder() {
    GCreateRecipientData_createRecipient._initializeBuilder(this);
  }

  GCreateRecipientData_createRecipientBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _data = $v.data;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateRecipientData_createRecipient other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateRecipientData_createRecipient;
  }

  @override
  void update(
      void Function(GCreateRecipientData_createRecipientBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateRecipientData_createRecipient build() => _build();

  _$GCreateRecipientData_createRecipient _build() {
    final _$result = _$v ??
        new _$GCreateRecipientData_createRecipient._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GCreateRecipientData_createRecipient', 'G__typename'),
            id: id,
            data: data,
            description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

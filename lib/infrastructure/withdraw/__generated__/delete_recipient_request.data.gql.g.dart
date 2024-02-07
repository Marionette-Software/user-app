// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_recipient_request.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteRecipientData> _$gDeleteRecipientDataSerializer =
    new _$GDeleteRecipientDataSerializer();

class _$GDeleteRecipientDataSerializer
    implements StructuredSerializer<GDeleteRecipientData> {
  @override
  final Iterable<Type> types = const [
    GDeleteRecipientData,
    _$GDeleteRecipientData
  ];
  @override
  final String wireName = 'GDeleteRecipientData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteRecipientData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.deleteRecipient;
    if (value != null) {
      result
        ..add('deleteRecipient')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GDeleteRecipientData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteRecipientDataBuilder();

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
        case 'deleteRecipient':
          result.deleteRecipient = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteRecipientData extends GDeleteRecipientData {
  @override
  final String G__typename;
  @override
  final String? deleteRecipient;

  factory _$GDeleteRecipientData(
          [void Function(GDeleteRecipientDataBuilder)? updates]) =>
      (new GDeleteRecipientDataBuilder()..update(updates))._build();

  _$GDeleteRecipientData._({required this.G__typename, this.deleteRecipient})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteRecipientData', 'G__typename');
  }

  @override
  GDeleteRecipientData rebuild(
          void Function(GDeleteRecipientDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteRecipientDataBuilder toBuilder() =>
      new GDeleteRecipientDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteRecipientData &&
        G__typename == other.G__typename &&
        deleteRecipient == other.deleteRecipient;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, deleteRecipient.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteRecipientData')
          ..add('G__typename', G__typename)
          ..add('deleteRecipient', deleteRecipient))
        .toString();
  }
}

class GDeleteRecipientDataBuilder
    implements Builder<GDeleteRecipientData, GDeleteRecipientDataBuilder> {
  _$GDeleteRecipientData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _deleteRecipient;
  String? get deleteRecipient => _$this._deleteRecipient;
  set deleteRecipient(String? deleteRecipient) =>
      _$this._deleteRecipient = deleteRecipient;

  GDeleteRecipientDataBuilder() {
    GDeleteRecipientData._initializeBuilder(this);
  }

  GDeleteRecipientDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deleteRecipient = $v.deleteRecipient;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteRecipientData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteRecipientData;
  }

  @override
  void update(void Function(GDeleteRecipientDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteRecipientData build() => _build();

  _$GDeleteRecipientData _build() {
    final _$result = _$v ??
        new _$GDeleteRecipientData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GDeleteRecipientData', 'G__typename'),
            deleteRecipient: deleteRecipient);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

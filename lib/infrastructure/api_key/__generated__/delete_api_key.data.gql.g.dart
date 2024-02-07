// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_api_key.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteApiKeyActionData> _$gDeleteApiKeyActionDataSerializer =
    new _$GDeleteApiKeyActionDataSerializer();

class _$GDeleteApiKeyActionDataSerializer
    implements StructuredSerializer<GDeleteApiKeyActionData> {
  @override
  final Iterable<Type> types = const [
    GDeleteApiKeyActionData,
    _$GDeleteApiKeyActionData
  ];
  @override
  final String wireName = 'GDeleteApiKeyActionData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteApiKeyActionData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.deleteApiKey;
    if (value != null) {
      result
        ..add('deleteApiKey')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GDeleteApiKeyActionData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteApiKeyActionDataBuilder();

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
        case 'deleteApiKey':
          result.deleteApiKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteApiKeyActionData extends GDeleteApiKeyActionData {
  @override
  final String G__typename;
  @override
  final String? deleteApiKey;

  factory _$GDeleteApiKeyActionData(
          [void Function(GDeleteApiKeyActionDataBuilder)? updates]) =>
      (new GDeleteApiKeyActionDataBuilder()..update(updates))._build();

  _$GDeleteApiKeyActionData._({required this.G__typename, this.deleteApiKey})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteApiKeyActionData', 'G__typename');
  }

  @override
  GDeleteApiKeyActionData rebuild(
          void Function(GDeleteApiKeyActionDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteApiKeyActionDataBuilder toBuilder() =>
      new GDeleteApiKeyActionDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteApiKeyActionData &&
        G__typename == other.G__typename &&
        deleteApiKey == other.deleteApiKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, deleteApiKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteApiKeyActionData')
          ..add('G__typename', G__typename)
          ..add('deleteApiKey', deleteApiKey))
        .toString();
  }
}

class GDeleteApiKeyActionDataBuilder
    implements
        Builder<GDeleteApiKeyActionData, GDeleteApiKeyActionDataBuilder> {
  _$GDeleteApiKeyActionData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _deleteApiKey;
  String? get deleteApiKey => _$this._deleteApiKey;
  set deleteApiKey(String? deleteApiKey) => _$this._deleteApiKey = deleteApiKey;

  GDeleteApiKeyActionDataBuilder() {
    GDeleteApiKeyActionData._initializeBuilder(this);
  }

  GDeleteApiKeyActionDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deleteApiKey = $v.deleteApiKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteApiKeyActionData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteApiKeyActionData;
  }

  @override
  void update(void Function(GDeleteApiKeyActionDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteApiKeyActionData build() => _build();

  _$GDeleteApiKeyActionData _build() {
    final _$result = _$v ??
        new _$GDeleteApiKeyActionData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GDeleteApiKeyActionData', 'G__typename'),
            deleteApiKey: deleteApiKey);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

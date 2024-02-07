// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_phone.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAddPhoneData> _$gAddPhoneDataSerializer =
    new _$GAddPhoneDataSerializer();

class _$GAddPhoneDataSerializer implements StructuredSerializer<GAddPhoneData> {
  @override
  final Iterable<Type> types = const [GAddPhoneData, _$GAddPhoneData];
  @override
  final String wireName = 'GAddPhoneData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAddPhoneData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.addPhone;
    if (value != null) {
      result
        ..add('addPhone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GAddPhoneData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddPhoneDataBuilder();

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
        case 'addPhone':
          result.addPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GAddPhoneData extends GAddPhoneData {
  @override
  final String G__typename;
  @override
  final String? addPhone;

  factory _$GAddPhoneData([void Function(GAddPhoneDataBuilder)? updates]) =>
      (new GAddPhoneDataBuilder()..update(updates))._build();

  _$GAddPhoneData._({required this.G__typename, this.addPhone}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAddPhoneData', 'G__typename');
  }

  @override
  GAddPhoneData rebuild(void Function(GAddPhoneDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAddPhoneDataBuilder toBuilder() => new GAddPhoneDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAddPhoneData &&
        G__typename == other.G__typename &&
        addPhone == other.addPhone;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, addPhone.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAddPhoneData')
          ..add('G__typename', G__typename)
          ..add('addPhone', addPhone))
        .toString();
  }
}

class GAddPhoneDataBuilder
    implements Builder<GAddPhoneData, GAddPhoneDataBuilder> {
  _$GAddPhoneData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _addPhone;
  String? get addPhone => _$this._addPhone;
  set addPhone(String? addPhone) => _$this._addPhone = addPhone;

  GAddPhoneDataBuilder() {
    GAddPhoneData._initializeBuilder(this);
  }

  GAddPhoneDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _addPhone = $v.addPhone;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddPhoneData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAddPhoneData;
  }

  @override
  void update(void Function(GAddPhoneDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAddPhoneData build() => _build();

  _$GAddPhoneData _build() {
    final _$result = _$v ??
        new _$GAddPhoneData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GAddPhoneData', 'G__typename'),
            addPhone: addPhone);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_2fa.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GRequest2FAData> _$gRequest2FADataSerializer =
    new _$GRequest2FADataSerializer();

class _$GRequest2FADataSerializer
    implements StructuredSerializer<GRequest2FAData> {
  @override
  final Iterable<Type> types = const [GRequest2FAData, _$GRequest2FAData];
  @override
  final String wireName = 'GRequest2FAData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GRequest2FAData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.request2FA;
    if (value != null) {
      result
        ..add('request2FA')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GRequest2FAData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRequest2FADataBuilder();

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
        case 'request2FA':
          result.request2FA = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GRequest2FAData extends GRequest2FAData {
  @override
  final String G__typename;
  @override
  final String? request2FA;

  factory _$GRequest2FAData([void Function(GRequest2FADataBuilder)? updates]) =>
      (new GRequest2FADataBuilder()..update(updates))._build();

  _$GRequest2FAData._({required this.G__typename, this.request2FA})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GRequest2FAData', 'G__typename');
  }

  @override
  GRequest2FAData rebuild(void Function(GRequest2FADataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRequest2FADataBuilder toBuilder() =>
      new GRequest2FADataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRequest2FAData &&
        G__typename == other.G__typename &&
        request2FA == other.request2FA;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, request2FA.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GRequest2FAData')
          ..add('G__typename', G__typename)
          ..add('request2FA', request2FA))
        .toString();
  }
}

class GRequest2FADataBuilder
    implements Builder<GRequest2FAData, GRequest2FADataBuilder> {
  _$GRequest2FAData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _request2FA;
  String? get request2FA => _$this._request2FA;
  set request2FA(String? request2FA) => _$this._request2FA = request2FA;

  GRequest2FADataBuilder() {
    GRequest2FAData._initializeBuilder(this);
  }

  GRequest2FADataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _request2FA = $v.request2FA;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRequest2FAData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRequest2FAData;
  }

  @override
  void update(void Function(GRequest2FADataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GRequest2FAData build() => _build();

  _$GRequest2FAData _build() {
    final _$result = _$v ??
        new _$GRequest2FAData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GRequest2FAData', 'G__typename'),
            request2FA: request2FA);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

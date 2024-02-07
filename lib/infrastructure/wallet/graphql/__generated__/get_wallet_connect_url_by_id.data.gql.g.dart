// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_wallet_connect_url_by_id.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GgetWalletConnectURIByIdData>
    _$ggetWalletConnectURIByIdDataSerializer =
    new _$GgetWalletConnectURIByIdDataSerializer();

class _$GgetWalletConnectURIByIdDataSerializer
    implements StructuredSerializer<GgetWalletConnectURIByIdData> {
  @override
  final Iterable<Type> types = const [
    GgetWalletConnectURIByIdData,
    _$GgetWalletConnectURIByIdData
  ];
  @override
  final String wireName = 'GgetWalletConnectURIByIdData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GgetWalletConnectURIByIdData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.getWalletConnectURI;
    if (value != null) {
      result
        ..add('getWalletConnectURI')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GgetWalletConnectURIByIdData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetWalletConnectURIByIdDataBuilder();

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
        case 'getWalletConnectURI':
          result.getWalletConnectURI = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GgetWalletConnectURIByIdData extends GgetWalletConnectURIByIdData {
  @override
  final String G__typename;
  @override
  final String? getWalletConnectURI;

  factory _$GgetWalletConnectURIByIdData(
          [void Function(GgetWalletConnectURIByIdDataBuilder)? updates]) =>
      (new GgetWalletConnectURIByIdDataBuilder()..update(updates))._build();

  _$GgetWalletConnectURIByIdData._(
      {required this.G__typename, this.getWalletConnectURI})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GgetWalletConnectURIByIdData', 'G__typename');
  }

  @override
  GgetWalletConnectURIByIdData rebuild(
          void Function(GgetWalletConnectURIByIdDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetWalletConnectURIByIdDataBuilder toBuilder() =>
      new GgetWalletConnectURIByIdDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetWalletConnectURIByIdData &&
        G__typename == other.G__typename &&
        getWalletConnectURI == other.getWalletConnectURI;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, getWalletConnectURI.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GgetWalletConnectURIByIdData')
          ..add('G__typename', G__typename)
          ..add('getWalletConnectURI', getWalletConnectURI))
        .toString();
  }
}

class GgetWalletConnectURIByIdDataBuilder
    implements
        Builder<GgetWalletConnectURIByIdData,
            GgetWalletConnectURIByIdDataBuilder> {
  _$GgetWalletConnectURIByIdData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _getWalletConnectURI;
  String? get getWalletConnectURI => _$this._getWalletConnectURI;
  set getWalletConnectURI(String? getWalletConnectURI) =>
      _$this._getWalletConnectURI = getWalletConnectURI;

  GgetWalletConnectURIByIdDataBuilder() {
    GgetWalletConnectURIByIdData._initializeBuilder(this);
  }

  GgetWalletConnectURIByIdDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _getWalletConnectURI = $v.getWalletConnectURI;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetWalletConnectURIByIdData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetWalletConnectURIByIdData;
  }

  @override
  void update(void Function(GgetWalletConnectURIByIdDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetWalletConnectURIByIdData build() => _build();

  _$GgetWalletConnectURIByIdData _build() {
    final _$result = _$v ??
        new _$GgetWalletConnectURIByIdData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GgetWalletConnectURIByIdData', 'G__typename'),
            getWalletConnectURI: getWalletConnectURI);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_favorite_currency.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSetFavoriteWalletData> _$gSetFavoriteWalletDataSerializer =
    new _$GSetFavoriteWalletDataSerializer();

class _$GSetFavoriteWalletDataSerializer
    implements StructuredSerializer<GSetFavoriteWalletData> {
  @override
  final Iterable<Type> types = const [
    GSetFavoriteWalletData,
    _$GSetFavoriteWalletData
  ];
  @override
  final String wireName = 'GSetFavoriteWalletData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSetFavoriteWalletData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.setFavoriteCurrency;
    if (value != null) {
      result
        ..add('setFavoriteCurrency')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GSetFavoriteWalletData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSetFavoriteWalletDataBuilder();

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
        case 'setFavoriteCurrency':
          result.setFavoriteCurrency = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GSetFavoriteWalletData extends GSetFavoriteWalletData {
  @override
  final String G__typename;
  @override
  final bool? setFavoriteCurrency;

  factory _$GSetFavoriteWalletData(
          [void Function(GSetFavoriteWalletDataBuilder)? updates]) =>
      (new GSetFavoriteWalletDataBuilder()..update(updates))._build();

  _$GSetFavoriteWalletData._(
      {required this.G__typename, this.setFavoriteCurrency})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GSetFavoriteWalletData', 'G__typename');
  }

  @override
  GSetFavoriteWalletData rebuild(
          void Function(GSetFavoriteWalletDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSetFavoriteWalletDataBuilder toBuilder() =>
      new GSetFavoriteWalletDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSetFavoriteWalletData &&
        G__typename == other.G__typename &&
        setFavoriteCurrency == other.setFavoriteCurrency;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, setFavoriteCurrency.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSetFavoriteWalletData')
          ..add('G__typename', G__typename)
          ..add('setFavoriteCurrency', setFavoriteCurrency))
        .toString();
  }
}

class GSetFavoriteWalletDataBuilder
    implements Builder<GSetFavoriteWalletData, GSetFavoriteWalletDataBuilder> {
  _$GSetFavoriteWalletData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _setFavoriteCurrency;
  bool? get setFavoriteCurrency => _$this._setFavoriteCurrency;
  set setFavoriteCurrency(bool? setFavoriteCurrency) =>
      _$this._setFavoriteCurrency = setFavoriteCurrency;

  GSetFavoriteWalletDataBuilder() {
    GSetFavoriteWalletData._initializeBuilder(this);
  }

  GSetFavoriteWalletDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _setFavoriteCurrency = $v.setFavoriteCurrency;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSetFavoriteWalletData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSetFavoriteWalletData;
  }

  @override
  void update(void Function(GSetFavoriteWalletDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSetFavoriteWalletData build() => _build();

  _$GSetFavoriteWalletData _build() {
    final _$result = _$v ??
        new _$GSetFavoriteWalletData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GSetFavoriteWalletData', 'G__typename'),
            setFavoriteCurrency: setFavoriteCurrency);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_favorite_currency.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSetFavoriteWalletVars> _$gSetFavoriteWalletVarsSerializer =
    new _$GSetFavoriteWalletVarsSerializer();

class _$GSetFavoriteWalletVarsSerializer
    implements StructuredSerializer<GSetFavoriteWalletVars> {
  @override
  final Iterable<Type> types = const [
    GSetFavoriteWalletVars,
    _$GSetFavoriteWalletVars
  ];
  @override
  final String wireName = 'GSetFavoriteWalletVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSetFavoriteWalletVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'currencyId',
      serializers.serialize(object.currencyId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GSetFavoriteWalletVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSetFavoriteWalletVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'currencyId':
          result.currencyId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GSetFavoriteWalletVars extends GSetFavoriteWalletVars {
  @override
  final String currencyId;

  factory _$GSetFavoriteWalletVars(
          [void Function(GSetFavoriteWalletVarsBuilder)? updates]) =>
      (new GSetFavoriteWalletVarsBuilder()..update(updates))._build();

  _$GSetFavoriteWalletVars._({required this.currencyId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        currencyId, r'GSetFavoriteWalletVars', 'currencyId');
  }

  @override
  GSetFavoriteWalletVars rebuild(
          void Function(GSetFavoriteWalletVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSetFavoriteWalletVarsBuilder toBuilder() =>
      new GSetFavoriteWalletVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSetFavoriteWalletVars && currencyId == other.currencyId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currencyId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSetFavoriteWalletVars')
          ..add('currencyId', currencyId))
        .toString();
  }
}

class GSetFavoriteWalletVarsBuilder
    implements Builder<GSetFavoriteWalletVars, GSetFavoriteWalletVarsBuilder> {
  _$GSetFavoriteWalletVars? _$v;

  String? _currencyId;
  String? get currencyId => _$this._currencyId;
  set currencyId(String? currencyId) => _$this._currencyId = currencyId;

  GSetFavoriteWalletVarsBuilder();

  GSetFavoriteWalletVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyId = $v.currencyId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSetFavoriteWalletVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSetFavoriteWalletVars;
  }

  @override
  void update(void Function(GSetFavoriteWalletVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSetFavoriteWalletVars build() => _build();

  _$GSetFavoriteWalletVars _build() {
    final _$result = _$v ??
        new _$GSetFavoriteWalletVars._(
            currencyId: BuiltValueNullFieldError.checkNotNull(
                currencyId, r'GSetFavoriteWalletVars', 'currencyId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

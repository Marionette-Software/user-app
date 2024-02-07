// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallets_data.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTradeWalletsDataVars> _$gTradeWalletsDataVarsSerializer =
    new _$GTradeWalletsDataVarsSerializer();

class _$GTradeWalletsDataVarsSerializer
    implements StructuredSerializer<GTradeWalletsDataVars> {
  @override
  final Iterable<Type> types = const [
    GTradeWalletsDataVars,
    _$GTradeWalletsDataVars
  ];
  @override
  final String wireName = 'GTradeWalletsDataVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GTradeWalletsDataVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
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
  GTradeWalletsDataVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTradeWalletsDataVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GTradeWalletsDataVars extends GTradeWalletsDataVars {
  @override
  final String? id;

  factory _$GTradeWalletsDataVars(
          [void Function(GTradeWalletsDataVarsBuilder)? updates]) =>
      (new GTradeWalletsDataVarsBuilder()..update(updates))._build();

  _$GTradeWalletsDataVars._({this.id}) : super._();

  @override
  GTradeWalletsDataVars rebuild(
          void Function(GTradeWalletsDataVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTradeWalletsDataVarsBuilder toBuilder() =>
      new GTradeWalletsDataVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTradeWalletsDataVars && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTradeWalletsDataVars')
          ..add('id', id))
        .toString();
  }
}

class GTradeWalletsDataVarsBuilder
    implements Builder<GTradeWalletsDataVars, GTradeWalletsDataVarsBuilder> {
  _$GTradeWalletsDataVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GTradeWalletsDataVarsBuilder();

  GTradeWalletsDataVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTradeWalletsDataVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTradeWalletsDataVars;
  }

  @override
  void update(void Function(GTradeWalletsDataVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTradeWalletsDataVars build() => _build();

  _$GTradeWalletsDataVars _build() {
    final _$result = _$v ?? new _$GTradeWalletsDataVars._(id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

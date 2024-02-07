// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_wallets.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetUserWalletsVars> _$gGetUserWalletsVarsSerializer =
    new _$GGetUserWalletsVarsSerializer();

class _$GGetUserWalletsVarsSerializer
    implements StructuredSerializer<GGetUserWalletsVars> {
  @override
  final Iterable<Type> types = const [
    GGetUserWalletsVars,
    _$GGetUserWalletsVars
  ];
  @override
  final String wireName = 'GGetUserWalletsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserWalletsVars object,
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
  GGetUserWalletsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserWalletsVarsBuilder();

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

class _$GGetUserWalletsVars extends GGetUserWalletsVars {
  @override
  final String? id;

  factory _$GGetUserWalletsVars(
          [void Function(GGetUserWalletsVarsBuilder)? updates]) =>
      (new GGetUserWalletsVarsBuilder()..update(updates))._build();

  _$GGetUserWalletsVars._({this.id}) : super._();

  @override
  GGetUserWalletsVars rebuild(
          void Function(GGetUserWalletsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserWalletsVarsBuilder toBuilder() =>
      new GGetUserWalletsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserWalletsVars && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GGetUserWalletsVars')..add('id', id))
        .toString();
  }
}

class GGetUserWalletsVarsBuilder
    implements Builder<GGetUserWalletsVars, GGetUserWalletsVarsBuilder> {
  _$GGetUserWalletsVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GGetUserWalletsVarsBuilder();

  GGetUserWalletsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserWalletsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserWalletsVars;
  }

  @override
  void update(void Function(GGetUserWalletsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserWalletsVars build() => _build();

  _$GGetUserWalletsVars _build() {
    final _$result = _$v ?? new _$GGetUserWalletsVars._(id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

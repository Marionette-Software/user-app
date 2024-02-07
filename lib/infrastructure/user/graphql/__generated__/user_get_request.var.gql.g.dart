// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_get_request.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetUpdateUserVars> _$gGetUpdateUserVarsSerializer =
    new _$GGetUpdateUserVarsSerializer();

class _$GGetUpdateUserVarsSerializer
    implements StructuredSerializer<GGetUpdateUserVars> {
  @override
  final Iterable<Type> types = const [GGetUpdateUserVars, _$GGetUpdateUserVars];
  @override
  final String wireName = 'GGetUpdateUserVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUpdateUserVars object,
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
  GGetUpdateUserVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUpdateUserVarsBuilder();

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

class _$GGetUpdateUserVars extends GGetUpdateUserVars {
  @override
  final String? id;

  factory _$GGetUpdateUserVars(
          [void Function(GGetUpdateUserVarsBuilder)? updates]) =>
      (new GGetUpdateUserVarsBuilder()..update(updates))._build();

  _$GGetUpdateUserVars._({this.id}) : super._();

  @override
  GGetUpdateUserVars rebuild(
          void Function(GGetUpdateUserVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUpdateUserVarsBuilder toBuilder() =>
      new GGetUpdateUserVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUpdateUserVars && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GGetUpdateUserVars')..add('id', id))
        .toString();
  }
}

class GGetUpdateUserVarsBuilder
    implements Builder<GGetUpdateUserVars, GGetUpdateUserVarsBuilder> {
  _$GGetUpdateUserVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GGetUpdateUserVarsBuilder();

  GGetUpdateUserVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUpdateUserVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUpdateUserVars;
  }

  @override
  void update(void Function(GGetUpdateUserVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUpdateUserVars build() => _build();

  _$GGetUpdateUserVars _build() {
    final _$result = _$v ?? new _$GGetUpdateUserVars._(id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

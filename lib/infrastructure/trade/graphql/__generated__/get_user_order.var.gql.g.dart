// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_order.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetUserOrderVars> _$gGetUserOrderVarsSerializer =
    new _$GGetUserOrderVarsSerializer();

class _$GGetUserOrderVarsSerializer
    implements StructuredSerializer<GGetUserOrderVars> {
  @override
  final Iterable<Type> types = const [GGetUserOrderVars, _$GGetUserOrderVars];
  @override
  final String wireName = 'GGetUserOrderVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetUserOrderVars object,
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
  GGetUserOrderVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserOrderVarsBuilder();

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

class _$GGetUserOrderVars extends GGetUserOrderVars {
  @override
  final String? id;

  factory _$GGetUserOrderVars(
          [void Function(GGetUserOrderVarsBuilder)? updates]) =>
      (new GGetUserOrderVarsBuilder()..update(updates))._build();

  _$GGetUserOrderVars._({this.id}) : super._();

  @override
  GGetUserOrderVars rebuild(void Function(GGetUserOrderVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserOrderVarsBuilder toBuilder() =>
      new GGetUserOrderVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserOrderVars && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GGetUserOrderVars')..add('id', id))
        .toString();
  }
}

class GGetUserOrderVarsBuilder
    implements Builder<GGetUserOrderVars, GGetUserOrderVarsBuilder> {
  _$GGetUserOrderVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GGetUserOrderVarsBuilder();

  GGetUserOrderVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserOrderVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserOrderVars;
  }

  @override
  void update(void Function(GGetUserOrderVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserOrderVars build() => _build();

  _$GGetUserOrderVars _build() {
    final _$result = _$v ?? new _$GGetUserOrderVars._(id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

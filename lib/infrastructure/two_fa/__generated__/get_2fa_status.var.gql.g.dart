// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_2fa_status.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGet2FaStatusVars> _$gGet2FaStatusVarsSerializer =
    new _$GGet2FaStatusVarsSerializer();

class _$GGet2FaStatusVarsSerializer
    implements StructuredSerializer<GGet2FaStatusVars> {
  @override
  final Iterable<Type> types = const [GGet2FaStatusVars, _$GGet2FaStatusVars];
  @override
  final String wireName = 'GGet2FaStatusVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGet2FaStatusVars object,
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
  GGet2FaStatusVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGet2FaStatusVarsBuilder();

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

class _$GGet2FaStatusVars extends GGet2FaStatusVars {
  @override
  final String? id;

  factory _$GGet2FaStatusVars(
          [void Function(GGet2FaStatusVarsBuilder)? updates]) =>
      (new GGet2FaStatusVarsBuilder()..update(updates))._build();

  _$GGet2FaStatusVars._({this.id}) : super._();

  @override
  GGet2FaStatusVars rebuild(void Function(GGet2FaStatusVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGet2FaStatusVarsBuilder toBuilder() =>
      new GGet2FaStatusVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGet2FaStatusVars && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GGet2FaStatusVars')..add('id', id))
        .toString();
  }
}

class GGet2FaStatusVarsBuilder
    implements Builder<GGet2FaStatusVars, GGet2FaStatusVarsBuilder> {
  _$GGet2FaStatusVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GGet2FaStatusVarsBuilder();

  GGet2FaStatusVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGet2FaStatusVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGet2FaStatusVars;
  }

  @override
  void update(void Function(GGet2FaStatusVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGet2FaStatusVars build() => _build();

  _$GGet2FaStatusVars _build() {
    final _$result = _$v ?? new _$GGet2FaStatusVars._(id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

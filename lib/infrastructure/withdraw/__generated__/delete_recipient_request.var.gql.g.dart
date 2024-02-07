// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_recipient_request.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteRecipientVars> _$gDeleteRecipientVarsSerializer =
    new _$GDeleteRecipientVarsSerializer();

class _$GDeleteRecipientVarsSerializer
    implements StructuredSerializer<GDeleteRecipientVars> {
  @override
  final Iterable<Type> types = const [
    GDeleteRecipientVars,
    _$GDeleteRecipientVars
  ];
  @override
  final String wireName = 'GDeleteRecipientVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteRecipientVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GDeleteRecipientVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteRecipientVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteRecipientVars extends GDeleteRecipientVars {
  @override
  final String id;

  factory _$GDeleteRecipientVars(
          [void Function(GDeleteRecipientVarsBuilder)? updates]) =>
      (new GDeleteRecipientVarsBuilder()..update(updates))._build();

  _$GDeleteRecipientVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GDeleteRecipientVars', 'id');
  }

  @override
  GDeleteRecipientVars rebuild(
          void Function(GDeleteRecipientVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteRecipientVarsBuilder toBuilder() =>
      new GDeleteRecipientVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteRecipientVars && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GDeleteRecipientVars')..add('id', id))
        .toString();
  }
}

class GDeleteRecipientVarsBuilder
    implements Builder<GDeleteRecipientVars, GDeleteRecipientVarsBuilder> {
  _$GDeleteRecipientVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GDeleteRecipientVarsBuilder();

  GDeleteRecipientVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteRecipientVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteRecipientVars;
  }

  @override
  void update(void Function(GDeleteRecipientVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteRecipientVars build() => _build();

  _$GDeleteRecipientVars _build() {
    final _$result = _$v ??
        new _$GDeleteRecipientVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDeleteRecipientVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

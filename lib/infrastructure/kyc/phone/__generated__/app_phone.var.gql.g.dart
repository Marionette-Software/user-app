// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_phone.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAddPhoneVars> _$gAddPhoneVarsSerializer =
    new _$GAddPhoneVarsSerializer();

class _$GAddPhoneVarsSerializer implements StructuredSerializer<GAddPhoneVars> {
  @override
  final Iterable<Type> types = const [GAddPhoneVars, _$GAddPhoneVars];
  @override
  final String wireName = 'GAddPhoneVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAddPhoneVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GAddPhoneVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddPhoneVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAddPhoneVars extends GAddPhoneVars {
  @override
  final String phone;

  factory _$GAddPhoneVars([void Function(GAddPhoneVarsBuilder)? updates]) =>
      (new GAddPhoneVarsBuilder()..update(updates))._build();

  _$GAddPhoneVars._({required this.phone}) : super._() {
    BuiltValueNullFieldError.checkNotNull(phone, r'GAddPhoneVars', 'phone');
  }

  @override
  GAddPhoneVars rebuild(void Function(GAddPhoneVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAddPhoneVarsBuilder toBuilder() => new GAddPhoneVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAddPhoneVars && phone == other.phone;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAddPhoneVars')..add('phone', phone))
        .toString();
  }
}

class GAddPhoneVarsBuilder
    implements Builder<GAddPhoneVars, GAddPhoneVarsBuilder> {
  _$GAddPhoneVars? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  GAddPhoneVarsBuilder();

  GAddPhoneVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddPhoneVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAddPhoneVars;
  }

  @override
  void update(void Function(GAddPhoneVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAddPhoneVars build() => _build();

  _$GAddPhoneVars _build() {
    final _$result = _$v ??
        new _$GAddPhoneVars._(
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, r'GAddPhoneVars', 'phone'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

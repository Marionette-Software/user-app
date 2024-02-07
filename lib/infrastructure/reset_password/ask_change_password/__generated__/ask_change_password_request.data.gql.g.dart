// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_change_password_request.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAskChangePasswordData> _$gAskChangePasswordDataSerializer =
    new _$GAskChangePasswordDataSerializer();

class _$GAskChangePasswordDataSerializer
    implements StructuredSerializer<GAskChangePasswordData> {
  @override
  final Iterable<Type> types = const [
    GAskChangePasswordData,
    _$GAskChangePasswordData
  ];
  @override
  final String wireName = 'GAskChangePasswordData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAskChangePasswordData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.askChangePassword;
    if (value != null) {
      result
        ..add('askChangePassword')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GAskChangePasswordData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAskChangePasswordDataBuilder();

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
        case 'askChangePassword':
          result.askChangePassword = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GAskChangePasswordData extends GAskChangePasswordData {
  @override
  final String G__typename;
  @override
  final String? askChangePassword;

  factory _$GAskChangePasswordData(
          [void Function(GAskChangePasswordDataBuilder)? updates]) =>
      (new GAskChangePasswordDataBuilder()..update(updates))._build();

  _$GAskChangePasswordData._(
      {required this.G__typename, this.askChangePassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAskChangePasswordData', 'G__typename');
  }

  @override
  GAskChangePasswordData rebuild(
          void Function(GAskChangePasswordDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAskChangePasswordDataBuilder toBuilder() =>
      new GAskChangePasswordDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAskChangePasswordData &&
        G__typename == other.G__typename &&
        askChangePassword == other.askChangePassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, askChangePassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAskChangePasswordData')
          ..add('G__typename', G__typename)
          ..add('askChangePassword', askChangePassword))
        .toString();
  }
}

class GAskChangePasswordDataBuilder
    implements Builder<GAskChangePasswordData, GAskChangePasswordDataBuilder> {
  _$GAskChangePasswordData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _askChangePassword;
  String? get askChangePassword => _$this._askChangePassword;
  set askChangePassword(String? askChangePassword) =>
      _$this._askChangePassword = askChangePassword;

  GAskChangePasswordDataBuilder() {
    GAskChangePasswordData._initializeBuilder(this);
  }

  GAskChangePasswordDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _askChangePassword = $v.askChangePassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAskChangePasswordData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAskChangePasswordData;
  }

  @override
  void update(void Function(GAskChangePasswordDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAskChangePasswordData build() => _build();

  _$GAskChangePasswordData _build() {
    final _$result = _$v ??
        new _$GAskChangePasswordData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GAskChangePasswordData', 'G__typename'),
            askChangePassword: askChangePassword);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

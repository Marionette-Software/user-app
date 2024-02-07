// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_withdraw_request.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateWithdrawalData> _$gCreateWithdrawalDataSerializer =
    new _$GCreateWithdrawalDataSerializer();

class _$GCreateWithdrawalDataSerializer
    implements StructuredSerializer<GCreateWithdrawalData> {
  @override
  final Iterable<Type> types = const [
    GCreateWithdrawalData,
    _$GCreateWithdrawalData
  ];
  @override
  final String wireName = 'GCreateWithdrawalData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateWithdrawalData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.userWithdraw;
    if (value != null) {
      result
        ..add('userWithdraw')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GCreateWithdrawalData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWithdrawalDataBuilder();

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
        case 'userWithdraw':
          result.userWithdraw = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateWithdrawalData extends GCreateWithdrawalData {
  @override
  final String G__typename;
  @override
  final String? userWithdraw;

  factory _$GCreateWithdrawalData(
          [void Function(GCreateWithdrawalDataBuilder)? updates]) =>
      (new GCreateWithdrawalDataBuilder()..update(updates))._build();

  _$GCreateWithdrawalData._({required this.G__typename, this.userWithdraw})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateWithdrawalData', 'G__typename');
  }

  @override
  GCreateWithdrawalData rebuild(
          void Function(GCreateWithdrawalDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWithdrawalDataBuilder toBuilder() =>
      new GCreateWithdrawalDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWithdrawalData &&
        G__typename == other.G__typename &&
        userWithdraw == other.userWithdraw;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, userWithdraw.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateWithdrawalData')
          ..add('G__typename', G__typename)
          ..add('userWithdraw', userWithdraw))
        .toString();
  }
}

class GCreateWithdrawalDataBuilder
    implements Builder<GCreateWithdrawalData, GCreateWithdrawalDataBuilder> {
  _$GCreateWithdrawalData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _userWithdraw;
  String? get userWithdraw => _$this._userWithdraw;
  set userWithdraw(String? userWithdraw) => _$this._userWithdraw = userWithdraw;

  GCreateWithdrawalDataBuilder() {
    GCreateWithdrawalData._initializeBuilder(this);
  }

  GCreateWithdrawalDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userWithdraw = $v.userWithdraw;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWithdrawalData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWithdrawalData;
  }

  @override
  void update(void Function(GCreateWithdrawalDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWithdrawalData build() => _build();

  _$GCreateWithdrawalData _build() {
    final _$result = _$v ??
        new _$GCreateWithdrawalData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GCreateWithdrawalData', 'G__typename'),
            userWithdraw: userWithdraw);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

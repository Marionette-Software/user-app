// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custodial_exchange_request.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserExchangeData> _$gUserExchangeDataSerializer =
    new _$GUserExchangeDataSerializer();

class _$GUserExchangeDataSerializer
    implements StructuredSerializer<GUserExchangeData> {
  @override
  final Iterable<Type> types = const [GUserExchangeData, _$GUserExchangeData];
  @override
  final String wireName = 'GUserExchangeData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserExchangeData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.userExchange;
    if (value != null) {
      result
        ..add('userExchange')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GUserExchangeData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserExchangeDataBuilder();

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
        case 'userExchange':
          result.userExchange = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserExchangeData extends GUserExchangeData {
  @override
  final String G__typename;
  @override
  final String? userExchange;

  factory _$GUserExchangeData(
          [void Function(GUserExchangeDataBuilder)? updates]) =>
      (new GUserExchangeDataBuilder()..update(updates))._build();

  _$GUserExchangeData._({required this.G__typename, this.userExchange})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserExchangeData', 'G__typename');
  }

  @override
  GUserExchangeData rebuild(void Function(GUserExchangeDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserExchangeDataBuilder toBuilder() =>
      new GUserExchangeDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserExchangeData &&
        G__typename == other.G__typename &&
        userExchange == other.userExchange;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, userExchange.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserExchangeData')
          ..add('G__typename', G__typename)
          ..add('userExchange', userExchange))
        .toString();
  }
}

class GUserExchangeDataBuilder
    implements Builder<GUserExchangeData, GUserExchangeDataBuilder> {
  _$GUserExchangeData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _userExchange;
  String? get userExchange => _$this._userExchange;
  set userExchange(String? userExchange) => _$this._userExchange = userExchange;

  GUserExchangeDataBuilder() {
    GUserExchangeData._initializeBuilder(this);
  }

  GUserExchangeDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userExchange = $v.userExchange;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserExchangeData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserExchangeData;
  }

  @override
  void update(void Function(GUserExchangeDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserExchangeData build() => _build();

  _$GUserExchangeData _build() {
    final _$result = _$v ??
        new _$GUserExchangeData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GUserExchangeData', 'G__typename'),
            userExchange: userExchange);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

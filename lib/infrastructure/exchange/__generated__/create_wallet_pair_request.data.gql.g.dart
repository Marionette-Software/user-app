// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_pair_request.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GInitiateNonCustodianExchangeData>
    _$gInitiateNonCustodianExchangeDataSerializer =
    new _$GInitiateNonCustodianExchangeDataSerializer();

class _$GInitiateNonCustodianExchangeDataSerializer
    implements StructuredSerializer<GInitiateNonCustodianExchangeData> {
  @override
  final Iterable<Type> types = const [
    GInitiateNonCustodianExchangeData,
    _$GInitiateNonCustodianExchangeData
  ];
  @override
  final String wireName = 'GInitiateNonCustodianExchangeData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GInitiateNonCustodianExchangeData object,
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
  GInitiateNonCustodianExchangeData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInitiateNonCustodianExchangeDataBuilder();

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

class _$GInitiateNonCustodianExchangeData
    extends GInitiateNonCustodianExchangeData {
  @override
  final String G__typename;
  @override
  final String? userExchange;

  factory _$GInitiateNonCustodianExchangeData(
          [void Function(GInitiateNonCustodianExchangeDataBuilder)? updates]) =>
      (new GInitiateNonCustodianExchangeDataBuilder()..update(updates))
          ._build();

  _$GInitiateNonCustodianExchangeData._(
      {required this.G__typename, this.userExchange})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GInitiateNonCustodianExchangeData', 'G__typename');
  }

  @override
  GInitiateNonCustodianExchangeData rebuild(
          void Function(GInitiateNonCustodianExchangeDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInitiateNonCustodianExchangeDataBuilder toBuilder() =>
      new GInitiateNonCustodianExchangeDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInitiateNonCustodianExchangeData &&
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
    return (newBuiltValueToStringHelper(r'GInitiateNonCustodianExchangeData')
          ..add('G__typename', G__typename)
          ..add('userExchange', userExchange))
        .toString();
  }
}

class GInitiateNonCustodianExchangeDataBuilder
    implements
        Builder<GInitiateNonCustodianExchangeData,
            GInitiateNonCustodianExchangeDataBuilder> {
  _$GInitiateNonCustodianExchangeData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _userExchange;
  String? get userExchange => _$this._userExchange;
  set userExchange(String? userExchange) => _$this._userExchange = userExchange;

  GInitiateNonCustodianExchangeDataBuilder() {
    GInitiateNonCustodianExchangeData._initializeBuilder(this);
  }

  GInitiateNonCustodianExchangeDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userExchange = $v.userExchange;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInitiateNonCustodianExchangeData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInitiateNonCustodianExchangeData;
  }

  @override
  void update(
      void Function(GInitiateNonCustodianExchangeDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GInitiateNonCustodianExchangeData build() => _build();

  _$GInitiateNonCustodianExchangeData _build() {
    final _$result = _$v ??
        new _$GInitiateNonCustodianExchangeData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GInitiateNonCustodianExchangeData', 'G__typename'),
            userExchange: userExchange);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

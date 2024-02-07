// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_user_direct_deposit.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GsendUserDirectDepositData> _$gsendUserDirectDepositDataSerializer =
    new _$GsendUserDirectDepositDataSerializer();

class _$GsendUserDirectDepositDataSerializer
    implements StructuredSerializer<GsendUserDirectDepositData> {
  @override
  final Iterable<Type> types = const [
    GsendUserDirectDepositData,
    _$GsendUserDirectDepositData
  ];
  @override
  final String wireName = 'GsendUserDirectDepositData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GsendUserDirectDepositData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.userDirectDeposit;
    if (value != null) {
      result
        ..add('userDirectDeposit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GsendUserDirectDepositData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GsendUserDirectDepositDataBuilder();

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
        case 'userDirectDeposit':
          result.userDirectDeposit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GsendUserDirectDepositData extends GsendUserDirectDepositData {
  @override
  final String G__typename;
  @override
  final String? userDirectDeposit;

  factory _$GsendUserDirectDepositData(
          [void Function(GsendUserDirectDepositDataBuilder)? updates]) =>
      (new GsendUserDirectDepositDataBuilder()..update(updates))._build();

  _$GsendUserDirectDepositData._(
      {required this.G__typename, this.userDirectDeposit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GsendUserDirectDepositData', 'G__typename');
  }

  @override
  GsendUserDirectDepositData rebuild(
          void Function(GsendUserDirectDepositDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GsendUserDirectDepositDataBuilder toBuilder() =>
      new GsendUserDirectDepositDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GsendUserDirectDepositData &&
        G__typename == other.G__typename &&
        userDirectDeposit == other.userDirectDeposit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, userDirectDeposit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GsendUserDirectDepositData')
          ..add('G__typename', G__typename)
          ..add('userDirectDeposit', userDirectDeposit))
        .toString();
  }
}

class GsendUserDirectDepositDataBuilder
    implements
        Builder<GsendUserDirectDepositData, GsendUserDirectDepositDataBuilder> {
  _$GsendUserDirectDepositData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _userDirectDeposit;
  String? get userDirectDeposit => _$this._userDirectDeposit;
  set userDirectDeposit(String? userDirectDeposit) =>
      _$this._userDirectDeposit = userDirectDeposit;

  GsendUserDirectDepositDataBuilder() {
    GsendUserDirectDepositData._initializeBuilder(this);
  }

  GsendUserDirectDepositDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userDirectDeposit = $v.userDirectDeposit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GsendUserDirectDepositData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GsendUserDirectDepositData;
  }

  @override
  void update(void Function(GsendUserDirectDepositDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GsendUserDirectDepositData build() => _build();

  _$GsendUserDirectDepositData _build() {
    final _$result = _$v ??
        new _$GsendUserDirectDepositData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GsendUserDirectDepositData', 'G__typename'),
            userDirectDeposit: userDirectDeposit);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

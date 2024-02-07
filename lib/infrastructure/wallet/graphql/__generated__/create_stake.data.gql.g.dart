// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_stake.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateCurrencyStateData> _$gCreateCurrencyStateDataSerializer =
    new _$GCreateCurrencyStateDataSerializer();

class _$GCreateCurrencyStateDataSerializer
    implements StructuredSerializer<GCreateCurrencyStateData> {
  @override
  final Iterable<Type> types = const [
    GCreateCurrencyStateData,
    _$GCreateCurrencyStateData
  ];
  @override
  final String wireName = 'GCreateCurrencyStateData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateCurrencyStateData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.createStake;
    if (value != null) {
      result
        ..add('createStake')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GCreateCurrencyStateData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateCurrencyStateDataBuilder();

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
        case 'createStake':
          result.createStake = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateCurrencyStateData extends GCreateCurrencyStateData {
  @override
  final String G__typename;
  @override
  final String? createStake;

  factory _$GCreateCurrencyStateData(
          [void Function(GCreateCurrencyStateDataBuilder)? updates]) =>
      (new GCreateCurrencyStateDataBuilder()..update(updates))._build();

  _$GCreateCurrencyStateData._({required this.G__typename, this.createStake})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateCurrencyStateData', 'G__typename');
  }

  @override
  GCreateCurrencyStateData rebuild(
          void Function(GCreateCurrencyStateDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateCurrencyStateDataBuilder toBuilder() =>
      new GCreateCurrencyStateDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateCurrencyStateData &&
        G__typename == other.G__typename &&
        createStake == other.createStake;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, createStake.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateCurrencyStateData')
          ..add('G__typename', G__typename)
          ..add('createStake', createStake))
        .toString();
  }
}

class GCreateCurrencyStateDataBuilder
    implements
        Builder<GCreateCurrencyStateData, GCreateCurrencyStateDataBuilder> {
  _$GCreateCurrencyStateData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _createStake;
  String? get createStake => _$this._createStake;
  set createStake(String? createStake) => _$this._createStake = createStake;

  GCreateCurrencyStateDataBuilder() {
    GCreateCurrencyStateData._initializeBuilder(this);
  }

  GCreateCurrencyStateDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createStake = $v.createStake;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateCurrencyStateData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateCurrencyStateData;
  }

  @override
  void update(void Function(GCreateCurrencyStateDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateCurrencyStateData build() => _build();

  _$GCreateCurrencyStateData _build() {
    final _$result = _$v ??
        new _$GCreateCurrencyStateData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GCreateCurrencyStateData', 'G__typename'),
            createStake: createStake);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

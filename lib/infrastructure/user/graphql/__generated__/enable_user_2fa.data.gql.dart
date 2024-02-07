// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'enable_user_2fa.data.gql.g.dart';

abstract class GTurnOn2FAData
    implements Built<GTurnOn2FAData, GTurnOn2FADataBuilder> {
  GTurnOn2FAData._();

  factory GTurnOn2FAData([Function(GTurnOn2FADataBuilder b) updates]) =
      _$GTurnOn2FAData;

  static void _initializeBuilder(GTurnOn2FADataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get turnOn2FA;
  static Serializer<GTurnOn2FAData> get serializer =>
      _$gTurnOn2FADataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTurnOn2FAData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTurnOn2FAData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTurnOn2FAData.serializer,
        json,
      );
}

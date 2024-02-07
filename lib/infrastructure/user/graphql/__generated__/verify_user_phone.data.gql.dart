// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'verify_user_phone.data.gql.g.dart';

abstract class GVerifyUserPhoneNumberData
    implements
        Built<GVerifyUserPhoneNumberData, GVerifyUserPhoneNumberDataBuilder> {
  GVerifyUserPhoneNumberData._();

  factory GVerifyUserPhoneNumberData(
          [Function(GVerifyUserPhoneNumberDataBuilder b) updates]) =
      _$GVerifyUserPhoneNumberData;

  static void _initializeBuilder(GVerifyUserPhoneNumberDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get verifyPhone;
  static Serializer<GVerifyUserPhoneNumberData> get serializer =>
      _$gVerifyUserPhoneNumberDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GVerifyUserPhoneNumberData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GVerifyUserPhoneNumberData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GVerifyUserPhoneNumberData.serializer,
        json,
      );
}

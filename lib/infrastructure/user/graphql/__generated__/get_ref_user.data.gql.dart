// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_ref_user.data.gql.g.dart';

abstract class GGetRefUserData
    implements Built<GGetRefUserData, GGetRefUserDataBuilder> {
  GGetRefUserData._();

  factory GGetRefUserData([Function(GGetRefUserDataBuilder b) updates]) =
      _$GGetRefUserData;

  static void _initializeBuilder(GGetRefUserDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetRefUserData_refUser? get refUser;
  static Serializer<GGetRefUserData> get serializer =>
      _$gGetRefUserDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRefUserData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetRefUserData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRefUserData.serializer,
        json,
      );
}

abstract class GGetRefUserData_refUser
    implements Built<GGetRefUserData_refUser, GGetRefUserData_refUserBuilder> {
  GGetRefUserData_refUser._();

  factory GGetRefUserData_refUser(
          [Function(GGetRefUserData_refUserBuilder b) updates]) =
      _$GGetRefUserData_refUser;

  static void _initializeBuilder(GGetRefUserData_refUserBuilder b) =>
      b..G__typename = 'RefUser';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get refCode;
  BuiltList<GGetRefUserData_refUser_referralsByLevel?>? get referralsByLevel;
  static Serializer<GGetRefUserData_refUser> get serializer =>
      _$gGetRefUserDataRefUserSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRefUserData_refUser.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetRefUserData_refUser? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRefUserData_refUser.serializer,
        json,
      );
}

abstract class GGetRefUserData_refUser_referralsByLevel
    implements
        Built<GGetRefUserData_refUser_referralsByLevel,
            GGetRefUserData_refUser_referralsByLevelBuilder> {
  GGetRefUserData_refUser_referralsByLevel._();

  factory GGetRefUserData_refUser_referralsByLevel(
      [Function(GGetRefUserData_refUser_referralsByLevelBuilder b)
          updates]) = _$GGetRefUserData_refUser_referralsByLevel;

  static void _initializeBuilder(
          GGetRefUserData_refUser_referralsByLevelBuilder b) =>
      b..G__typename = 'referralByLevel';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get level;
  int? get count;
  static Serializer<GGetRefUserData_refUser_referralsByLevel> get serializer =>
      _$gGetRefUserDataRefUserReferralsByLevelSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRefUserData_refUser_referralsByLevel.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetRefUserData_refUser_referralsByLevel? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRefUserData_refUser_referralsByLevel.serializer,
        json,
      );
}

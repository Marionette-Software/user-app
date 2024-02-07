// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'login_request.data.gql.g.dart';

abstract class GSignInData implements Built<GSignInData, GSignInDataBuilder> {
  GSignInData._();

  factory GSignInData([Function(GSignInDataBuilder b) updates]) = _$GSignInData;

  static void _initializeBuilder(GSignInDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GSignInData_login? get login;
  static Serializer<GSignInData> get serializer => _$gSignInDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSignInData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSignInData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSignInData.serializer,
        json,
      );
}

abstract class GSignInData_login
    implements Built<GSignInData_login, GSignInData_loginBuilder> {
  GSignInData_login._();

  factory GSignInData_login([Function(GSignInData_loginBuilder b) updates]) =
      _$GSignInData_login;

  static void _initializeBuilder(GSignInData_loginBuilder b) =>
      b..G__typename = 'User';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  bool? get enabled2fa;
  String? get token;
  BuiltList<GSignInData_login_profiles?>? get profiles;
  static Serializer<GSignInData_login> get serializer =>
      _$gSignInDataLoginSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSignInData_login.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSignInData_login? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSignInData_login.serializer,
        json,
      );
}

abstract class GSignInData_login_profiles
    implements
        Built<GSignInData_login_profiles, GSignInData_login_profilesBuilder> {
  GSignInData_login_profiles._();

  factory GSignInData_login_profiles(
          [Function(GSignInData_login_profilesBuilder b) updates]) =
      _$GSignInData_login_profiles;

  static void _initializeBuilder(GSignInData_login_profilesBuilder b) =>
      b..G__typename = 'UserProfile';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get first_name;
  String? get last_name;
  static Serializer<GSignInData_login_profiles> get serializer =>
      _$gSignInDataLoginProfilesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSignInData_login_profiles.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSignInData_login_profiles? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSignInData_login_profiles.serializer,
        json,
      );
}

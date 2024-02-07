// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'user_get_request.data.gql.g.dart';

abstract class GGetUpdateUserData
    implements Built<GGetUpdateUserData, GGetUpdateUserDataBuilder> {
  GGetUpdateUserData._();

  factory GGetUpdateUserData([Function(GGetUpdateUserDataBuilder b) updates]) =
      _$GGetUpdateUserData;

  static void _initializeBuilder(GGetUpdateUserDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetUpdateUserData_user? get user;
  static Serializer<GGetUpdateUserData> get serializer =>
      _$gGetUpdateUserDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUpdateUserData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUpdateUserData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUpdateUserData.serializer,
        json,
      );
}

abstract class GGetUpdateUserData_user
    implements Built<GGetUpdateUserData_user, GGetUpdateUserData_userBuilder> {
  GGetUpdateUserData_user._();

  factory GGetUpdateUserData_user(
          [Function(GGetUpdateUserData_userBuilder b) updates]) =
      _$GGetUpdateUserData_user;

  static void _initializeBuilder(GGetUpdateUserData_userBuilder b) =>
      b..G__typename = 'User';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get email;
  bool? get enabled2fa;
  String? get role;
  bool? get email_verified;
  bool? get phone_verified;
  bool? get profile_verified;
  BuiltList<GGetUpdateUserData_user_documents?>? get documents;
  String? get state;
  String? get token;
  BuiltList<GGetUpdateUserData_user_labels?>? get labels;
  String? get createdAt;
  String? get updatedAt;
  BuiltList<GGetUpdateUserData_user_phones?>? get phones;
  BuiltList<GGetUpdateUserData_user_profiles?>? get profiles;
  static Serializer<GGetUpdateUserData_user> get serializer =>
      _$gGetUpdateUserDataUserSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUpdateUserData_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUpdateUserData_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUpdateUserData_user.serializer,
        json,
      );
}

abstract class GGetUpdateUserData_user_documents
    implements
        Built<GGetUpdateUserData_user_documents,
            GGetUpdateUserData_user_documentsBuilder> {
  GGetUpdateUserData_user_documents._();

  factory GGetUpdateUserData_user_documents(
          [Function(GGetUpdateUserData_user_documentsBuilder b) updates]) =
      _$GGetUpdateUserData_user_documents;

  static void _initializeBuilder(GGetUpdateUserData_user_documentsBuilder b) =>
      b..G__typename = 'UserDocument';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get doc_type;
  String? get doc_number;
  String? get doc_expire;
  String? get url;
  static Serializer<GGetUpdateUserData_user_documents> get serializer =>
      _$gGetUpdateUserDataUserDocumentsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUpdateUserData_user_documents.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUpdateUserData_user_documents? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUpdateUserData_user_documents.serializer,
        json,
      );
}

abstract class GGetUpdateUserData_user_labels
    implements
        Built<GGetUpdateUserData_user_labels,
            GGetUpdateUserData_user_labelsBuilder> {
  GGetUpdateUserData_user_labels._();

  factory GGetUpdateUserData_user_labels(
          [Function(GGetUpdateUserData_user_labelsBuilder b) updates]) =
      _$GGetUpdateUserData_user_labels;

  static void _initializeBuilder(GGetUpdateUserData_user_labelsBuilder b) =>
      b..G__typename = 'UserLabel';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get key;
  String? get value;
  String? get scope;
  static Serializer<GGetUpdateUserData_user_labels> get serializer =>
      _$gGetUpdateUserDataUserLabelsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUpdateUserData_user_labels.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUpdateUserData_user_labels? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUpdateUserData_user_labels.serializer,
        json,
      );
}

abstract class GGetUpdateUserData_user_phones
    implements
        Built<GGetUpdateUserData_user_phones,
            GGetUpdateUserData_user_phonesBuilder> {
  GGetUpdateUserData_user_phones._();

  factory GGetUpdateUserData_user_phones(
          [Function(GGetUpdateUserData_user_phonesBuilder b) updates]) =
      _$GGetUpdateUserData_user_phones;

  static void _initializeBuilder(GGetUpdateUserData_user_phonesBuilder b) =>
      b..G__typename = 'UserPhone';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get phone;
  bool? get verified;
  static Serializer<GGetUpdateUserData_user_phones> get serializer =>
      _$gGetUpdateUserDataUserPhonesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUpdateUserData_user_phones.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUpdateUserData_user_phones? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUpdateUserData_user_phones.serializer,
        json,
      );
}

abstract class GGetUpdateUserData_user_profiles
    implements
        Built<GGetUpdateUserData_user_profiles,
            GGetUpdateUserData_user_profilesBuilder> {
  GGetUpdateUserData_user_profiles._();

  factory GGetUpdateUserData_user_profiles(
          [Function(GGetUpdateUserData_user_profilesBuilder b) updates]) =
      _$GGetUpdateUserData_user_profiles;

  static void _initializeBuilder(GGetUpdateUserData_user_profilesBuilder b) =>
      b..G__typename = 'UserProfile';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get first_name;
  String? get last_name;
  String? get birth;
  String? get address;
  String? get postcode;
  String? get city;
  String? get country;
  static Serializer<GGetUpdateUserData_user_profiles> get serializer =>
      _$gGetUpdateUserDataUserProfilesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUpdateUserData_user_profiles.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUpdateUserData_user_profiles? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUpdateUserData_user_profiles.serializer,
        json,
      );
}

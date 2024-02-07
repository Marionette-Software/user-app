// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'delete_recipient_request.data.gql.g.dart';

abstract class GDeleteRecipientData
    implements Built<GDeleteRecipientData, GDeleteRecipientDataBuilder> {
  GDeleteRecipientData._();

  factory GDeleteRecipientData(
          [Function(GDeleteRecipientDataBuilder b) updates]) =
      _$GDeleteRecipientData;

  static void _initializeBuilder(GDeleteRecipientDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get deleteRecipient;
  static Serializer<GDeleteRecipientData> get serializer =>
      _$gDeleteRecipientDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteRecipientData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteRecipientData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteRecipientData.serializer,
        json,
      );
}

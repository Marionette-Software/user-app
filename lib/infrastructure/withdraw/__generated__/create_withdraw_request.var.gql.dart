// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'create_withdraw_request.var.gql.g.dart';

abstract class GCreateWithdrawalVars
    implements Built<GCreateWithdrawalVars, GCreateWithdrawalVarsBuilder> {
  GCreateWithdrawalVars._();

  factory GCreateWithdrawalVars(
          [Function(GCreateWithdrawalVarsBuilder b) updates]) =
      _$GCreateWithdrawalVars;

  String? get beneficiary_id;
  double? get amount;
  String? get code;
  bool? get includeFees;
  static Serializer<GCreateWithdrawalVars> get serializer =>
      _$gCreateWithdrawalVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateWithdrawalVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateWithdrawalVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateWithdrawalVars.serializer,
        json,
      );
}

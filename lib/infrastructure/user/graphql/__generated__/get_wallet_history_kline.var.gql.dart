// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_wallet_history_kline.var.gql.g.dart';

abstract class GWalletHistoryKlineVars
    implements Built<GWalletHistoryKlineVars, GWalletHistoryKlineVarsBuilder> {
  GWalletHistoryKlineVars._();

  factory GWalletHistoryKlineVars(
          [Function(GWalletHistoryKlineVarsBuilder b) updates]) =
      _$GWalletHistoryKlineVars;

  String get market;
  String get interval;
  int get timeFrom;
  int get timeTo;
  static Serializer<GWalletHistoryKlineVars> get serializer =>
      _$gWalletHistoryKlineVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWalletHistoryKlineVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWalletHistoryKlineVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWalletHistoryKlineVars.serializer,
        json,
      );
}

import 'package:json_annotation/json_annotation.dart';
import 'package:user_app/domain/wallet/market.dart';
part 'user_wallet.g.dart';

@JsonSerializable()
class UserWallet {
  final String id;
  final String name;
  @JsonKey(name: 'icon_url')
  final String iconUrl;
  final int position;
  final int precision;
  final bool enabled;
  final bool staking_enabled;
  final bool isUnstakingProcess;
  final String? lightBgColor1;
  final String? lightBgColor2;
  final String? darkBgColor1;
  final String? darkBgColor2;
  final String? lightTextColor;
  final List<Market> markets;
  bool isFavorite;

  UserWallet({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.position,
    required this.precision,
    required this.enabled,
    required this.staking_enabled,
    required this.isUnstakingProcess,
    this.lightBgColor1,
    this.lightBgColor2,
    this.darkBgColor2,
    this.darkBgColor1,
    this.lightTextColor,
    required this.markets,
    required this.isFavorite,
  });

  factory UserWallet.initialData() => UserWallet(
        id: 'id',
        name: 'name',
        iconUrl: 'iconUrl',
        position: 0,
        precision: 0,
        enabled: false,
        isUnstakingProcess: false,
        staking_enabled: false,
        lightBgColor1: 'lightBgColor1',
        lightBgColor2: 'lightBgColor2',
        darkBgColor2: 'darkBgColor2',
        darkBgColor1: 'darkBgColor1',
        lightTextColor: 'lightTextColor',
        markets: [],
        isFavorite: false,
      );

  factory UserWallet.fromJson(Map<String, dynamic> json) =>
      _$UserWalletFromJson(json);

  Map<String, dynamic> toJson() => _$UserWalletToJson(this);
}

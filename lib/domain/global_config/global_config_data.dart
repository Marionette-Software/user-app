import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';

part 'global_config_data.g.dart';

@HiveType(typeId: 1)
class GlobalConfigData extends HiveObject {
  GlobalConfigData({
    required this.url,
    required this.enabledTradingPage,
    required this.enabledNonCustodialWalletConnect,
    required this.termsAndConditionsUrl,
    required this.enabledNonCustodialExchangePage,
    required this.withTradingBalance,
    required this.enabledBuySell,
    required this.googleAuthClientId,
    required this.enabledStaking,
    required this.enabledPhoneVerificationStep,
    required this.enabledReferrals,
    required this.enabledLoginCaptcha,
    required this.orderBookMiddle,
    required this.enabledSpread,
    required this.withInstantBuy,
    required this.withInstantSell,
    required this.enabledSellWithdrawZeroBalance,
    this.extensionCodeError,
  });

  @HiveField(0, defaultValue: '')
  final String url;
  @HiveField(1, defaultValue: true)
  final bool enabledTradingPage;
  @HiveField(3, defaultValue: '')
  final String googleAuthClientId;
  @HiveField(4, defaultValue: true)
  final bool enabledNonCustodialWalletConnect;
  @HiveField(6, defaultValue: '')
  final String termsAndConditionsUrl;
  @HiveField(7)
  final String? extensionCodeError;
  @HiveField(8, defaultValue: false)
  final bool enabledNonCustodialExchangePage;
  @HiveField(10, defaultValue: false)
  final bool withTradingBalance;
  @HiveField(11, defaultValue: false)
  final bool enabledBuySell;
  @HiveField(12, defaultValue: false)
  final bool enabledStaking;
  @HiveField(13, defaultValue: false)
  final bool enabledPhoneVerificationStep;
  @HiveField(14, defaultValue: false)
  final bool enabledReferrals;
  @HiveField(15, defaultValue: true)
  final bool enabledLoginCaptcha;
  @HiveField(16, defaultValue: false)
  final bool orderBookMiddle;
  @HiveField(17, defaultValue: true)
  final bool enabledSpread;
  @HiveField(18, defaultValue: true)
  final bool withInstantBuy;
  @HiveField(19, defaultValue: true)
  final bool withInstantSell;
  @HiveField(20, defaultValue: true)
  final bool enabledSellWithdrawZeroBalance;
}

class GlobalConfigHelper {
  static void update({
    String? url,
    bool? enabledTradingPage,
    bool? enabledNonCustodialWalletConnect,
    bool? enabledWalletPage,
    String? termsAndConditionsUrl,
    bool? enabledNonCustodialExchangePage,
    bool? withTradingBalance,
    bool? withInstantBuySell,
    bool? enabledBuySell,
    String? googleAuthClientId,
    String? extensionCodeError,
    bool? enabledStaking,
    bool? enabledPhoneVerificationStep,
    bool? enabledReferrals,
    bool? enabledLoginCaptcha,
    bool? orderBookMiddle,
    bool? enabledSpread,
    bool? withInstantBuy,
    bool? withInstantSell,
    bool? enabledSellWithdrawZeroBalance,
  }) {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;
    var data = GlobalConfigData(
      url: url ?? globalData.url,
      enabledTradingPage: enabledTradingPage ?? globalData.enabledTradingPage,
      enabledNonCustodialWalletConnect: enabledNonCustodialWalletConnect ??
          globalData.enabledNonCustodialWalletConnect,
      termsAndConditionsUrl:
          termsAndConditionsUrl ?? globalData.termsAndConditionsUrl,
      enabledNonCustodialExchangePage: enabledNonCustodialExchangePage ??
          globalData.enabledNonCustodialExchangePage,
      withTradingBalance: withTradingBalance ?? globalData.withTradingBalance,
      enabledBuySell: enabledBuySell ?? globalData.enabledBuySell,
      googleAuthClientId: googleAuthClientId ?? globalData.googleAuthClientId,
      extensionCodeError: extensionCodeError ?? globalData.extensionCodeError,
      enabledStaking: enabledStaking ?? globalData.enabledStaking,
      enabledPhoneVerificationStep: enabledPhoneVerificationStep ??
          globalData.enabledPhoneVerificationStep,
      enabledReferrals: enabledReferrals ?? globalData.enabledReferrals,
      enabledLoginCaptcha:
          enabledLoginCaptcha ?? globalData.enabledLoginCaptcha,
      orderBookMiddle: orderBookMiddle ?? globalData.orderBookMiddle,
      enabledSpread: enabledSpread ?? globalData.enabledSpread,
      withInstantBuy: withInstantBuy ?? globalData.withInstantBuy,
      withInstantSell: withInstantSell ?? globalData.withInstantSell,
      enabledSellWithdrawZeroBalance: enabledSellWithdrawZeroBalance ??
          globalData.enabledSellWithdrawZeroBalance,
    );
    box.putAt(0, data);
  }
}

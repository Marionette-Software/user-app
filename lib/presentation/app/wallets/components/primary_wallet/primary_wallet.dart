import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/wallet/user_balance.dart';
import 'package:user_app/presentation/app/wallets/components/primary_wallet/components/launch_trade_button.dart';
import 'package:user_app/presentation/app/wallets/components/primary_wallet/components/primary_wallet_subtitle_row.dart';
import 'package:user_app/presentation/app/wallets/components/primary_wallet/components/primary_wallet_title_row.dart';
import 'package:user_app/presentation/app/wallets/components/primary_wallet/components/transfer_balance_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/sum_with_balance.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class PrimaryWallet extends HookConsumerWidget {
  const PrimaryWallet({
    Key? key,
    required this.platformType,
  }) : super(key: key);

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletDataStateNotifierProvider);

    return Container(
      width: (platformType == PlatformTypeState.web
              ? 670
              : (platformType == PlatformTypeState.tablet ? 452 : 300))
          .w,
      decoration: platformType != PlatformTypeState.mobile
          ? BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  isLightTheme(context)
                      ? AppColors.whiteColor
                      : walletBackgroundColor,
                  isLightTheme(context)
                      ? AppColors.whiteColor
                      : walletBackgroundColor.withOpacity(0.0),
                ],
              ),
              boxShadow: [
                isLightTheme(context)
                    ? BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        spreadRadius: 10,
                        blurRadius: 20,
                        offset: const Offset(0, 3),
                      )
                    : BoxShadow(
                        color: Theme.of(context)
                            .primaryColorLight
                            .withOpacity(0.0),
                        spreadRadius: 15,
                        blurRadius: 30,
                        offset: const Offset(0, 3),
                      )
              ],
              borderRadius: BorderRadius.circular(
                getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 10,
                  tabletValue: 10,
                  mobileValue: 5,
                ),
              ),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isLightTheme(context)
                  ? cardColor
                  : AppColors.whiteColor.withOpacity(0.05),
              border: Border.all(
                color: isLightTheme(context)
                    ? Colors.transparent
                    : AppColors.whiteColor.withOpacity(0.25),
                width: 1,
              ),
            ),
      child: Padding(
        padding: EdgeInsets.only(
          top: (platformType == PlatformTypeState.web
                  ? 17
                  : (platformType == PlatformTypeState.tablet ? 15 : 12))
              .h,
          bottom: (platformType == PlatformTypeState.web ? 25 : 15).h,
          left: (platformType == PlatformTypeState.web ? 25 : 15).w,
          right: (platformType == PlatformTypeState.web ? 25 : 15).w,
        ),
        child: Consumer(
          builder: (_, ref, __) {
            final userBalances = ref.watch(userBalancesStateNotifierProvider);
            UserBalance userBalance = userBalances
                .firstWhere((element) => element.id == walletState.id);

            return Column(
              children: [
                PrimaryWalletTitleRow(
                  platformType: platformType,
                  title: tr('wallet.primary_wallet'),
                  balance: userBalance.balance == null
                      ? 'N/A'
                      : numberFormatWithPrecision(walletState.precision)
                          .format(userBalance.balance!),
                  currencyId: ' ${walletState.id.toUpperCase()}',
                ),
                SizedBox(
                  height: (platformType == PlatformTypeState.web
                          ? 13
                          : (platformType == PlatformTypeState.tablet ? 5 : 6))
                      .h,
                ),
                Consumer(
                  builder: (_, ref, __) {
                    final userBalance = ref
                        .watch(userBalancesStateNotifierProvider)
                        .firstWhere((e) => e.id == walletState.id);

                    return PrimaryWalletSubtitle(
                      platformType: platformType,
                      lockedBalance: userBalance.lockedBalance!
                          .toStringAsFixed(walletState.precision),
                      lockedBalanceToBase: getUsdSumForWallet(
                        wallet: walletState,
                        withAbbreviateSum: false,
                        userBalance: userBalance,
                      ),
                    );
                  },
                ),
                TransferBalanceButton(
                  platformType: platformType,
                ),
                Consumer(
                  builder: (_, ref, __) {
                    final userBalance = ref
                        .watch(userBalancesStateNotifierProvider)
                        .firstWhere((e) => e.id == walletState.id);
                    return PrimaryWalletSubtitle(
                      platformType: platformType,
                      lockedBalance: userBalance.advancedTradingLockedBalance ==
                              null
                          ? 'N/A'
                          : numberFormatWithPrecision(walletState.precision)
                              .format(
                                  userBalance.advancedTradingLockedBalance!),
                      lockedBalanceToBase: getUsdSumForWallet(
                        wallet: walletState,
                        withAbbreviateSum: false,
                        userBalance: userBalance,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: (platformType == PlatformTypeState.web
                          ? 9
                          : (platformType == PlatformTypeState.tablet ? 5 : 3))
                      .h,
                ),
                PrimaryWalletTitleRow(
                  platformType: platformType,
                  title: tr('wallet.advanced_trading'),
                  balance: userBalance.advancedTradingBalance == null
                      ? 'N/A'
                      : numberFormatWithPrecision(walletState.precision)
                          .format(userBalance.advancedTradingBalance!),
                  currencyId: ' ${walletState.id.toUpperCase()}',
                ),
                SizedBox(
                  height: (platformType == PlatformTypeState.web
                          ? 18
                          : (platformType == PlatformTypeState.tablet
                              ? 15
                              : 13))
                      .h,
                ),
                LaunchTradeButton(
                  platformType: platformType,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

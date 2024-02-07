import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/loced_balance/locked_balance.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/staking/stake_button.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/event_with_balance_web.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/sum_with_balance.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class WalletCard extends HookConsumerWidget {
  const WalletCard({
    Key? key,
    required this.platformType,
    required this.withTradingBalance,
  }) : super(key: key);

  final PlatformTypeState platformType;
  final bool withTradingBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletDataStateNotifierProvider);

    var globalConfigBox = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = globalConfigBox.getAt(0)!;

    return Container(
      width: 670.w,
      height: 400.h,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
        gradient: isLightTheme(context)
            ? null
            : const LinearGradient(
                begin: Alignment(0, -1),
                end: Alignment(0, 1),
                colors: [Color(0xff1c252d), Color(0x001c252d)],
                stops: [0, 1],
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
                  color: Theme.of(context).primaryColorLight.withOpacity(0.0),
                  spreadRadius: 15,
                  blurRadius: 30,
                  offset: const Offset(0, 3),
                )
        ],
      ),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 26.h,
              left: 26.w,
              bottom: 26.h,
              right: 25.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    UserAppImage(
                      path: walletState.iconUrl,
                      width: 74.w,
                      height: 74.h,
                      isNetwork: true,
                      clipBehavior: Clip.hardEdge,
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Tooltip(
                      message:
                          walletState.name.length > 33 ? walletState.name : '',
                      child: SizedBox(
                        width: 330.w,
                        height: 76.h,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            walletState.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 40.sp,
                                  letterSpacing: -2.sp,
                                  height: 0.85,
                                  color: isLightTheme(context)
                                      ? AppColors.darkColorText
                                      : MainColorsApp.lightTextColor,
                                ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 38.h,
                ),
                Consumer(
                  builder: (_, ref, __) {
                    final userBalances =
                        ref.watch(userBalancesStateNotifierProvider);

                    final balance = userBalances.firstWhere(
                      (element) => element.id == walletState.id,
                    );

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5.w),
                                child: Text(
                                  getCoinSum(
                                    wallet: walletState,
                                    withAbbreviateSum: false,
                                    userBalance: balance,
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: isLightTheme(context)
                                            ? AppColors.darkColorText
                                            : MainColorsApp.lightTextColor,
                                        fontSize: 30.sp,
                                        letterSpacing: -1.5.sp,
                                      ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 2.5.h),
                                child: Text(
                                  getUsdSumForWallet(
                                    wallet: walletState,
                                    withAbbreviateSum: false,
                                    userBalance: balance,
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: isLightTheme(context)
                                            ? Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.5)
                                            : MainColorsApp.lightTextColor
                                                .withOpacity(0.5),
                                        fontSize: 20.sp,
                                        letterSpacing: -1.sp,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          width: 272.w,
                          height: 2.h,
                          color: isLightTheme(context)
                              ? AppColors.mainBackgroundLightColor
                              : AppColors.whiteColor.withOpacity(0.05),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      tr('wallet.available'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: isLightTheme(context)
                                                ? Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.5)
                                                : AppColors.whiteColor
                                                    .withOpacity(0.5),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20.sp,
                                            letterSpacing: -1.sp,
                                          ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      '${numberFormatWithPrecision(walletState.precision).format(balance.advancedTradingBalance! + balance.balance!)} ${walletState.id.toUpperCase()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: isLightTheme(context)
                                                ? Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.5)
                                                : AppColors.whiteColor
                                                    .withOpacity(0.5),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20.sp,
                                            letterSpacing: -1.sp,
                                          ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      walletState.staking_enabled &&
                                              globalData.enabledStaking
                                          ? 'Locked / Staking:'.hardcoded
                                          : 'Locked:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: isLightTheme(context)
                                                ? Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.5)
                                                : AppColors.whiteColor
                                                    .withOpacity(0.5),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20.sp,
                                            letterSpacing: -1.sp,
                                          ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      '${numberFormatWithPrecision(walletState.precision).format(balance.advancedTradingLockedBalance! + balance.lockedBalance!)} ${walletState.id.toUpperCase()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: isLightTheme(context)
                                                ? Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.5)
                                                : AppColors.whiteColor
                                                    .withOpacity(0.5),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20.sp,
                                            letterSpacing: -1.sp,
                                          ),
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          barrierColor:
                                              AppColors.placeHolderGrey,
                                          context: context,
                                          builder: (context) =>
                                              const ModalWindowWallet(
                                            titleSize: 30,
                                            title: '',
                                            alertDialogSide: false,
                                            backgroundColor: Colors.transparent,
                                            content: LockedBalanceWeb(),
                                          ),
                                        );
                                      },
                                      child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                          isLightTheme(context)
                                              ? Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.5)
                                              : AppColors.whiteColor
                                                  .withOpacity(0.5),
                                          BlendMode.srcIn,
                                        ),
                                        child: SvgPicture.asset(
                                          walletInfoPath,
                                          width: 18.w,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            walletState.staking_enabled &&
                                    globalData.enabledStaking
                                ? const StakeButtonWeb()
                                : const SizedBox()
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        EventWithBalanceWeb(
                          withTradingBalance: withTradingBalance,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            right: -40.w,
            top: -45.h,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(20 / 360),
              child: Opacity(
                opacity: 0.25,
                child: UserAppImage(
                  path: walletState.iconUrl,
                  width: 230.w,
                  height: 230.h,
                  isNetwork: true,
                  clipBehavior: Clip.hardEdge,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

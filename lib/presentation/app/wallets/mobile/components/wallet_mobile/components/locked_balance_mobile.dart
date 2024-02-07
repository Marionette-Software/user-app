import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/capitalize.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class LockedBalanceContainerMobile extends HookConsumerWidget {
  const LockedBalanceContainerMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletDataStateNotifierProvider);
    final userBalance = ref
        .watch(userBalancesStateNotifierProvider)
        .firstWhere((e) => e.id == walletState.id);

    var globalConfigBox = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = globalConfigBox.getAt(0)!;

    return SizedBox(
      width: 390.w,
      child: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
          top: 10..h,
          bottom: 44..h,
        ),
        child: Column(
          children: [
            Container(
              width: 60.w,
              height: 5..h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.r),
                color:
                    isLightTheme(context) ? Colors.black : AppColors.whiteColor,
              ),
            ),
            SizedBox(
              height: 15..h,
            ),
            Text(
              '${capitalize(walletState.name)} locked in',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    letterSpacing: -1.sp,
                  ),
            ),
            SizedBox(
              height: 20..h,
            ),
            Container(
              width: double.infinity,
              height: 60..h,
              decoration: BoxDecoration(
                color: isLightTheme(context)
                    ? AppColors.mainBackgroundLightColor
                    : AppColors.whiteColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pending withdrawals:',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : AppColors.whiteColor.withOpacity(0.5),
                            fontSize: 15.sp,
                            letterSpacing: -0.75.sp,
                          ),
                    ),
                    Text(
                      '${numberFormatWithPrecision(walletState.precision).format((userBalance.withdrawLockedBalance!))} ${walletState.id.toUpperCase()}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            letterSpacing: -0.75.sp,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10..h,
            ),
            Container(
              width: double.infinity,
              height: 60..h,
              decoration: BoxDecoration(
                color: isLightTheme(context)
                    ? AppColors.mainBackgroundLightColor
                    : AppColors.whiteColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Open limit orders:',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: isLightTheme(context)
                                  ? AppColors.aboutHeaderLight
                                  : AppColors.whiteColor.withOpacity(0.5),
                              letterSpacing: -0.75.sp,
                            ),
                      ),
                      Text(
                        '${numberFormatWithPrecision(walletState.precision).format(userBalance.advancedTradingLockedBalance!)} ${walletState.id.toUpperCase()}',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              letterSpacing: -0.75.sp,
                            ),
                      ),
                    ]),
              ),
            ),
            globalData.enabledStaking && walletState.staking_enabled
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10..h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 60..h,
                        decoration: BoxDecoration(
                          color: isLightTheme(context)
                              ? AppColors.mainBackgroundLightColor
                              : AppColors.whiteColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 15.w,
                            right: 15.w,
                          ),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Staking:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.sp,
                                        color: isLightTheme(context)
                                            ? AppColors.aboutHeaderLight
                                            : AppColors.whiteColor
                                                .withOpacity(0.5),
                                        letterSpacing: -0.75.sp,
                                      ),
                                ),
                                Text(
                                  '${numberFormatWithPrecision(walletState.precision).format(userBalance.activeStakingBalance! + userBalance.stakingLockedBalance!)} ${walletState.id.toUpperCase()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.sp,
                                        letterSpacing: -0.75.sp,
                                      ),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

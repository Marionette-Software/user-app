import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/currency_staking_futere_provider.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class StakingRewardDetailsMobile extends HookConsumerWidget {
  const StakingRewardDetailsMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stakingCurrencyWatch =
        ref.watch(stakingCurrencyDataStateNotifierProvider);

    String formatRewardDetailsData() {
      Duration remainingTime = Duration(
          milliseconds: stakingCurrencyWatch.next_staking_calc!.toInt() -
              stakingCurrencyWatch.last_staking_calc!.toInt());

      // Calculate days, hours, minutes.
      String days =
          remainingTime.inDays >= 1 ? '${remainingTime.inDays} D ' : '';
      String hours = (remainingTime.inHours % 24 > 0)
          ? '${remainingTime.inHours % 24} H '
          : '';
      String minutes = (remainingTime.inMinutes % 60 > 0)
          ? '${remainingTime.inMinutes % 60} min'
          : '';

      return '$days $hours $minutes';
    }

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 2..h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : AppColors.whiteColor.withOpacity(0.25),
          ),
        ),
        SizedBox(
          height: 15..h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Reward conditions:',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.75.sp,
                    color: isLightTheme(context)
                        ? AppColors.aboutHeaderLight
                        : Colors.white.withOpacity(0.5),
                  ),
            ),
            Text(
              '${stakingCurrencyWatch.staking_apr!.toStringAsFixed(2)}% APR',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.75.sp,
                    color: isLightTheme(context)
                        ? AppColors.aboutHeaderLight
                        : Colors.white.withOpacity(0.5),
                  ),
            ),
          ],
        ),
        SizedBox(
          height: 15..h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Reward cycle:',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.75.sp,
                    color: isLightTheme(context)
                        ? AppColors.aboutHeaderLight
                        : Colors.white.withOpacity(0.5),
                  ),
            ),
            Text(
              formatRewardDetailsData(),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.75.sp,
                    color: isLightTheme(context)
                        ? AppColors.aboutHeaderLight
                        : Colors.white.withOpacity(0.5),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}

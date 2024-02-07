import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/currency_staking_futere_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class StakingNextRewardDetailsMobile extends StatefulHookConsumerWidget {
  const StakingNextRewardDetailsMobile({
    required this.updateStakingCurrency,
    required this.nextStakingCalc,
    super.key,
  });

  final int nextStakingCalc;
  final void Function() updateStakingCurrency;

  @override
  ConsumerState<StakingNextRewardDetailsMobile> createState() =>
      _StakingNextRewardDetailsMobileState();
}

class _StakingNextRewardDetailsMobileState
    extends ConsumerState<StakingNextRewardDetailsMobile> {
  String timerValue = '--:--';
  int updatedDifferenceInMillies = 0;
  late Timer? timer;

  void _startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        updatedDifferenceInMillies =
            widget.nextStakingCalc - DateTime.now().millisecondsSinceEpoch;

        Duration remainingTime =
            Duration(milliseconds: updatedDifferenceInMillies);

        String formattedTime = remainingTime.inDays > 1
            ? DateFormat("EEE, d MMM yyyy HH:mm:ss").format(
                DateTime.fromMillisecondsSinceEpoch(widget.nextStakingCalc))
            : DateFormat("HH:mm:ss").format(DateTime(0).add(remainingTime));

        setState(() {
          timerValue = formattedTime;
        });

        if (updatedDifferenceInMillies <= 0) {
          timer.cancel();
          setState(() {
            timerValue = '--:--';
          });
          widget.updateStakingCurrency();
          _startTimer();
        }
      },
    );
  }

  @override
  void initState() {
    _startTimer();
    timerValue = '--:--';
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stakingCurrencyWatch =
        ref.watch(stakingCurrencyDataStateNotifierProvider);
    final walletData = ref.watch(walletDataStateNotifierProvider);

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
              'Next reward amount:',
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
              '${stakingCurrencyWatch.next_reward_amount!.toStringAsFixed(walletData.precision)} ${walletData.id.toUpperCase()}',
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
              'Next reward:',
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
              timerValue,
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

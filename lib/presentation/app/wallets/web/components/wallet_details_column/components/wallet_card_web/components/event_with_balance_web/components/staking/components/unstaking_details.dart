import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/currency_staking_futere_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class UnstackingDetailsWeb extends StatefulHookConsumerWidget {
  const UnstackingDetailsWeb({required this.nextStakingCalc, super.key});

  final int nextStakingCalc;
  @override
  ConsumerState<UnstackingDetailsWeb> createState() =>
      _UnstackingDetailsWebState();
}

class _UnstackingDetailsWebState extends ConsumerState<UnstackingDetailsWeb> {
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
          context.pop();
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
        Text(
          'Staking Details',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: isLightTheme(context)
                    ? AppColors.darkColorText
                    : AppColors.whiteColor,
                fontWeight: FontWeight.w600,
                fontSize: 30.sp,
                letterSpacing: -1.5.sp,
              ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Active staking (Unstaking):'.hardcoded,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1.sp,
                  ),
            ),
            Text(
              '${(stakingCurrencyWatch.active_balance! + stakingCurrencyWatch.locked_balance!).toStringAsFixed(walletData.precision)} ${walletData.id.toUpperCase()}',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1.sp,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Divider(
          height: 2.h,
          color: isLightTheme(context)
              ? AppColors.mainBackgroundLightColor
              : AppColors.whiteColor.withOpacity(0.25),
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Staking ends:'.hardcoded,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.9.sp,
                    color: isLightTheme(context)
                        ? AppColors.aboutHeaderLight
                        : Colors.white.withOpacity(0.5),
                  ),
            ),
            Text(
              timerValue,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.9.sp,
                    color: isLightTheme(context)
                        ? opacityTextColor
                        : Colors.white.withOpacity(0.5),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}

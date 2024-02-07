import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/sum_with_balance.dart';

class GetPortfolioSumMobile extends HookConsumerWidget {
  const GetPortfolioSumMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userBalancesStateWatch = ref.watch(userBalancesStateNotifierProvider);
    final walletsWatch = ref.watch(walletsListDataStateNotifierProvider);
    double getSumUSDT() {
      double allSumBalanceToUsdt = 0;

      double sumBalanceToUsdt;

      for (int i = 0; i < walletsWatch.length; i++) {
        sumBalanceToUsdt = convertBalanceToUsdt(
          walletsWatch,
          i,
          userBalancesStateWatch,
        );

        if (sumBalanceToUsdt > 0) {
          allSumBalanceToUsdt = allSumBalanceToUsdt + sumBalanceToUsdt;
        }
      }
      return allSumBalanceToUsdt;
    }

    return Text(
      '\$${abbreviateNumber(number: getSumUSDT(), precision: 2)}',
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: AppColors.whiteColor,
            fontSize: 40.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: -2.sp,
          ),
    );
  }
}

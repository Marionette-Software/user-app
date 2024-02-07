import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/generate_deposit_address_srare_notifier_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MinimumDepositRowMobile extends HookConsumerWidget {
  const MinimumDepositRowMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generateDepositAddressWatch =
        ref.watch(generateDepositAddressStateNotifierProvider);
    final walletData = ref.watch(walletDataStateNotifierProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Minimum deposit',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 13.sp,
                letterSpacing: -0.65.sp,
                color: isLightTheme(context)
                    ? AppColors.aboutHeaderLight
                    : AppColors.whiteColor.withOpacity(0.5),
                fontWeight: FontWeight.w400,
              ),
        ),
        Text(
          '${generateDepositAddressWatch.deposit!.minDepositAmount!.toStringAsFixed(walletData.precision)} ${walletData.id.toUpperCase()}',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 13.sp,
                letterSpacing: -0.65.sp,
                color: isLightTheme(context)
                    ? AppColors.aboutHeaderLight
                    : AppColors.whiteColor.withOpacity(0.5),
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}

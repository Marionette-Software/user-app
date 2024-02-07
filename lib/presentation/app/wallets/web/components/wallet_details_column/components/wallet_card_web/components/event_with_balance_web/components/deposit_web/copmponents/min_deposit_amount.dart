import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/generate_deposit_address_srare_notifier_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MinDepositAmount extends HookConsumerWidget {
  const MinDepositAmount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final generateDepositAddressWatch =
        ref.watch(generateDepositAddressStateNotifierProvider);

    return Text(
      '${tr('wallet.minimum_deposit')} ${numberFormatWithPrecision(walletData.precision).format(generateDepositAddressWatch.deposit!.minDepositAmount!)} ${generateDepositAddressWatch.currency!.id!.toUpperCase()}',
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: isLightTheme(context)
                ? AppColors.aboutHeaderLight
                : AppColors.whiteColor.withOpacity(0.5),
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.75.sp,
          ),
    );
  }
}

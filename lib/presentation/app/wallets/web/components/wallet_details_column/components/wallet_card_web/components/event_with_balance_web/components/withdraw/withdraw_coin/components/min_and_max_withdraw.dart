import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/application/withdrawal/withdraw_payment_interface_state_provider.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';

class MinAndMaxWithdraw extends HookConsumerWidget {
  const MinAndMaxWithdraw({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentInterfaceWatch =
        ref.watch(withdrawPaymentInterfaceNotifierProvider);
    final walletData = ref.watch(walletDataStateNotifierProvider);

    return Text(
      '${tr('wallet.withdrawal')}: ${tr('wallet.min')} ${numberFormatWithPrecision(walletData.precision).format(paymentInterfaceWatch.minWithdrawAmount)} - ${tr('wallet.max')} ${numberFormatWithPrecision(walletData.precision).format(paymentInterfaceWatch.maxWithdrawAmount)} ${paymentInterfaceWatch.currency.id.toUpperCase()}',
      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 22.sp),
    );
  }
}

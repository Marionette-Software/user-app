import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/application/withdrawal/withdraw_payment_interface_state_provider.dart';

class WithdrawImportantWeb extends HookConsumerWidget {
  const WithdrawImportantWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentInterfaceWatch =
        ref.watch(withdrawPaymentInterfaceNotifierProvider);

    final walletWatch = ref.watch(walletDataStateNotifierProvider);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.error,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tr('wallet.important'),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 17.sp,
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              '${tr('wallet.enter_only')} ${'${walletWatch.id.toUpperCase()} ${paymentInterfaceWatch.paymentInterface.title!} ${tr('wallet.network')} (${paymentInterfaceWatch.paymentInterface.subtitle!})'} ${tr('wallet.for_withdrawal')}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 17.sp,
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

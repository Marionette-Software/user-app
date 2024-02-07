import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/generate_deposit_address_srare_notifier_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';

class DepositImportant extends HookConsumerWidget {
  const DepositImportant({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generateDepositAddressWatch =
        ref.watch(generateDepositAddressStateNotifierProvider);
    final walletWatch = ref.watch(walletDataStateNotifierProvider);

    return Container(
      width: 550.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.error,
        ),
        borderRadius: BorderRadius.circular(10.r),
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
            height: 10.h,
          ),
          Text(
            '${tr('wallet.send_only')} ${'${walletWatch.id.toUpperCase()} ${generateDepositAddressWatch.paymentInterface!.title!} ${tr('wallet.network')} (${generateDepositAddressWatch.paymentInterface!.subtitle!})'} ${tr('wallet.for_deposit')}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 17.sp,
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
        ],
      ),
    );
  }
}

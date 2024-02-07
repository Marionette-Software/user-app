import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/get_status_payment_interface_state_provider.dart';

class WaiteComponent extends HookConsumerWidget {
  const WaiteComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getStatusPaymentInterfaceWatch =
        ref.read(getStatusPaymentInterfaceStateProvider);

    return Expanded(
      child: Center(
        child: SizedBox(
          height: 72.h,
          width: 305.w,
          child: AutoSizeText(
            getStatusPaymentInterfaceWatch == true
                ? tr('wallet_connect.waiting_confirmation')
                : tr('wallet_connect.choose_correct'),
            maxFontSize: 30,
            minFontSize: 4,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 30.sp),
          ),
        ),
      ),
    );
  }
}

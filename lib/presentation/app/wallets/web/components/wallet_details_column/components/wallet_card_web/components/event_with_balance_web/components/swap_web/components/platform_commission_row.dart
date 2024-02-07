import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/exchange/exchange_state_provider.dart';

class PlatformCommissionRowWeb extends HookConsumerWidget {
  const PlatformCommissionRowWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exchangeDataWatch = ref.watch(exchangeStateNotifierProvider);

    return Padding(
      padding: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tr('wallet.platform_commission'),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.9.sp,
                ),
          ),
          Text(
            '${0.toStringAsFixed(exchangeDataWatch.selectedFromCurrency.precision)} ${exchangeDataWatch.selectedFromCurrency.id.toUpperCase()}',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.9.sp,
                ),
          ),
        ],
      ),
    );
  }
}

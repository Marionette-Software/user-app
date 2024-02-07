import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/generate_deposit_address_srare_notifier_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/constants/colors.dart';

class ImportantContainerMobile extends HookConsumerWidget {
  const ImportantContainerMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final generateDepositAddressWatch =
        ref.watch(generateDepositAddressStateNotifierProvider);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 4..h,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.w,
          color: MainColorsApp.redColor,
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
                  fontSize: 13.sp,
                  color: MainColorsApp.redColor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.65,
                ),
          ),
          SizedBox(
            height: 3..h,
          ),
          Text(
            '${tr('wallet.send_only')} ${'${walletData.id.toUpperCase()} ${generateDepositAddressWatch.paymentInterface!.title!} ${tr('wallet.network')} (${generateDepositAddressWatch.paymentInterface!.subtitle!})'} ${tr('wallet.for_deposit')}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 13.sp,
                  color: MainColorsApp.redColor,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.65,
                ),
          ),
        ],
      ),
    );
  }
}

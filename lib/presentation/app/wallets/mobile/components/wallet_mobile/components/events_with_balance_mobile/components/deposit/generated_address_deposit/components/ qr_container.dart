import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:user_app/application/wallets/generate_deposit_address_srare_notifier_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class QrContainerMobile extends HookConsumerWidget {
  const QrContainerMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generateDepositAddressWatch =
        ref.watch(generateDepositAddressStateNotifierProvider);
    final walletData = ref.watch(walletDataStateNotifierProvider);

    return generateDepositAddressWatch.deposit!.encodedAddress!.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImageView(
                data: generateDepositAddressWatch.deposit!.encodedAddress!,
                gapless: true,
                size: 150.w,
                foregroundColor: isLightTheme(context)
                    ? AppColors.mainBackgroundDarkColor
                    : AppColors.whiteColor,
              ),
              Text(
                '${tr('wallet.scan_or_copy')} ${'${walletData.id.toUpperCase()} (${generateDepositAddressWatch.paymentInterface!.subtitle!})'}:',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.65.sp,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
              ),
            ],
          )
        : const SizedBox();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:user_app/application/wallets/generate_deposit_address_srare_notifier_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class DepositQrCodeWeb extends HookConsumerWidget {
  const DepositQrCodeWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletWatch = ref.watch(walletDataStateNotifierProvider);
    final generateDepositAddressWatch =
        ref.watch(generateDepositAddressStateNotifierProvider);

    return generateDepositAddressWatch.deposit!.encodedAddress!.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImageView(
                data: generateDepositAddressWatch.deposit!.encodedAddress!,
                gapless: true,
                size: 180.w,
                foregroundColor: MainColorsApp.accentColor,
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Scan QR code to deposit ${'${walletWatch.id.toUpperCase()} (${generateDepositAddressWatch.paymentInterface!.subtitle!})'}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 15.sp,
                      color: isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.75.sp,
                    ),
              ),
            ],
          )
        : const SizedBox();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/wallet/wallet_payment_interface.dart';
import 'package:user_app/infrastructure/wallet/wallet_service.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/deposit/fiat_deposit/fiat_deposit.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class FiatDepositOptionsMobile extends HookConsumerWidget {
  const FiatDepositOptionsMobile({
    required this.fiatDepositWallet,
    super.key,
  });

  final WalletPaymentInterface fiatDepositWallet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);

    return Column(
      children: [
        InkWell(
          onTap: () async {
            var res = await WalletService().fiatDeposit(
                currencyId: fiatDepositWallet.currency.id,
                paymentInterfaceId: fiatDepositWallet.paymentInterface.id);

            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FiatDepositMobile(
                  fiatWalletDetails: res,
                  walletData: walletData,
                ),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 80..h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.whiteColor.withOpacity(0.05),
              border: isLightTheme(context)
                  ? Border.all(
                      width: 1,
                      color: AppColors.mainBackgroundLightColor,
                    )
                  : null,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    bankIcon,
                    width: 38.w,
                    height: 26..h,
                    colorFilter: ColorFilter.mode(
                      isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.5),
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    'Wire transfer'.hardcoded,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 15.sp,
                          letterSpacing: -0.75.sp,
                        ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 12..h,
                    color: isLightTheme(context)
                        ? AppColors.aboutHeaderLight
                        : AppColors.whiteColor.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15..h,
        ),
        InkWell(
          onTap: () async {},
          child: Container(
            width: double.infinity,
            height: 80..h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.whiteColor.withOpacity(0.05),
              border: isLightTheme(context)
                  ? Border.all(
                      width: 1,
                      color: AppColors.mainBackgroundLightColor,
                    )
                  : null,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 38.w,
                    height: 26..h,
                    child: SvgPicture.asset(
                      stripeLogo,
                      width: 38.w,
                      height: 26..h,
                      colorFilter: ColorFilter.mode(
                        isLightTheme(context)
                            ? AppColors.aboutHeaderLight
                            : AppColors.whiteColor.withOpacity(0.5),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    'Stripe'.hardcoded,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 15.sp,
                          letterSpacing: -0.75.sp,
                        ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 12..h,
                    color: isLightTheme(context)
                        ? AppColors.aboutHeaderLight
                        : AppColors.whiteColor.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

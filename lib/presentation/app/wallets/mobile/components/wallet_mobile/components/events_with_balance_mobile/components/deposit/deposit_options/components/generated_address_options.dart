import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/wallet/wallet_payment_interface.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/deposit/generated_address_deposit/generated_address_deposit.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class GeneratedAddressOptionsMobile extends HookConsumerWidget {
  const GeneratedAddressOptionsMobile({
    required this.listWalletDepositPI,
    super.key,
  });

  final List<WalletPaymentInterface> listWalletDepositPI;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<WalletPaymentInterface> walletConnectDepositPaymentInterface = [];
    List<WalletPaymentInterface> generatedAddressDepositPaymentInterface = [];

    for (var element in listWalletDepositPI) {
      if (element.enable && element.userDirectDepositEnabled) {
        walletConnectDepositPaymentInterface.add(element);
      }
      if (element.enable && element.userDepositEnable) {
        generatedAddressDepositPaymentInterface.add(element);
      }
    }

    return Column(
      children: [
        Text(
          'Select the method'.hardcoded,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                letterSpacing: -1.sp,
              ),
        ),
        SizedBox(
          height: 20..h,
        ),
        walletConnectDepositPaymentInterface.isNotEmpty
            ? Padding(
                padding: EdgeInsets.only(bottom: 15..h),
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
                          walletConnect,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Connect Wallet'.hardcoded,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.sp,
                                    letterSpacing: -0.75.sp,
                                  ),
                            ),
                            SizedBox(
                              height: 4..h,
                            ),
                            Text(
                              'Securely connect WalletConnect\nsupported wallet and make a transaction'
                                  .hardcoded,
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    color: isLightTheme(context)
                                        ? AppColors.aboutHeaderLight
                                        : AppColors.whiteColor.withOpacity(0.5),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp,
                                    letterSpacing: -0.65.sp,
                                  ),
                            ),
                          ],
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
            : const SizedBox(),
        generatedAddressDepositPaymentInterface.isNotEmpty
            ? InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenerateAddressDepositMobile(
                        generatedAddressDepositPaymentInterface:
                            generatedAddressDepositPaymentInterface,
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
                          generatedAddressIcon,
                          width: 38.w,
                          height: 23..h,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Generated Address'.hardcoded,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.sp,
                                    letterSpacing: -0.75.sp,
                                  ),
                            ),
                            SizedBox(
                              height: 4..h,
                            ),
                            Text(
                              'Your personal address generated by the\nplatform to detect your deposits'
                                  .hardcoded,
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    color: isLightTheme(context)
                                        ? AppColors.aboutHeaderLight
                                        : AppColors.whiteColor.withOpacity(0.5),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp,
                                    letterSpacing: -0.65.sp,
                                  ),
                            ),
                          ],
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
            : const SizedBox()
      ],
    );
  }
}

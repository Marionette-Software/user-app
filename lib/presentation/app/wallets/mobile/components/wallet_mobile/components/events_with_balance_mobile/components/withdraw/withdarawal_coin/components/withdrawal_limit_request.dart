import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/two_fa/mobile/permission_two_fa.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class WithdrawalLimitRequestMobile extends StatefulHookConsumerWidget {
  const WithdrawalLimitRequestMobile({
    super.key,
    required this.withdrawWith2FA,
  });

  final Function(String code)? withdrawWith2FA;

  @override
  ConsumerState<WithdrawalLimitRequestMobile> createState() =>
      _WithdrawalLimitRequestMobileState();
}

class _WithdrawalLimitRequestMobileState
    extends ConsumerState<WithdrawalLimitRequestMobile> {
  @override
  Widget build(BuildContext context) {
    final walletData = ref.watch(walletDataStateNotifierProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: getWalletColor(
          walletData.lightBgColor1,
          walletData.darkBgColor1,
          isLightTheme(context),
        ),
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50..h),
          child: Padding(
            padding: EdgeInsets.only(
              top: 15..h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: BackButtonMobile(
                    onTap: () => context.pop(),
                  ),
                ),
                Text(
                  'Send ${walletData.id.toUpperCase()}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 15.sp,
                        letterSpacing: -0.75.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  width: 70.w,
                  height: 25..h,
                )
              ],
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 10..h,
          ),
          decoration: BoxDecoration(
            color: isLightTheme(context)
                ? AppColors.whiteColor
                : walletBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 25..h, left: 15.w, right: 15.w),
            child: Column(
              children: [
                SvgPicture.asset(
                  withdrawLimitIcon,
                  width: 74.w,
                  height: 63..h,
                  colorFilter: ColorFilter.mode(
                    isLightTheme(context)
                        ? AppColors.aboutHeaderLight
                        : AppColors.whiteColor.withOpacity(0.25),
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(
                  height: 25..h,
                ),
                Text(
                  'Withdrawal request\nexceeds 24hr limit'.hardcoded,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 20.sp,
                        letterSpacing: -1.sp,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(
                  height: 20..h,
                ),
                Text(
                  'Contact admin for manual approval'.hardcoded,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: isLightTheme(context)
                            ? AppColors.aboutHeaderLight
                            : AppColors.whiteColor.withOpacity(0.5),
                        fontSize: 13.sp,
                        letterSpacing: -0.65.sp,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                SizedBox(
                  height: 20..h,
                ),
                MainButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PerditionTwoFaMobile(
                          onPermission2Fa: widget.withdrawWith2FA,
                        ),
                      ),
                    );
                  },
                  text: 'Submit',
                  height: 45..h,
                  color: MainColorsApp.accentColor,
                  disableColor: MainColorsApp.accentColor.withOpacity(0.5),
                  borderRadius: 25,
                  fontSize: 15,
                ),
                SizedBox(
                  height: 20..h,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(25.r),
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45..h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(
                        width: 1.w,
                        color: MainColorsApp.accentColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel'.hardcoded,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 15.sp,
                              letterSpacing: -0.75.sp,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

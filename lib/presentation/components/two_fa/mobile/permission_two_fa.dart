import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class PerditionTwoFaMobile extends StatefulHookConsumerWidget {
  const PerditionTwoFaMobile({
    this.onPermission2Fa,
    super.key,
  });

  final Function(String code)? onPermission2Fa;

  @override
  ConsumerState<PerditionTwoFaMobile> createState() =>
      _PerditionTwoFaMobileState();
}

class _PerditionTwoFaMobileState extends ConsumerState<PerditionTwoFaMobile> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerPin = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainBackgroundDarkColor,
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
                  '2FA',
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
            padding: EdgeInsets.only(top: 20..h, left: 15.w, right: 15.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 34.w,
                              height: 30..h,
                              child: SvgPicture.asset(twoFaHeaderIcon),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Confirmation'.hardcoded,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                                letterSpacing: -1.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20..h,
                ),
                Text(
                  'Enter 6-digit code using\nGoogle Authenticator'.hardcoded,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: isLightTheme(context)
                            ? AppColors.aboutHeaderLight
                            : AppColors.whiteColor.withOpacity(0.5),
                        fontSize: 15.sp,
                      ),
                ),
                SizedBox(
                  height: 20..h,
                ),
                Pinput(
                  focusedPinTheme: PinTheme(
                    width: 50.w,
                    height: 50.h,
                    textStyle:
                        Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w600,
                            ),
                    constraints:
                        BoxConstraints(minWidth: 50.w, minHeight: 50.h),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2.w,
                          color: MainColorsApp.accentColor,
                        ),
                      ),
                    ),
                  ),
                  controller: controllerPin,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  onChanged: (String value) {},
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: const TextInputType.numberWithOptions(),
                  length: 6,
                  defaultPinTheme: PinTheme(
                    width: 50.w,
                    height: 50.h,
                    textStyle:
                        Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w600,
                            ),
                    constraints:
                        BoxConstraints(minWidth: 40.w, minHeight: 50.h),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2.w,
                          color: isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : AppColors.whiteColor.withOpacity(0.25),
                        ),
                      ),
                    ),
                  ),
                  showCursor: true,
                  autofocus: true,
                  onCompleted: (String value) async {
                    if (value.length == (6)) {
                      await widget.onPermission2Fa!(value);
                    }
                  },
                  onSubmitted: (String value) async {
                    if (value.length == (6)) {
                      await widget.onPermission2Fa!(value);
                    }
                  },
                ),
                SizedBox(
                  height: 20..h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () async {
                      final clipboardData =
                          await Clipboard.getData(Clipboard.kTextPlain);
                      controllerPin.text = clipboardData!.text!.length == 6
                          ? clipboardData.text!
                          : '';
                    },
                    child: Container(
                      width: 70.w,
                      height: 25..h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.r),
                        color: MainColorsApp.accentColor,
                      ),
                      child: Center(
                        child: Text(
                          'Paste',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.whiteColor,
                                    fontSize: 13.sp,
                                    letterSpacing: -0.65.sp,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

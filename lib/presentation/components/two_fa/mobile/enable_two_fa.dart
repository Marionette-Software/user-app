import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/profile/actions/settings/two_fa.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/custom_pin_code_field.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class EnableTwoFaMobile extends StatefulHookConsumerWidget {
  const EnableTwoFaMobile({
    super.key,
    required this.res,
  });

  final String res;

  @override
  ConsumerState<EnableTwoFaMobile> createState() => _EnableTwoFaMobileState();
}

class _EnableTwoFaMobileState extends ConsumerState<EnableTwoFaMobile> {
  @override
  Widget build(BuildContext context) {
    String codeManual = widget.res.split('=')[1].split('&')[0];
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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20..h,
                left: 15.w,
                right: 15.w,
                bottom: MediaQuery.of(context).viewInsets.bottom + 50
                  ..h,
              ),
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
                                'Activation'.hardcoded,
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
                    tr('profile.generate_code'),
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
                  Align(
                    alignment: Alignment.center,
                    child: QrImageView(
                      data: widget.res,
                      gapless: true,
                      size: 150..h,
                      foregroundColor: isLightTheme(context)
                          ? AppColors.mainBackgroundDarkColor
                          : AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 20..h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        codeManual,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 15.sp,
                              letterSpacing: -0.75,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      IconButton(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(
                              text: codeManual,
                            ),
                          );

                          final snackBar = SnackBar(
                            elevation: 0,
                            padding: EdgeInsets.only(
                              bottom:
                                  // ignore: use_build_context_synchronously
                                  MediaQuery.viewInsetsOf(context).bottom + 30
                                    ..h,
                            ),
                            behavior: SnackBarBehavior.floating,
                            clipBehavior: Clip.none,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              titleFontSize: 20.sp,
                              messageFontSize: 15.sp,
                              title: tr('snack_bar_message.success.success'),
                              message: tr('snack_bar_message.success.copied'),
                              contentType: ContentType.success,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        },
                        icon: Icon(
                          Icons.copy,
                          color: MainColorsApp.accentColor,
                          size: 20.w,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 35..h,
                  ),
                  Text(
                    tr('profile.enter_fa'),
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
                  CustomPinCodeField(
                    controllerPin: controllerPin,
                    pinCodeLength: 6,
                    platformType: PlatformTypeState.mobile,
                    onCompleted: (String value) async {
                      TwoFaAction().enableTwoFa(
                        platformType: PlatformTypeState.mobile,
                        value: value,
                        context: context,
                        ref: ref,
                      );
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
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
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
      ),
    );
  }
}

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/profile/actions/settings/two_fa.dart';
import 'package:user_app/presentation/components/custom_pin_code_field.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class EnableTwoFa extends HookConsumerWidget {
  const EnableTwoFa({
    super.key,
    required this.res,
    required this.platformType,
  });

  final String res;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String codeManual = res.split('=')[1].split('&')[0];
    final TextEditingController controllerPin = TextEditingController();

    return SizedBox(
      width: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 600,
        tabletValue: 475,
        mobileValue: 320,
      ).w,
      height: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 625,
        tabletValue: 456,
        mobileValue: 370,
      ).h,
      child: MainDecorationContainerWeb(
        content: Padding(
          padding: EdgeInsets.only(
            left: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 41,
              tabletValue: 25,
              mobileValue: 30,
            ).w,
            right: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 41,
              tabletValue: 25,
              mobileValue: 30,
            ).w,
            top: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 20,
              tabletValue: 22,
              mobileValue: 24,
            ).h,
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
                            width: getSizeFromPlatformType(
                              platformType: platformType,
                              webValue: 50,
                              tabletValue: 30,
                              mobileValue: 25,
                            ).w,
                            height: getSizeFromPlatformType(
                              platformType: platformType,
                              webValue: 50,
                              tabletValue: 30,
                              mobileValue: 25,
                            ).h,
                            child: SvgPicture.asset(twoFaHeaderIcon),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            tr('profile.2fa_activation'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: getSizeFromPlatformType(
                                platformType: platformType,
                                webValue: 30,
                                tabletValue: 20,
                                mobileValue: 20,
                              ).sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 23,
                  tabletValue: 25,
                  mobileValue: 5,
                ).h,
              ),
              Text(
                tr('profile.generate_code'),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      fontSize: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 20,
                        tabletValue: 15,
                        mobileValue: 10,
                      ).sp,
                    ),
              ),
              SizedBox(
                height: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 25,
                  tabletValue: 25,
                  mobileValue: 15,
                ).h,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: QrImageView(
                    data: res,
                    gapless: true,
                    size: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 225,
                      tabletValue: 170,
                      mobileValue: 120,
                    ).h,
                    foregroundColor: isLightTheme(context)
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColorLight,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    codeManual,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 15,
                            tabletValue: 13,
                            mobileValue: 10,
                          ).sp,
                          color: Theme.of(context).primaryColorLight,
                        ),
                  ),
                  SizedBox(
                    width: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 16,
                      tabletValue: 15,
                      mobileValue: 10,
                    ).w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Clipboard.setData(
                            ClipboardData(
                              text: codeManual,
                            ),
                          );

                          final snackBar = SnackBar(
                            elevation: 0,
                            clipBehavior: Clip.none,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              titleFontSize: 30.sp,
                              messageFontSize: 20.sp,
                              title: tr('snack_bar_message.success.success'),
                              message: tr('snack_bar_message.success.copied'),
                              contentType: ContentType.success,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        },
                        child: Icon(
                          Icons.copy,
                          color: Theme.of(context).primaryColorLight,
                          size: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 25,
                            tabletValue: 25,
                            mobileValue: 14,
                          ).w,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 31,
                  tabletValue: 27,
                  mobileValue: 19,
                ).h,
              ),
              Text(
                tr('profile.enter_fa'),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      fontSize: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 20,
                        tabletValue: 15,
                        mobileValue: 10,
                      ).sp,
                    ),
              ),
              SizedBox(
                height: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 28,
                  tabletValue: 22,
                  mobileValue: 15,
                ).h,
              ),
              CustomPinCodeField(
                controllerPin: controllerPin,
                pinCodeLength: 6,
                platformType: platformType,
                onCompleted: (String value) async {
                  TwoFaAction().enableTwoFa(
                    platformType: PlatformTypeState.web,
                    value: value,
                    context: context,
                    ref: ref,
                  );
                },
              ),
              SizedBox(
                height:
                    platformType == PlatformTypeState.mobile ? (20..h) : 30.h,
              ),
              Align(
                alignment: platformType == PlatformTypeState.mobile
                    ? Alignment.centerRight
                    : Alignment.center,
                child: InkWell(
                  onTap: () async {
                    final clipboardData =
                        await Clipboard.getData(Clipboard.kTextPlain);
                    controllerPin.text = clipboardData!.text!.length == 6
                        ? clipboardData.text!
                        : '';
                  },
                  child: Container(
                    width:
                        platformType == PlatformTypeState.mobile ? 70.w : 92.w,
                    height: platformType == PlatformTypeState.mobile
                        ? (25..h)
                        : 35.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.r),
                      color: MainColorsApp.accentColor,
                    ),
                    child: Center(
                      child: Text(
                        'Paste',
                        style: platformType == PlatformTypeState.mobile
                            ? Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.whiteColor,
                                  fontSize: 13.sp,
                                  letterSpacing: -0.65.sp,
                                )
                            : Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.whiteColor,
                                  fontSize: 20.sp,
                                  letterSpacing: -1.sp,
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
    );
  }
}

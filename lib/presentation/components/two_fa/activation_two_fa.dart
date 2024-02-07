import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/infrastructure/two_fa/two_fa_service.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/settings_tab/components/two_fa/enable_two_fa.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/components/main_show_modal_bottom_sheet.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class ActivationTwoFa extends StatelessWidget {
  const ActivationTwoFa({
    required this.platformType,
    required this.activateMessage,
    super.key,
  });

  final PlatformTypeState platformType;
  final String activateMessage;

  @override
  Widget build(BuildContext context) {
    return MainDecorationContainerWeb(
      content: SizedBox(
        width: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 600,
          tabletValue: 475,
          mobileValue: 320,
        ).w,
        height: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 265,
          tabletValue: 230,
          mobileValue: 250,
        ).h,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 50,
              tabletValue: 50,
              mobileValue: 60,
            ).h,
            top: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 25,
              tabletValue: 25,
              mobileValue: 23,
            ).h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
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
                            child: SvgPicture.asset(
                              twoFaHeaderIcon,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            tr('profile.2fa_activation_is_required'),
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
                  webValue: 20,
                  tabletValue: 10,
                  mobileValue: 14,
                ).h,
              ),
              Text(
                activateMessage,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
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
                  webValue: 27,
                  tabletValue: 25,
                  mobileValue: 15,
                ).h,
              ),
              SizedBox(
                width: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 425,
                  tabletValue: 425,
                  mobileValue: 270,
                ).w,
                child: MainButton(
                  onTap: () async {
                    await TwoFaService().getTwoFaDetails().then(
                      (response) {
                       context.pop();
                        platformType == PlatformTypeState.mobile
                            ? mainShowModalBottomSheet(
                                context: context,
                                longShowModalBottom: false,
                                content: Container(
                                  color: Colors.transparent,
                                  child: EnableTwoFa(
                                    platformType: platformType,
                                    res: response,
                                  ),
                                ),
                              )
                            : showDialog(
                                barrierColor: AppColors.placeHolderGrey,
                                context: context,
                                builder: (context) => ModalWindowWallet(
                                  titleSize: getSizeFromPlatformType(
                                    platformType: platformType,
                                    webValue: 30,
                                    tabletValue: 20,
                                    mobileValue: 20,
                                  ),
                                  title: '',
                                  content: EnableTwoFa(
                                    res: response,
                                    platformType: platformType,
                                  ),
                                  width: getSizeFromPlatformType(
                                    platformType: platformType,
                                    webValue: 200,
                                    tabletValue: 300,
                                    mobileValue: 130,
                                  ).w,
                                ),
                              );
                      },
                    );
                  },
                  fontSize: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 20,
                    tabletValue: 15,
                    mobileValue: 13,
                  ),
                  text: tr('profile.activate_now'),
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 45,
                    tabletValue: 45,
                    mobileValue: 35,
                  ).h,
                  disableColor: MainColorsApp.accentColor.withOpacity(0.5),
                  color: MainColorsApp.accentColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

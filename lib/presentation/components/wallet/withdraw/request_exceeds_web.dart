import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/components/main_show_modal_bottom_sheet.dart';
import 'package:user_app/presentation/components/two_fa/withdraw_2fa.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class RequestExceeds extends HookConsumerWidget {
  const RequestExceeds({
    required this.platformType,
    this.withdrawWith2FA,
    super.key,
  });

  final PlatformTypeState platformType;
  final Function(String code)? withdrawWith2FA;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          webValue: 371,
          tabletValue: 296,
          mobileValue: 272,
        ).h,
        child: Padding(
          padding: EdgeInsets.only(
            top: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 30,
              tabletValue: 25,
              mobileValue: 30,
            ).h,
            bottom: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 50,
              tabletValue: 50,
              mobileValue: 61,
            ).h,
            left: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 25,
              tabletValue: 25,
              mobileValue: 25,
            ).w,
            right: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 25,
              tabletValue: 25,
              mobileValue: 25,
            ).w,
          ),
          child: Column(
            children: [
              Text(
                tr('wallet.withdrawal_request_exceeds'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 30,
                    tabletValue: 20,
                    mobileValue: 15,
                  ).sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 25,
                  tabletValue: 25,
                  mobileValue: 17,
                ).h,
              ),
              Text(
                tr('wallet.contact_admin_for_manual_approval'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 20,
                    tabletValue: 15,
                    mobileValue: 13,
                  ).sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 25,
                  tabletValue: 25,
                  mobileValue: 21,
                ).h,
              ),
              MainButton(
                onTap: () {
                  context.pop();

                  if (platformType == PlatformTypeState.mobile) {
                    mainShowModalBottomSheet(
                      context: context,
                      longShowModalBottom: false,
                      content: Withdraw2Fa(
                        platformType: platformType,
                        onPermission2Fa: withdrawWith2FA,
                      ),
                    );
                  } else {
                    showDialog(
                      barrierColor: AppColors.placeHolderGrey,
                      context: context,
                      builder: (context) => ModalWindowWallet(
                        titleSize: 30,
                        title: '',
                        content: Withdraw2Fa(
                          platformType: platformType,
                          onPermission2Fa: withdrawWith2FA,
                        ),
                      ),
                    );
                  }
                },
                fontSize: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 20,
                  tabletValue: 15,
                  mobileValue: 13,
                ),
                disableColor: MainColorsApp.accentColor.withOpacity(0.5),
                text: tr('wallet.ok'),
                height: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 60,
                  tabletValue: 45,
                  mobileValue: 35,
                ).h,
                color: Theme.of(context).primaryColorLight,
                borderRadius: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 10,
                  tabletValue: 10,
                  mobileValue: 5,
                ),
              ),
              SizedBox(
                height: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 25,
                  tabletValue: 15,
                  mobileValue: 9,
                ).h,
              ),
              InkWell(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  width: double.infinity,
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 60,
                    tabletValue: 45,
                    mobileValue: 35,
                  ).h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 10,
                        tabletValue: 10,
                        mobileValue: 5,
                      ).r,
                    ),
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      tr('wallet.cancel'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: getSizeFromPlatformType(
                          platformType: platformType,
                          webValue: 20,
                          tabletValue: 15,
                          mobileValue: 13,
                        ).sp,
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
    );
  }
}

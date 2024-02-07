import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/two_fa/two_fa_state_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/profile/actions/show_profile_modal.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/settings_tab/components/log_out_button.dart';
import 'package:user_app/presentation/app/profile/mobile/components/switch_theme_mobile.dart';
import 'package:user_app/presentation/app/profile/web/components/api_key/api_key_web.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class Settings extends HookConsumerWidget {
  const Settings({
    required this.platformType,
    super.key,
  });

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final twoFAWatch = ref.watch(twoFaProvider);

    return Column(
      children: [
        SizedBox(
          height: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 70,
            tabletValue: 70,
            mobileValue: 60,
          ).h,
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  tr('profile.2fa_status'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: getSizeFromPlatformType(
                          platformType: platformType,
                          webValue: 20,
                          tabletValue: 15,
                          mobileValue: 13,
                        ).sp,
                      ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Switch(
                      value: twoFAWatch == false ? false : true,
                      onChanged: (value) async {
                        ShowProfileModalAction().showTwoFaModal(
                          context: context,
                          ref: ref,
                          platformType: platformType,
                        );
                      },
                      activeTrackColor:
                          MainColorsApp.greenColor.withOpacity(0.5),
                      activeColor: MainColorsApp.greenColor,
                      inactiveTrackColor: MainColorsApp.redColor,
                      inactiveThumbColor:
                          MainColorsApp.redColor.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        platformType != PlatformTypeState.mobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: isLightTheme(context)
                        ? dividerColor
                        : AppColors.whiteColor.withOpacity(0.25),
                    height: 1,
                  ),
                ],
              )
            : const SizedBox(),
        platformType != PlatformTypeState.mobile
            ? InkWell(
                onTap: () async {
                  context.go(ApiKeyWeb.routeName);
                },
                child: SizedBox(
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 70,
                    tabletValue: 70,
                    mobileValue: 60,
                  ).h,
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          tr('profile.api_keys'),
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: getSizeFromPlatformType(
                                      platformType: platformType,
                                      webValue: 20,
                                      tabletValue: 15,
                                      mobileValue: 13,
                                    ).sp,
                                  ),
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        leftLogoPath,
                        width: getSizeFromPlatformType(
                          platformType: platformType,
                          webValue: 8,
                          tabletValue: 9,
                          mobileValue: 7.5,
                        ).w,
                        height: 13.h,
                        colorFilter: ColorFilter.mode(
                          isLightTheme(context)
                              ? AppColors.backgroundFormColor
                              : AppColors.whiteColor,
                          BlendMode.srcIn,
                        ),
                      )
                    ],
                  ),
                ),
              )
            : const SizedBox(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(
              color: isLightTheme(context)
                  ? dividerColor
                  : AppColors.whiteColor.withOpacity(0.25),
              height: 1,
            ),
          ],
        ),
        InkWell(
          onTap: () {
            ShowProfileModalAction().showChangePasswordModal(
              context: context,
              platformType: platformType,
            );
          },
          child: SizedBox(
            height: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 70,
              tabletValue: 70,
              mobileValue: 60,
            ).h,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    tr('profile.title_change_password'),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 20,
                            tabletValue: 15,
                            mobileValue: 13,
                          ).sp,
                        ),
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  leftLogoPath,
                  width: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 8,
                    tabletValue: 9,
                    mobileValue: 7.5,
                  ).w,
                  height: 13.h,
                  colorFilter: ColorFilter.mode(
                    isLightTheme(context)
                        ? AppColors.backgroundFormColor
                        : AppColors.whiteColor,
                    BlendMode.srcIn,
                  ),
                )
              ],
            ),
          ),
        ),
        platformType == PlatformTypeState.mobile
            ? const SwitchThemeMobile()
            : const SizedBox(),
        SizedBox(
          height: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 47,
            tabletValue: 45,
            mobileValue: 12,
          ).h,
        ),
        LogOutButton(
          platformType: platformType,
        )
      ],
    );
  }
}

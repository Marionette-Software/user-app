import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/presentation/app/trade/mobile/trade_mobile.dart';
import 'package:user_app/presentation/auth/authentication.dart';
import 'package:user_app/presentation/auth/mobile/components/drawer/components/drawer_divider.dart';
import 'package:user_app/presentation/auth/mobile/components/drawer/components/drawer_item.dart';
import 'package:user_app/presentation/components/theme_switch.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class AuthDrawer extends StatelessWidget {
  const AuthDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    return Drawer(
      width: 310.w,
      child: Container(
        width: 310.w,
        decoration: BoxDecoration(
          color: isLightTheme(context)
              ? AppColors.whiteColor
              : walletBackgroundColor,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 30..h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr('authorization.welcome'),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -1.5.sp,
                          ),
                    ),
                    ThemeSwitch(
                      width: 53.w,
                      height: 26..h,
                      borderRadius: 20.0.w.h,
                      toggleSize: 18.0..h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 38..h,
              ),
              DrawerItem(
                title: "Login".hardcoded,
                leading: Padding(
                  padding: EdgeInsets.only(
                    right: 10.w,
                  ),
                  child: SvgPicture.asset(
                    accountTab,
                    colorFilter: ColorFilter.mode(
                      isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.25),
                      BlendMode.srcIn,
                    ),
                    height: 14..h,
                    width: 14.w,
                  ),
                ),
                trailingOnTap: () {
                  context.go(Authentication.routeName);
                },
              ),
              globalData.enabledTradingPage
                  ? Column(
                      children: [
                        const DrawerDivider(),
                        DrawerItem(
                          title: tr('authorization.trade'),
                          leading: Padding(
                            padding: EdgeInsets.only(
                              right: 11.w,
                            ),
                            child: SvgPicture.asset(
                              tradeTab,
                              colorFilter: ColorFilter.mode(
                                isLightTheme(context)
                                    ? AppColors.aboutHeaderLight
                                    : AppColors.whiteColor.withOpacity(0.25),
                                BlendMode.srcIn,
                              ),
                              height: 14..h,
                              width: 14.w,
                            ),
                          ),
                          trailingOnTap: () {
                            context.go(TradeMobile.routeName);
                          },
                        ),
                      ],
                    )
                  : const SizedBox(),
              const DrawerDivider(),
              DrawerItem(
                title: tr('authorization.language'),
                trailing: Text(
                  getSelectedLanguage(context),
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.75.sp,
                    color: isLightTheme(context)
                        ? AppColors.aboutHeaderLight
                        : AppColors.whiteColor.withOpacity(0.5),
                  ),
                ),
                trailingOnTap: () {},
                leading: Padding(
                  padding: EdgeInsets.only(
                    right: 8.47.w,
                  ),
                  child: SvgPicture.asset(
                    languageColorTab,
                    colorFilter: ColorFilter.mode(
                      isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.25),
                      BlendMode.srcIn,
                    ),
                    height: 14..h,
                    width: 14.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getSelectedLanguage(BuildContext context) {
    var s = context.locale.toString();
    switch (s) {
      case "en_US":
        return "English";
    }
    return "English";
  }
}

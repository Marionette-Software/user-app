import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/history/history.dart';
import 'package:user_app/presentation/app/profile/web/components/referral_user.dart/referral_user_web.dart';
import 'package:user_app/presentation/app/user_orders/user_orders.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class Details extends StatelessWidget {
  const Details({
    required this.platformType,
    super.key,
  });

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    return Column(
      children: [
        InkWell(
          onTap: () async {
            context.go(History.routeName);
          },
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 70,
                  tabletValue: 70,
                  mobileValue: 60,
                ).h,
                child: Text(
                  tr('profile.history'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
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
        globalData.enabledTradingPage
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: isLightTheme(context)
                        ? dividerColor
                        : AppColors.whiteColor.withOpacity(0.25),
                    height: 1,
                  ),
                  InkWell(
                    onTap: () async {
                      context.go(UserOrders.routeName);
                    },
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 70,
                            tabletValue: 70,
                            mobileValue: 60,
                          ).h,
                          child: Text(
                            tr('profile.open_orders'),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: getSizeFromPlatformType(
                                      platformType: platformType,
                                      webValue: 20,
                                      tabletValue: 15,
                                      mobileValue: 13,
                                    ).sp),
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
                ],
              )
            : const SizedBox(),
        globalData.enabledReferrals
            ? Column(
                children: [
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
                    onTap: () async {
                      context.go(ReferralUserWeb.routeName);
                    },
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 70,
                            tabletValue: 70,
                            mobileValue: 60,
                          ).h,
                          child: Text(
                            'Referrals'.hardcoded,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: getSizeFromPlatformType(
                                      platformType: platformType,
                                      webValue: 20,
                                      tabletValue: 15,
                                      mobileValue: 13,
                                    ).sp),
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
                  )
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}

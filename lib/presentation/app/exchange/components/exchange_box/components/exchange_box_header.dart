import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ExchangeBoxHeader extends StatelessWidget {
  const ExchangeBoxHeader({
    required this.platformType,
    Key? key,
  }) : super(key: key);

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 300.w,
            tabletValue: 238.w,
            mobileValue: 150.w,
          ),
          height: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 58.h,
            tabletValue: 45.h,
            mobileValue: 35.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 10,
                  tabletValue: 10,
                  mobileValue: 5,
                ),
              ),
            ),
            color: Colors.transparent,
          ),
          child: Center(
            child: SizedBox(
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 24,
                tabletValue: 18,
                mobileValue: 16,
              ),
              child: AutoSizeText(
                tr('non_custodial_exchange.exchange_tab'),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 20,
                      tabletValue: 15,
                      mobileValue: 13,
                    ),
                    color: isLightTheme(context)
                        ? AppColors.mainBackgroundDarkColor
                        : AppColors.whiteColor),
              ),
            ),
          ),
        ),
        Container(
          height: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 58.h,
            tabletValue: 45.h,
            mobileValue: 35.h,
          ),
          width: 1.w,
          color: Theme.of(context).primaryColor.withOpacity(0.25),
        ),
        Column(
          children: [
            Container(
              width: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 300.w,
                tabletValue: 238.w,
                mobileValue: 150.w,
              ),
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 58.h,
                tabletValue: 45.h,
                mobileValue: 35.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 10,
                      tabletValue: 10,
                      mobileValue: 5,
                    ),
                  ),
                ),
                color: Theme.of(context).primaryColor.withOpacity(0.05),
              ),
              child: Center(
                child: SizedBox(
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 24,
                    tabletValue: 18,
                    mobileValue: 16,
                  ),
                  child: AutoSizeText(
                    tr('non_custodial_exchange.buy_sell_crypto'),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 20,
                            tabletValue: 15,
                            mobileValue: 13,
                          ),
                          color: isLightTheme(context)
                              ? AppColors.mainBackgroundDarkColor
                                  .withOpacity(0.5)
                              : AppColors.whiteColor.withOpacity(0.5),
                        ),
                  ),
                ),
              ),
            ),
            Container(
              height: 1.h,
              width: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 300.w,
                tabletValue: 238.w,
                mobileValue: 150.w,
              ),
              color: Theme.of(context).primaryColor.withOpacity(0.25),
            ),
          ],
        ),
      ],
    );
  }
}

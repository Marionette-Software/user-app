import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MarketPriceContainer extends StatelessWidget {
  const MarketPriceContainer({
    super.key,
    required this.platformType,
  });

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSizeFromPlatformType(
        platformType: platformType,
        webValue: double.infinity,
        tabletValue: 330,
        mobileValue: double.infinity,
      ).w,
      height: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 50,
        tabletValue: 40,
        mobileValue: 28,
      ).h,
      padding: EdgeInsets.only(
        top: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 6,
          tabletValue: 8,
          mobileValue: 5,
        ).h,
        bottom: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 0,
          tabletValue: 8,
          mobileValue: 0,
        ).h,
        left: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 15,
          tabletValue: 15,
          mobileValue: 15,
        ).w,
        right: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 15,
          tabletValue: 15,
          mobileValue: 15,
        ).w,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            tr('trade.price'),
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 15,
                    tabletValue: 13,
                    mobileValue: 15,
                  ).sp,
                  color: isLightTheme(context)
                      ? AppColors.aboutHeaderLight
                      : AppColors.whiteColor.withOpacity(0.5),
                ),
          ),
          const Spacer(),
          Text(
            tr('trade.market'),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 20,
                    tabletValue: 15,
                    mobileValue: 25,
                  ).sp,
                  fontWeight: FontWeight.w600,
                  color: isLightTheme(context)
                      ? AppColors.aboutHeaderLight
                      : AppColors.whiteColor.withOpacity(0.5),
                ),
          ),
        ],
      ),
    );
  }
}

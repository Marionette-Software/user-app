import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class OrderSelectorItem extends StatelessWidget {
  const OrderSelectorItem({
    Key? key,
    required this.title,
    required this.onTap,
    required this.active,
    required this.platformType,
  }) : super(key: key);

  final String title;
  final Function() onTap;
  final bool active;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        width: 60.w,
        height: platformType == PlatformTypeState.mobile ? (25..h) : 25.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: active
              ? MainColorsApp.accentColor
              : isLightTheme(context)
                  ? AppColors.mainBackgroundLightColor
                  : Colors.white.withOpacity(0.25),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 15,
                    tabletValue: 13,
                    mobileValue: 12,
                  ).sp,
                  letterSpacing: -0.75.sp,
                  fontWeight: FontWeight.w500,
                  color: active
                      ? AppColors.whiteColor
                      : isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor,
                ),
          ),
        ),
      ),
    );
  }
}

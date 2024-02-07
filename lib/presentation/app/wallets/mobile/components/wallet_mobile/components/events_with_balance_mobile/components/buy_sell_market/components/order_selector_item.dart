import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class OrderSelectorItemMobile extends StatelessWidget {
  const OrderSelectorItemMobile({
    Key? key,
    required this.title,
    required this.onTap,
    required this.active,
  }) : super(key: key);

  final String title;
  final Function() onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60.w,
        height: 25..h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: active
              ? MainColorsApp.accentColor
              : isLightTheme(context)
                  ? AppColors.mainBackgroundLightColor
                  : AppColors.whiteColor.withOpacity(0.05),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.65,
                  color: isLightTheme(context)
                      ? active
                          ? AppColors.whiteColor
                          : AppColors.aboutHeaderLight
                      : AppColors.whiteColor,
                ),
          ),
        ),
      ),
    );
  }
}

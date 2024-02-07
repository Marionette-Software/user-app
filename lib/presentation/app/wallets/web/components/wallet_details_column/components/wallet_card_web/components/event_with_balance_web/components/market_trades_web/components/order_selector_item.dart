import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class OrderSelectorItemWeb extends StatelessWidget {
  const OrderSelectorItemWeb({
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
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        width: 60.w,
        height: 25.h,
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
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.75,
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

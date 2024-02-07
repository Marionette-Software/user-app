import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class FilterOperationsItemMobile extends StatelessWidget {
  const FilterOperationsItemMobile({
    super.key,
    required this.text,
    required this.isSelected,
  });
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25..h,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isLightTheme(context)
              ? (isSelected
                  ? Theme.of(context).primaryColorLight
                  : AppColors.separatorLightTheme)
              : (isSelected
                  ? Theme.of(context).primaryColorLight
                  : AppColors.whiteColor.withOpacity(0.25)),
          borderRadius: BorderRadius.circular(19.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.65.sp,
                color: isLightTheme(context)
                    ? (isSelected
                        ? AppColors.whiteColor
                        : AppColors.mobileBackButtonColor)
                    : (AppColors.whiteColor)),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

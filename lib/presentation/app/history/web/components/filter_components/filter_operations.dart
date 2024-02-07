import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class FilterOperationsComponentWeb extends StatelessWidget {
  const FilterOperationsComponentWeb({
    super.key,
    required this.text,
    required this.isSelected,
  });
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isLightTheme(context)
            ? (isSelected
                ? Theme.of(context).primaryColorLight
                : Colors.transparent)
            : (isSelected
                ? Theme.of(context).primaryColorLight
                : AppColors.whiteColor.withOpacity(0.05)),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isLightTheme(context)
              ? (isSelected == true
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).primaryColor.withOpacity(0.25))
              : (isSelected == true
                  ? Theme.of(context).primaryColorLight
                  : AppColors.whiteColor.withOpacity(0.05)),
          width: 1.w,
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 15.sp,
              color: isLightTheme(context)
                  ? (isSelected
                      ? AppColors.whiteColor
                      : Theme.of(context).primaryColorLight)
                  : AppColors.whiteColor,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.75.sp,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

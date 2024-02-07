import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class FilterMarketItemByIdWeb extends StatefulWidget {
  const FilterMarketItemByIdWeb({
    super.key,
    this.onTap,
    required this.text,
    this.isSelected = false,
  });

  final String text;
  final bool isSelected;
  final Function(String market)? onTap;

  @override
  State<FilterMarketItemByIdWeb> createState() =>
      _FilterMarketItemByIdWebState();
}

class _FilterMarketItemByIdWebState extends State<FilterMarketItemByIdWeb> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onHover: (value) {
          setState(() {
            hovered = !hovered;
          });
        },
        onTap: () {
          widget.onTap!(widget.text);
        },
        borderRadius: BorderRadius.circular(25.r),
        splashColor: Colors.transparent,
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: hovered
                ? isLightTheme(context)
                    ? AppColors.mainBackgroundDarkColor.withOpacity(0.25)
                    : AppColors.whiteColor.withOpacity(0.5)
                : (widget.isSelected
                    ? isLightTheme(context)
                        ? AppColors.mainBackgroundDarkColor
                        : AppColors.whiteColor
                    : isLightTheme(context)
                        ? AppColors.mainBackgroundLightColor
                        : AppColors.whiteColor.withOpacity(0.25)),
            borderRadius: BorderRadius.circular(25.r),
          ),
          duration: const Duration(milliseconds: 300),
          child: IgnorePointer(
            child: Text(
              widget.text,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 15.sp,
                    color: widget.isSelected
                        ? isLightTheme(context)
                            ? AppColors.whiteColor
                            : AppColors.darkColorText
                        : isLightTheme(context)
                            ? AppColors.aboutHeaderLight
                            : AppColors.whiteColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.75.sp,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class DetailItemComponentMobile extends StatelessWidget {
  const DetailItemComponentMobile({
    super.key,
    required this.name,
    required this.value,
    required this.isBorder,
    this.valueColor = MainColorsApp.primaryOp25Color,
    this.alt = '',
  });

  final String name;
  final String value;
  final bool isBorder;
  final String alt;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49..h,
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : AppColors.whiteColor.withOpacity(0.05),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 15.sp,
                  letterSpacing: -0.75.sp,
                  fontWeight: FontWeight.w500,
                  color: isLightTheme(context)
                      ? AppColors.aboutHeaderLight
                      : AppColors.whiteColor.withOpacity(0.5),
                ),
          ),
          const Spacer(),
          alt == ''
              ? Text(
                  value,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 15.sp,
                        color: valueColor,
                        letterSpacing: -0.75.sp,
                        fontWeight: FontWeight.w500,
                      ),
                )
              : Tooltip(
                  message: alt,
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColorLight),
                  textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 15.sp,
                        color: AppColors.whiteColor,
                      ),
                  child: Text(
                    value,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 15.sp,
                          letterSpacing: -0.75.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
        ],
      ),
    );
  }
}

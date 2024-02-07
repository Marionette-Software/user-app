import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class TradeTabBarItem extends StatelessWidget {
  const TradeTabBarItem({
    Key? key,
    required this.onTap,
    required this.active,
    required this.title,
    required this.side,
    required this.platformType,
  }) : super(key: key);

  final Function() onTap;
  final bool active;
  final String title;
  final String side;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: isLightTheme(context)
              ? (active ? AppColors.whiteColorText : MainColorsApp.cardColor)
              : (active
                  ? Colors.transparent
                  : AppColors.whiteColor.withOpacity(0.1)),
          borderRadius: side == 'left'
              ? BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                )
              : BorderRadius.only(
                  topRight: Radius.circular(10.r),
                ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 20.sp,
                  letterSpacing: -1.sp,
                  fontWeight: FontWeight.w600,
                  color: isLightTheme(context)
                      ? (active
                          ? AppColors.mainBackgroundDarkColor
                          : AppColors.aboutHeaderLight)
                      : (active
                          ? AppColors.whiteColor
                          : AppColors.whiteColor.withOpacity(0.5)),
                ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class AppBarItem extends StatelessWidget {
  const AppBarItem({
    super.key,
    required this.platformType,
    required this.tabIndex,
    required this.title,
    required this.selectTabIndex,
  });

  final PlatformTypeState platformType;
  final int tabIndex;
  final String title;
  final int selectTabIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 166,
        tabletValue: 130,
        mobileValue: 85,
      ).w,
      height: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 60,
        tabletValue: 47,
        mobileValue: 35,
      ).h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          getSizeFromPlatformType(
            platformType: platformType,
            webValue: 10,
            tabletValue: 10,
            mobileValue: 5,
          ).r,
        ),
        color: isLightTheme(context)
            ? tabIndex == selectTabIndex
                ? Theme.of(context).primaryColorLight
                : cardColor
            : tabIndex == selectTabIndex
                ? Theme.of(context).primaryColorLight
                : Colors.transparent,
        border: Border.all(
          color: isLightTheme(context)
              ? tabIndex == selectTabIndex
                  ? Theme.of(context).primaryColorLight
                  : Colors.transparent
              : tabIndex == selectTabIndex
                  ? Theme.of(context).primaryColorLight
                  : AppColors.whiteColor,
        ),
      ),
      child: Tab(
        child: Text(
          title,
          style: platformType == PlatformTypeState.web
              ? Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: tabIndex == selectTabIndex
                        ? AppColors.whiteColorText
                        : Theme.of(context).primaryColor,
                    fontSize: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 20,
                      tabletValue: 18,
                      mobileValue: 13,
                    ).sp,
                  )
              : Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 20,
                      tabletValue: 18,
                      mobileValue: 13,
                    ).sp,
                    color: tabIndex == selectTabIndex
                        ? AppColors.whiteColorText
                        : Theme.of(context).primaryColor,
                  ),
        ),
      ),
    );
  }
}

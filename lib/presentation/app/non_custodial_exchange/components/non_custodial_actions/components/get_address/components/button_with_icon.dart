import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    super.key,
    required this.title,
    this.iconUrl,
    required this.isActive,
    required this.platformType,
  });

  final String title;
  final String? iconUrl;
  final bool isActive;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 173,
        tabletValue: 136,
        mobileValue: 75,
      ).w,
      height: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 60,
        tabletValue: 45,
        mobileValue: 35,
      ).h,
      decoration: BoxDecoration(
        border: Border.all(
          color: isActive
              ? Theme.of(context).primaryColorLight
              : AppColors.whiteColor.withOpacity(0.25),
          width: 1,
        ),
        color: isLightTheme(context)
            ? (!isActive ? cardColor : Theme.of(context).primaryColorLight)
            : (!isActive
                ? Colors.transparent
                : Theme.of(context).primaryColorLight),
        borderRadius: BorderRadius.circular(
          getSizeFromPlatformType(
            platformType: platformType,
            webValue: 10,
            tabletValue: 10,
            mobileValue: 5,
          ),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserAppImage(
              clipBehavior: Clip.hardEdge,
              path: iconUrl!,
              width: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 30,
                tabletValue: 25,
                mobileValue: 15,
              ).w,
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 30,
                tabletValue: 25,
                mobileValue: 15,
              ).h,
              isNetwork: true,
            ),
            SizedBox(
              width: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 11.15,
                tabletValue: 10,
                mobileValue: 6,
              ).w,
            ),
            SizedBox(
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 20,
                tabletValue: 18,
                mobileValue: 12,
              ).h,
              child: AutoSizeText(
                title,
                minFontSize: 3,
                maxFontSize: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 20,
                  tabletValue: 15,
                  mobileValue: 12,
                ),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 20,
                        tabletValue: 15,
                        mobileValue: 10,
                      ),
                      color: isActive
                          ? AppColors.whiteColor
                          : Theme.of(context).textTheme.titleMedium!.color!,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

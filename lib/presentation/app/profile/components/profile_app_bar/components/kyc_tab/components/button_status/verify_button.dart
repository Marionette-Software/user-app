import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class VerifyButton extends StatelessWidget {
  const VerifyButton({
    super.key,
    required this.onTap,
    required this.platformType,
  });

  final Function() onTap;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 154,
        tabletValue: 118,
        mobileValue: 71,
      ).w,
      height: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 40,
        tabletValue: 30,
        mobileValue: 20,
      ).h,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              isLightTheme(context)
                  ? AppColors.whiteColor
                  : Colors.transparent),
          shadowColor: MaterialStateProperty.all<Color>(
            borderButtonProfileBorder,
          ),
          elevation: MaterialStateProperty.all(12),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 12,
                    tabletValue: 10,
                    mobileValue: 5,
                  ).r,
                ),
              ),
              side: BorderSide(
                color: isLightTheme(context)
                    ? Theme.of(context).primaryColor.withOpacity(0.25)
                    : Theme.of(context).primaryColorLight,
              ),
            ),
          ),
        ),
        onPressed: onTap,
        child: Center(
          child: Text(
            tr('profile.verify'),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 20,
                    tabletValue: 15,
                    mobileValue: 13,
                  ).sp,
                  color: isLightTheme(context)
                      ? Theme.of(context).primaryColorLight
                      : AppColors.whiteColor,
                ),
          ),
        ),
      ),
    );
  }
}

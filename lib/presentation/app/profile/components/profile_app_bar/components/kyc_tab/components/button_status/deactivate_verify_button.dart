import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class DeactivateVerifyButton extends StatelessWidget {
  const DeactivateVerifyButton({
    required this.platformType,
    super.key,
  });

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.25,
      child: SizedBox(
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
              AppColors.inputEventColor.withOpacity(0.2),
            ),
            elevation: MaterialStateProperty.all(8),
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
                      : AppColors.whiteColor,
                ),
              ),
            ),
          ),
          onPressed: () {
            final snackBar = SnackBar(
              elevation: 0,
              clipBehavior: Clip.none,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                titleFontSize: 30.sp,
                messageFontSize: 20.sp,
                title: tr('snack_bar_message.errors.error'),
                message: tr('snack_bar_message.errors.pass_verification'),
                contentType: ContentType.failure,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          },
          child: Center(
            child: Text(
              tr('profile.verify'),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 20,
                    tabletValue: 15,
                    mobileValue: 13,
                  ).sp,
                  fontWeight: FontWeight.w600,
                  color: isLightTheme(context)
                      ? Theme.of(context).primaryColorLight
                      : AppColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}

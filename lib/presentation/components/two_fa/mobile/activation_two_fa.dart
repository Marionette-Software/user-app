import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/infrastructure/two_fa/two_fa_service.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/two_fa/mobile/enable_two_fa.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ActivationTwoFaMobile extends HookConsumerWidget {
  const ActivationTwoFaMobile({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 326..h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        color: isLightTheme(context)
            ? AppColors.whiteColor
            : walletBackgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10..h, left: 15.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 60.w,
              height: 5..h,
              decoration: BoxDecoration(
                color: isLightTheme(context)
                    ? AppColors.aboutHeaderLight
                    : AppColors.whiteColor.withOpacity(0.25),
                borderRadius: BorderRadius.circular(17.r),
              ),
            ),
            SizedBox(
              height: 20..h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 34.w,
                  height: 30..h,
                  child: SvgPicture.asset(twoFaHeaderIcon),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  '2FA Activation is Required'.hardcoded,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                    letterSpacing: -1.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 23..h,
            ),
            Text(
              title.hardcoded,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isLightTheme(context)
                    ? AppColors.aboutHeaderLight
                    : AppColors.whiteColor.withOpacity(0.5),
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
                letterSpacing: -0.75.sp,
              ),
            ),
            SizedBox(
              height: 20..h,
            ),
            MainButton(
              onTap: () async {
                await TwoFaService().getTwoFaDetails().then((response) {
                  context.pop();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EnableTwoFaMobile(
                        res: response,
                      ),
                    ),
                  );
                });
              },
              text: 'Activate now'.hardcoded,
              height: 45..h,
              disableColor: MainColorsApp.accentColor.withOpacity(0.5),
              color: MainColorsApp.accentColor,
              borderRadius: 25,
              fontSize: 15,
            ),
          ],
        ),
      ),
    );
  }
}

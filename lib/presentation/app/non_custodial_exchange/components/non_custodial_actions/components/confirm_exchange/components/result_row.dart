import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ResultRowWeb extends StatelessWidget {
  const ResultRowWeb({
    super.key,
    required this.iconUrl,
    required this.title,
    required this.address,
  });

  final String? iconUrl;
  final String title;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: isLightTheme(context)
            ? bgElementColor
            : AppColors.whiteColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 15.h,
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                  child: AutoSizeText(
                    title,
                    minFontSize: 3,
                    maxFontSize: 15,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 15,
                          color: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .color!
                              .withOpacity(0.5),
                        ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: 438.w,
                  height: 24.h,
                  child: AutoSizeText(
                    address,
                    maxFontSize: 20,
                    minFontSize: 3,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            UserAppImage(
              clipBehavior: Clip.hardEdge,
              path: iconUrl!,
              width: 73.w,
              height: 73.h,
              isNetwork: true,
            )
          ],
        ),
      ),
    );
  }
}

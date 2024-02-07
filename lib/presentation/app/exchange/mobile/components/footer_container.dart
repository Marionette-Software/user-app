import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class FooterContainerExchangeMobile extends StatelessWidget {
  const FooterContainerExchangeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 67.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 145.w,
              height: 25.h,
              child: UserAppImage(
                path: isLightTheme(context) ? appLogoPath : appLogoPathDark,
              ),
            ),
            SizedBox(
              height: 13.h,
              child: AutoSizeText(
                tr('non_custodial_exchange.all_right_reserved'),
                minFontSize: 5,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 6.5.h,
        )
      ],
    );
  }
}

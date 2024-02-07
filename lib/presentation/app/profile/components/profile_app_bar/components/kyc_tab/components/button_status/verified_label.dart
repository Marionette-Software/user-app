import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class VerifiedLabel extends StatelessWidget {
  const VerifiedLabel({
    required this.platformType,
    Key? key,
  }) : super(key: key);

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 70,
          tabletValue: 70,
          mobileValue: 60,
        ).h,
        width: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 118,
          tabletValue: 118,
          mobileValue: 71,
        ).w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              verificationLogoPath,
              width: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 18,
                tabletValue: 18,
                mobileValue: 15,
              ).w,
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 18,
                tabletValue: 18,
                mobileValue: 15,
              ).h,
            ),
            SizedBox(
              width: 6.w,
            ),
            Text(
              tr('profile.verified'),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: MainColorsApp.greenColor,
                    fontSize: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 20,
                      tabletValue: 15,
                      mobileValue: 13,
                    ).sp,
                  ),
            )
          ],
        ),
      ),
    );
  }
}

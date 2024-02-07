import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class NotVerifyLabel extends StatelessWidget {
  const NotVerifyLabel({
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
            Text(
              tr('profile.not_verified'),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.error,
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

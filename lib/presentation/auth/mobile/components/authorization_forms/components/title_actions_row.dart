import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleActionRowMobile extends StatelessWidget {
  const TitleActionRowMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: SizedBox(
        width: 188.w,
        child: Text(
          tr('authorization.app_actions'),
          style:
              Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 13.sp),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/components/theme_switch.dart';

class SwitchThemeMobile extends StatelessWidget {
  const SwitchThemeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(
              color: Theme.of(context).primaryColor.withOpacity(0.25),
              height: 1.h,
            ),
          ],
        ),
        SizedBox(
          height: 60.h,
          child: Row(
            children: [
              Text(
                tr('profile.dark_mode'),
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: 13.sp),
              ),
              const Spacer(),
              ThemeSwitch(
                width: 53.w,
                height: 26.56.h,
                borderRadius: 25.0.r,
                toggleSize: 25.0.w,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

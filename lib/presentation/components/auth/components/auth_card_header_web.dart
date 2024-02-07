import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class AuthCardHeader extends StatelessWidget {
  const AuthCardHeader({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.subtitleFuncText,
    required this.subtitleOnTap,
    required this.platformType,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String subtitleFuncText;
  final Function() subtitleOnTap;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 21,
          tabletValue: 15,
          mobileValue: 10,
        ).w,
        right: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 20,
          tabletValue: 15,
          mobileValue: 10,
        ).w,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 40,
                    tabletValue: 30,
                    mobileValue: 20,
                  ).sp,
                ),
          ),
          const Spacer(),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 20,
                    tabletValue: 18,
                    mobileValue: 10,
                  ).sp,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          InkWell(
            onTap: subtitleOnTap,
            child: Text(
              subtitleFuncText,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: MainColorsApp.accentColor,
                    fontSize: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 20,
                      tabletValue: 18,
                      mobileValue: 10,
                    ).sp,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

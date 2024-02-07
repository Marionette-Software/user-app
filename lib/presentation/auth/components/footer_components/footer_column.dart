import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/auth/components/footer_components/main_label.dart';
import 'package:user_app/presentation/auth/components/footer_components/sub_label.dart';

class FooterColumn extends StatelessWidget {
  const FooterColumn({
    Key? key,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.url1,
    required this.url2,
    required this.url3,
    required this.platformType,
    this.iconSubtitle1,
    this.iconSubtitle2,
    this.iconSubtitle3,
  }) : super(key: key);

  final String title;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String url1;
  final String url2;
  final String url3;
  final String? iconSubtitle1;
  final String? iconSubtitle2;
  final String? iconSubtitle3;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainLabel(
          label: title,
          platformType: platformType,
        ),
        SizedBox(
          height: 24.h,
        ),
        iconSubtitle1 != null
            ? SubLabel(
                platformType: platformType,
                label: subtitle1,
                iconPath: iconSubtitle1!,
                url: url1,
              )
            : SubLabel(
                platformType: platformType,
                label: subtitle1,
                url: url1,
              ),
        SizedBox(
          height: 10.h,
        ),
        iconSubtitle2 != null
            ? SubLabel(
                platformType: platformType,
                label: subtitle2,
                iconPath: iconSubtitle2!,
                url: url2,
              )
            : SubLabel(
                platformType: platformType,
                label: subtitle2,
                url: url2,
              ),
        SizedBox(
          height: 10.h,
        ),
        iconSubtitle3 != null
            ? SubLabel(
                platformType: platformType,
                label: subtitle3,
                iconPath: iconSubtitle3!,
                url: url3,
              )
            : SubLabel(
                platformType: platformType,
                label: subtitle3,
                url: url3,
              ),
      ],
    );
  }
}

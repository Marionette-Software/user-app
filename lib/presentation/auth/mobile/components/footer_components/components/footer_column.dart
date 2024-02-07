import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/auth/components/footer_components/main_label.dart';
import 'package:user_app/presentation/auth/components/footer_components/sub_label.dart';

class FooterColumnMobile extends StatelessWidget {
  const FooterColumnMobile({
    Key? key,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.url1,
    required this.url2,
    required this.url3,
    required this.url4,
    required this.iconPath,
  }) : super(key: key);

  final String title;
  final String subtitle1;
  final String url1;
  final String subtitle2;
  final String url2;
  final String subtitle3;
  final String url3;
  final String url4;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MainLabel(
          label: title,
          platformType: PlatformTypeState.mobile,
        ),
        SizedBox(
          height: 10.h,
        ),
        SubLabel(
          label: subtitle1,
          url: url1,
          platformType: PlatformTypeState.mobile,
        ),
        SizedBox(
          height: 10.h,
        ),
        SubLabel(
          label: subtitle2,
          url: url2,
          platformType: PlatformTypeState.mobile,
        ),
        SizedBox(
          height: 10.h,
        ),
        SubLabel(
          label: subtitle3,
          url: url3,
          platformType: PlatformTypeState.mobile,
        ),
      ],
    );
  }
}

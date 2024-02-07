import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubLabelMobile extends StatelessWidget {
  const SubLabelMobile({
    super.key,
    required this.label,
    this.iconPath = '',
  });
  final String label;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        iconPath != ''
            ? Row(
                children: [
                  SvgPicture.asset(
                    iconPath,
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                ],
              )
            : const SizedBox(),
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                fontSize: 15.sp,
              ),
        ),
      ],
    );
  }
}

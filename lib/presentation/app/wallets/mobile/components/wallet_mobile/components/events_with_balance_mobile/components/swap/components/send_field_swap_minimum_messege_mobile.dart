import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';

class SendFieldSwapMinimumMessageMobile extends StatelessWidget {
  const SendFieldSwapMinimumMessageMobile({required this.minValue, super.key});

  final String minValue;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 13.w),
          child: Text(
            '${tr('wallet.minimum')} $minValue',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: MainColorsApp.redColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.65.sp,
                ),
          ),
        ),
        SvgPicture.asset(
          swapMinimumContainer,
          height: 35..h,
        ),
      ],
    );
  }
}

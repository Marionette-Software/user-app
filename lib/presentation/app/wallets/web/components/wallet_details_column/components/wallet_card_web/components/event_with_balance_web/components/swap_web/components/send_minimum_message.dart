import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';

class SendMinimumMessage extends StatelessWidget {
  const SendMinimumMessage({required this.minValue, super.key});

  final String minValue;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -10.h,
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  tr('wallet.minimum'),
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: MainColorsApp.redColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.9.sp,
                      ),
                ),
                Text(
                  minValue,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: MainColorsApp.redColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.9.sp,
                      ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            swapMinimumContainer,
            height: 47.h,
          ),
        ],
      ),
    );
  }
}

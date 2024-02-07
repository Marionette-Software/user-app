import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';

class MarketAmountErrorMessageWeb extends HookConsumerWidget {
  const MarketAmountErrorMessageWeb({
    required this.minAmountMessage,
    super.key,
  });

  final String minAmountMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 13.5.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Min: $minAmountMessage',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: MainColorsApp.redColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
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
    );
  }
}

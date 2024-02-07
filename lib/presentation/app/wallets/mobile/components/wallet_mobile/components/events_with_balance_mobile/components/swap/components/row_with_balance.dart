import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class RowWithBalanceMobile extends StatelessWidget {
  const RowWithBalanceMobile({required this.rowWithBalance, super.key});

  final String rowWithBalance;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        '${tr('wallet.available')} $rowWithBalance',
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: isLightTheme(context)
                  ? AppColors.aboutHeaderLight
                  : AppColors.whiteColor.withOpacity(0.5),
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.65.sp,
            ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class HeaderExchangePageMobile extends StatelessWidget {
  const HeaderExchangePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 37.h,
          width: 240.w,
          child: AutoSizeText(
            tr('non_custodial_exchange.fast_secure_v1'),
            minFontSize: 5,
            maxFontSize: 13,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: isLightTheme(context)
                      ? const Color(0xFF140042)
                      : AppColors.whiteColor,
                  fontSize: 13,
                ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class LogoWithCardsWeb extends StatelessWidget {
  const LogoWithCardsWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 603 .w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 603 .w,
            height: 176.h,
            child: SvgPicture.asset(
              isLightTheme(context) ? simpleDimpleLabel : simpleDimpleLabelDark,
            ),
          ),
          SizedBox(
            height: 37.h,
          ),
          Container(
            width: 603 .w,
            height: 72.h,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 5 .w),
            child: AutoSizeText(
              tr('authorization.logo_subtitle'),
              minFontSize: 3,
              maxFontSize: 30,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

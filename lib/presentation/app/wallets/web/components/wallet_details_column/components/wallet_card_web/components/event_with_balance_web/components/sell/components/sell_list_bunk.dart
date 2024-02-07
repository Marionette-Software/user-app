import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SellListBunkWeb extends StatelessWidget {
  const SellListBunkWeb({super.key});

  @override
  Widget build(BuildContext context) {
    List sellListBanks = [
      masterCardLogo,
      visaLogo,
      isLightTheme(context) ? payLogoLight : payLogoDark,
      isLightTheme(context) ? googlePayLogoLight : googlePayLogoDark,
      payPalLogo,
      skrillLogo,
      isLightTheme(context) ? bankLightLogo : bankDarkLogo,
    ];

    return Wrap(
      runSpacing: 25.h,
      spacing: 1.w,
      alignment: WrapAlignment.center,
      children: List.generate(
        sellListBanks.length,
        (index) {
          var logo = sellListBanks[index];
          return Padding(
            padding: EdgeInsets.only(
              left: 12.5.w,
              right: 12.5.w,
            ),
            child: Container(
              width: 262.h,
              height: 102.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: isLightTheme(context)
                      ? AppColors.borderSideColor.withOpacity(0.25)
                      : AppColors.whiteColor.withOpacity(0.25),
                  width: 1.5.w,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  logo,
                  height: 40.h,
                  fit: BoxFit.fitHeight,
                  placeholderBuilder: (context) =>
                      const CircularProgressIndicator(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

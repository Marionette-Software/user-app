import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class PremiumBanner extends StatelessWidget {
  const PremiumBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 715.w,
      height: 190.h,
      padding: EdgeInsets.only(
        left: 25.w,
        top: 18.h,
      ),
      decoration: BoxDecoration(
        color: isLightTheme(context) ? iconColor : Colors.transparent,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: isLightTheme(context)
              ? Colors.transparent
              : MainColorsApp.accentColor,
          width: 1.0,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 72.h,
                  child: AutoSizeText(
                    tr('non_custodial_exchange.unlimited_term_loans_tho_rows'),
                    minFontSize: 4,
                    maxFontSize: 28,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: isLightTheme(context)
                              ? Theme.of(context).primaryColorLight
                              : Theme.of(context).primaryColor,
                          fontSize: 28,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 15.h,
                  ),
                  child: SizedBox(
                    width: 202.w,
                    height: 60.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            MainColorsApp.accentColor),
                      ),
                      onPressed: () {},
                      child: SizedBox(
                        height: 24.h,
                        child: AutoSizeText(
                          tr('non_custodial_exchange.join_premium'),
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.whiteColor,
                                    fontSize: 18,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 202.w,
              height: 168.h,
              child: SvgPicture.asset(
                magicWandLogoPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

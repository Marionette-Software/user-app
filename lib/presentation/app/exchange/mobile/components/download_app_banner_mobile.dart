import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';

class DownloadAppBannerMobile extends StatelessWidget {
  const DownloadAppBannerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 31.h,
        ),
        Container(
          width: 300.w,
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: MainColorsApp.accentColor,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: 15.h,
              bottom: 20.h,
              left: 15.w,
              right: 15.w,
            ),
            child: Column(
              children: [
                Image.asset(
                  handWithPhoneBannerPath,
                  width: 63.w,
                  height: 62.h,
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 36.h,
                  child: AutoSizeText(
                    tr('non_custodial_exchange.exchange_on_the_go_download'),
                    minFontSize: 5,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 130.w,
                      height: 35.h,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: SvgPicture.asset(
                        appstoreButtonPath,
                        fit: BoxFit.cover,
                        width: 130.w,
                        height: 35.h,
                      ),
                    ),
                    Container(
                      width: 130.w,
                      height: 35.h,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: SvgPicture.asset(
                        googleButtonPath,
                        fit: BoxFit.cover,
                        width: 130.w,
                        height: 35.h,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

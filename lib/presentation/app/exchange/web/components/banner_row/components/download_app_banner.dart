import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class DownloadAppBanner extends StatelessWidget {
  const DownloadAppBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 715.w,
      height: 190.h,
      decoration: BoxDecoration(
        color: isLightTheme(context)
            ? Theme.of(context).primaryColorLight
            : Colors.transparent,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: isLightTheme(context)
              ? Colors.transparent
              : Theme.of(context).primaryColorLight,
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.only(
        left: 25.w,
        right: 50.w,
        top: 18.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 72.h,
                child: AutoSizeText(
                  tr('non_custodial_exchange.download_our_app_v1'),
                  minFontSize: 4,
                  maxFontSize: 28,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 28,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: isLightTheme(context)
                              ? Colors.transparent
                              : Theme.of(context).primaryColor,
                          width: 1.0,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          googleButtonPath,
                          width: 202.w,
                          height: 60.h,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: isLightTheme(context)
                              ? Colors.transparent
                              : Theme.of(context).primaryColor,
                          width: 1.0,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: SizedBox(
                          width: 202.w,
                          height: 60.h,
                          child: SvgPicture.asset(
                            appstoreButtonPath,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 118.w,
            height: 118.h,
            child: Image.asset(
              isLightTheme(context)
                  ? handWithPhoneBannerWhitePath
                  : handWithPhoneBannerDarkPath,
            ),
          ),
        ],
      ),
    );
  }
}

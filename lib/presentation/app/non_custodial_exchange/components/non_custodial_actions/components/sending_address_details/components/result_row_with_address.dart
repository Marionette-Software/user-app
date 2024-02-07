import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ResultRowWithAddress extends StatelessWidget {
  const ResultRowWithAddress({
    super.key,
    required this.iconUrl,
    required this.title,
    required this.toAddressTitle,
    required this.value,
    required this.address,
    required this.platformType,
  });

  final String? iconUrl;
  final String title;
  final String address;
  final String value;
  final String toAddressTitle;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 600,
        tabletValue: 475,
        mobileValue: 300,
      ).w,
      decoration: BoxDecoration(
        color: isLightTheme(context) ? bgElementColor : Colors.transparent,
        borderRadius: BorderRadius.circular(
          getSizeFromPlatformType(
            platformType: platformType,
            webValue: 10,
            tabletValue: 10,
            mobileValue: 5,
          ),
        ),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.25),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 20,
            tabletValue: 20,
            mobileValue: 11,
          ).w,
          vertical: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 15,
            tabletValue: 15,
            mobileValue: 10,
          ).h,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 18,
                        tabletValue: 18,
                        mobileValue: 12,
                      ).h,
                      child: AutoSizeText(
                        title,
                        minFontSize: 3,
                        maxFontSize: getSizeFromPlatformType(
                          platformType: platformType,
                          webValue: 15,
                          tabletValue: 15,
                          mobileValue: 10,
                        ),
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: getSizeFromPlatformType(
                                    platformType: platformType,
                                    webValue: 15,
                                    tabletValue: 15,
                                    mobileValue: 10,
                                  ),
                                  color: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .color!
                                      .withOpacity(0.5),
                                ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      width: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 400,
                        tabletValue: 300,
                        mobileValue: 190,
                      ).w,
                      height: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 30,
                        tabletValue: 24,
                        mobileValue: 16,
                      ).h,
                      child: AutoSizeText(
                        value,
                        minFontSize: 3,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: getSizeFromPlatformType(
                                    platformType: platformType,
                                    webValue: 30,
                                    tabletValue: 20,
                                    mobileValue: 13,
                                  ),
                                ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                UserAppImage(
                  clipBehavior: Clip.hardEdge,
                  path: iconUrl!,
                  width: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 50,
                    tabletValue: 40,
                    mobileValue: 25,
                  ).w,
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 50,
                    tabletValue: 40,
                    mobileValue: 25,
                  ).h,
                  isNetwork: true,
                )
              ],
            ),
            SizedBox(
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 17,
                tabletValue: 9,
                mobileValue: 10,
              ).h,
            ),
            Center(
              child: Container(
                width: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 504,
                  tabletValue: 395,
                  mobileValue: 242,
                ).w,
                height: 1.h,
                color: isLightTheme(context)
                    ? Theme.of(context).dividerColor
                    : Theme.of(context).primaryColor.withOpacity(0.25),
              ),
            ),
            SizedBox(
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 17,
                tabletValue: 9,
                mobileValue: 10,
              ).h,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 18,
                        tabletValue: 18,
                        mobileValue: 12,
                      ).h,
                      child: AutoSizeText(
                        toAddressTitle,
                        minFontSize: 3,
                        maxFontSize: getSizeFromPlatformType(
                          platformType: platformType,
                          webValue: 15,
                          tabletValue: 15,
                          mobileValue: 10,
                        ),
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: getSizeFromPlatformType(
                                    platformType: platformType,
                                    webValue: 15,
                                    tabletValue: 15,
                                    mobileValue: 10,
                                  ),
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .color!
                                      .withOpacity(0.5),
                                ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      width: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 483,
                        tabletValue: 392,
                        mobileValue: 243,
                      ).w,
                      height: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 30,
                        tabletValue: 24,
                        mobileValue: 16,
                      ).h,
                      child: AutoSizeText(
                        address,
                        minFontSize: 3,
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: getSizeFromPlatformType(
                                    platformType: platformType,
                                    webValue: 30,
                                    tabletValue: 20,
                                    mobileValue: 13,
                                  ),
                                ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

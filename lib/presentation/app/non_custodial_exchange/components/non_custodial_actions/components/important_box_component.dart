import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class ImportantBoxComponent extends StatelessWidget {
  const ImportantBoxComponent({
    super.key,
    required this.title,
    required this.description,
    required this.height,
    required this.platformType,
  });

  final String title;
  final String description;
  final double height;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 550,
        tabletValue: 420,
        mobileValue: 270,
      ).w,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.error,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(
          getSizeFromPlatformType(
            platformType: platformType,
            webValue: 10,
            tabletValue: 10,
            mobileValue: 5,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 15,
            tabletValue: 13,
            mobileValue: 10,
          ).w,
          vertical: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 15,
            tabletValue: 13,
            mobileValue: 10,
          ).h,
        ),
        child: Column(
          children: [
            SizedBox(
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 22,
                tabletValue: 18,
                mobileValue: 15,
              ).w,
              child: AutoSizeText(
                title,
                minFontSize: 3,
                maxFontSize: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 18,
                  tabletValue: 15,
                  mobileValue: 12,
                ),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 18,
                        tabletValue: 15,
                        mobileValue: 12,
                      ),
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
            ),
            SizedBox(
              height: (height - (55.h)).h,
              child: AutoSizeText(
                description,
                minFontSize: 3,
                maxFontSize: 19,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 19,
                      color: Theme.of(context).colorScheme.error,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

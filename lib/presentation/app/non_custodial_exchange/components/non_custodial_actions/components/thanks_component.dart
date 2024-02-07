import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_notifier.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_provider.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_progress_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/decoration_non_custodial_form.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ThanksComponentWeb extends HookConsumerWidget {
  const ThanksComponentWeb({
    required this.platformType,
    Key? key,
  }) : super(key: key);

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressRead = ref.read(nonCustodialStateProvider.notifier);
    final progressIndexRead =
        ref.read(nonCustodialProgressStateProvider.notifier);

    return DecorationNonCustodialForm(
      width: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 600,
        tabletValue: 475,
        mobileValue: 300,
      ).w,
      height: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 310,
        tabletValue: 254,
        mobileValue: 224,
      ).h,
      platformType: platformType,
      content: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 24,
            tabletValue: 20,
            mobileValue: 15,
          ).w,
          vertical: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 43,
            tabletValue: 37,
            mobileValue: 31,
          ).h,
        ),
        child: Column(
          children: [
            SizedBox(
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 42,
                tabletValue: 36,
                mobileValue: 30,
              ).h,
              child: AutoSizeText(
                tr('non_custodial_exchange.thanks'),
                minFontSize: 3,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 30,
                        tabletValue: 30,
                        mobileValue: 20,
                      ),
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 25,
                tabletValue: 25,
                mobileValue: 12,
              ).h,
            ),
            UserAppImage(
              width: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 279,
                tabletValue: 233,
                mobileValue: 221,
              ).w,
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 47,
                tabletValue: 40,
                mobileValue: 35,
              ).h,
              path: isLightTheme(context) ? appLogoPath : appLogoPathDark,
            ),
            SizedBox(
              height: 40.h,
            ),
            MainButton(
              disableColor: MainColorsApp.accentColor.withOpacity(0.5),
              onTap: () {
                progressRead.state = NonCustodialState.receive;
                progressIndexRead.state = 2;
              },
              text: tr('non_custodial_exchange.exchange_again'),
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 60.w,
                tabletValue: 45.w,
                mobileValue: 35.w,
              ).h,
              color: Theme.of(context).primaryColorLight,
              fontSize: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 20.w,
                tabletValue: 18.w,
                mobileValue: 16.w,
              ),
            )
          ],
        ),
      ),
    );
  }
}

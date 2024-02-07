import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_app/application/agree_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class AgreeInputWidget extends HookConsumerWidget {
  const AgreeInputWidget({
    super.key,
    required this.platformType,
  });

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agreeStateState = ref.read(agreeStateProvider.notifier);
    final agreeStateWatch = ref.watch(agreeStateProvider);

    return Padding(
      padding: EdgeInsets.only(
        left: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 23,
          tabletValue: 12,
          mobileValue: 15,
        ).w,
        bottom: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 15,
          tabletValue: 12,
          mobileValue: 0,
        ).h,
      ),
      child: Row(
        children: [
          SizedBox(
            height: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 30,
              tabletValue: 30,
              mobileValue: 10,
            ).h,
            width: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 30,
              tabletValue: 30,
              mobileValue: 10,
            ).w,
            child: Container(
              color: AppColors.fillColor,
              child: Transform.scale(
                scale: 1.3.w,
                child: SizedBox(
                  child: Checkbox(
                    side: MaterialStateBorderSide.resolveWith(
                      (states) => BorderSide(
                        width: agreeStateState.state == false ? 0 : 0,
                        color: agreeStateState.state == false
                            ? Theme.of(context).primaryColor.withOpacity(0.25)
                            : Theme.of(context).primaryColor.withOpacity(0.25),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    activeColor: AppColors.checkboxActiveColors,
                    checkColor: isLightTheme(context)
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).primaryColor,
                    tristate: false,
                    value: agreeStateWatch,
                    splashRadius: 3,
                    onChanged: (value) {
                      agreeStateState.state = value!;
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 10,
              tabletValue: 10,
              mobileValue: 15,
            ).w,
          ),
          InkWell(
            child: Text(
              '${tr('authorization.terms_agree')} ${tr('authorization.terms_and_conditions')}',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 20,
                      tabletValue: 15,
                      mobileValue: 15,
                    ).sp,
                    color: Theme.of(context).primaryColor,
                    letterSpacing: -0.75.sp,
                  ),
            ),
            onTap: () async {
              var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
              GlobalConfigData globalData = box.getAt(0)!;
              if (globalData.termsAndConditionsUrl.isNotEmpty) {
                if (await canLaunch(globalData.termsAndConditionsUrl)) {
                  await launch(
                    globalData.termsAndConditionsUrl,
                    forceWebView: true,
                  );
                }
              }
            },
          )
        ],
      ),
    );
  }
}

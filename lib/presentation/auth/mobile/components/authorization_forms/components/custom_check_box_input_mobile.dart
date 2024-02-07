import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_app/application/agree_provider.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class AgreeInputWidgetMobile extends HookConsumerWidget {
  const AgreeInputWidgetMobile({
    super.key,
    this.isMobile = false,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agreeStateState = ref.read(agreeStateProvider.notifier);
    final agreeStateWatch = ref.watch(agreeStateProvider);

    return Row(
      children: [
        SizedBox(width: 10.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 16.h,
              width: 16.h,
              child: Container(
                color: AppColors.fillColor,
                child: Transform.scale(
                  scale: 1.0.h,
                  child: SizedBox(
                    child: Checkbox(
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(
                          width: agreeStateState.state == false ? 0 : 0,
                          color: agreeStateState.state == false
                              ? Theme.of(context).primaryColor.withOpacity(0.25)
                              : Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.25),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
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
            )
          ],
        ),
        SizedBox(width: 7.w),
        Column(
          children: [
            GestureDetector(
              child: Text(
                '${tr('authorization.terms_agree')} ${tr('terms_and_conditions.terms_and_conditions')}',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: isLightTheme(context)
                          ? Theme.of(context).primaryColorLight
                          : AppColors.whiteColor,
                    ),
              ),
              onTap: () async {
                // ignore: deprecated_member_use
                if (await canLaunch('https://wizwiz.io/terms-and-conditions')) {
                  // ignore: deprecated_member_use
                  await launch(
                    'https://wizwiz.io/terms-and-conditions',
                    forceWebView: true,
                  );
                }
              },
            ),
          ],
        )
      ],
    );
  }
}

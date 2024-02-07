import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/two_fa/two_fa_state_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/profile/actions/show_profile_modal.dart';
import 'package:user_app/presentation/constants/colors.dart';

class FAStatusWeb extends HookConsumerWidget {
  const FAStatusWeb({
    required this.platformType,
    super.key,
  });

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final twoFAWatch = ref.watch(twoFaProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              tr('profile.2fa_status'),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1.sp,
                  ),
            ),
            const Spacer(),
            Container(
              height: 27.h,
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Switch(
                    value: twoFAWatch == false ? false : true,
                    onChanged: (value) {
                      ShowProfileModalAction().showTwoFaModal(
                        context: context,
                        ref: ref,
                        platformType: platformType,
                      );
                    },
                    activeTrackColor: MainColorsApp.greenColor.withOpacity(0.5),
                    activeColor: MainColorsApp.greenColor,
                    inactiveTrackColor: MainColorsApp.redColor,
                    inactiveThumbColor: MainColorsApp.redColor.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

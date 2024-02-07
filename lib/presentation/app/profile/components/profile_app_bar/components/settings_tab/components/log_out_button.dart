import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/profile/actions/log_out.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class LogOutButton extends HookConsumerWidget {
  const LogOutButton({
    required this.platformType,
    super.key,
  });

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loaderState = useState(LoadState.notLoading);

    return ElevatedButton(
      onPressed: () async {
        LogOutAction().logOut(
          ref: ref,
          context: context,
          loaderState: loaderState,
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          MainColorsApp.redColor,
        ),
        shadowColor: MaterialStateProperty.all<Color>(
          borderButtonProfileBorder,
        ),
        elevation: MaterialStateProperty.all(8.w),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 10,
                  tabletValue: 10,
                  mobileValue: 5,
                ).r,
              ),
            ),
          ),
        ),
      ),
      child: SizedBox(
        width: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 350,
          tabletValue: 250,
          mobileValue: 270,
        ).w,
        height: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 60,
          tabletValue: 45,
          mobileValue: 35,
        ).h,
        child: Center(
          child: Text(
            tr('profile.log_out'),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.whiteColorText,
                  fontSize: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 20,
                    tabletValue: 15,
                    mobileValue: 13,
                  ).sp,
                ),
          ),
        ),
      ),
    );
  }
}

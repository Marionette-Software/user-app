import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/profile/actions/log_out.dart';
import 'package:user_app/presentation/constants/colors.dart';

class ExitButton extends HookConsumerWidget {
  const ExitButton({
    required this.platformType,
    Key? key,
  }) : super(key: key);

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
        shadowColor:
            MaterialStateProperty.all<Color>(borderButtonProfileBorder),
        elevation: MaterialStateProperty.all(8.w),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          ),
        ),
      ),
      child: SizedBox(
        width: 350.w,
        height: 60.h,
        child: Center(
          child: Text(
            tr('profile.log_out'),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.whiteColorText,
                fontSize: 20.sp),
          ),
        ),
      ),
    );
  }
}

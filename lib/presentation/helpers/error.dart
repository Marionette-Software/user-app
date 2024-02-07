import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/presentation/auth/authentication.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class UserAppError extends HookConsumerWidget {
  const UserAppError({
    Key? key,
    this.fontSize = 22.0,
    required this.errorMessage,
    this.message,
  }) : super(key: key);

  final String errorMessage;
  final StackTrace? message;
  final double fontSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loaderState = useState(LoadState.notLoading);
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    var uBox = Hive.box<UserConfigData>(Constants.userConfig);

    UserConfigData userData = uBox.getAt(0)!;
    GlobalConfigData boxData = box.getAt(0)!;

    context.afterBuild(() {
      if (boxData.extensionCodeError == 'Invalid session' ||
          userData.token == null) {
        GlobalConfigHelper.update(extensionCodeError: null);

        var uData = UserConfigData(
          userId: null,
          token: null,
          selectedMarketId: null,
          userName: '',
        );
        uBox.putAt(0, uData);

        loaderState.value = LoadState.notLoading;

        final snackBar = SnackBar(
          clipBehavior: Clip.none,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: tr('snack_bar_message.errors.error'),
            message: tr('snack_bar_message.errors.session_is_over'),
            contentType: ContentType.failure,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);

        context.go(Authentication.routeName);
      }
    });

    return Container(
      color: isLightTheme(context)
          ? AppColors.whiteColor
          : AppColors.mainBackgroundDarkColor,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15.h,
            ),
            SvgPicture.asset(
              isLightTheme(context) ? errorLogoLightPath : errorLogoPath,
            ),
            SizedBox(
              height: 22.h,
            ),
            Text(
              tr('snack_bar_message.errors.something_went_wrong'),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: fontSize.h,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

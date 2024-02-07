import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/user/profile_future_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/presentation/app/profile/components/dropdown_menu/components/body_menu.dart';
import 'package:user_app/presentation/app/profile/components/dropdown_menu/components/exit_button.dart';
import 'package:user_app/presentation/app/profile/components/dropdown_menu/components/header_menu_component.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class DropDownMenu extends HookConsumerWidget {
  const DropDownMenu({
    required this.platformType,
    Key? key,
  }) : super(key: key);

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreshValue = useState(1);
    final userFuture = ref.watch(
      userGetUserFutureProvider(
        RefreshRequest(refresh: '$refreshValue'),
      ),
    );

    useEffect(() {
      if (refreshValue.value == 0) {
        refreshValue.value++;
      }
      return null;
    }, []);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.topRight,
        child: Container(
          color: AppColors.mainBackgroundDarkColor,
          child: MainDecorationContainerWeb(
            borderRadius: 0,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 426.w,
                  child: userFuture.when(
                    data: (data) {
                      var user = data.data!.user;
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 38.w,
                          right: 38.w,
                          top: 39.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            HeaderMenuWeb(
                              platformType: platformType,
                              email: user!.email!,
                              name: data.data!.user!.profiles!.isEmpty
                                  ? tr('profile.user')
                                  : '${data.data!.user!.profiles!.first!.first_name!} ${data.data!.user!.profiles!.first!.last_name!}',
                            ),
                            BodyMenuComponentWeb(
                              platformType: platformType,
                              emailVerified: user.email_verified!,
                              phoneVerified: user.phone_verified!,
                              profileVerified: user.profile_verified!,
                              haveDocuments: user.documents == null ||
                                      user.documents!.isEmpty
                                  ? false
                                  : true,
                              user: user,
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            SizedBox(
                              width: 350.w,
                              height: 60.h,
                              child: ExitButton(
                                platformType: platformType,
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(100.r),
                                onTap: () {
                                  context.pop();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: isLightTheme(context)
                                          ? Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.25)
                                          : AppColors.whiteColor
                                              .withOpacity(0.25),
                                      width: 1,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  height: 50.h,
                                  width: 50.w,
                                  alignment: Alignment.center,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      closeIcon,
                                      colorFilter: ColorFilter.mode(
                                        isLightTheme(context)
                                            ? Theme.of(context).primaryColor
                                            : AppColors.whiteColor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    error: (error, _) => UserAppError(
                      errorMessage: '$error',
                    ),
                    loading: () => Padding(
                      padding: EdgeInsets.only(top: 300.h),
                      child: const MainLoader(
                        loaderSize: 50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

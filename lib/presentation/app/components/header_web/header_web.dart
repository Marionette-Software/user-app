import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/header/header_config_future_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/presentation/app/trade/trade.dart';
import 'package:user_app/presentation/app/components/header_web/components/header_item.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/non_custodial_exchange.dart';
import 'package:user_app/presentation/app/profile/components/dropdown_menu/dropdown_menu.dart';
import 'package:user_app/presentation/app/profile/profile.dart';
import 'package:user_app/presentation/app/wallets/wallets.dart';
import 'package:user_app/presentation/components/theme_switch.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/localization_list_container.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class HeaderWeb extends HookConsumerWidget {
  const HeaderWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String selectedPage =
        GoRouter.of(context).routeInformationProvider.value.uri.path;

    final refreshValue = useState(1);

    final headerConfig = ref.watch(
      headerConfigFutureProvider(
        RefreshRequest(refresh: '$refreshValue'),
      ),
    );

    useEffect(() {
      if (refreshValue.value == 0) {
        refreshValue.value++;
      }
      return null;
    }, []);

    return headerConfig.when(
      data: (data) {
        return Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color:
                    isLightTheme(context) ? AppColors.whiteColor : headerColor,
                border: Border(
                  bottom: BorderSide(
                    width: 1.w,
                    color: isLightTheme(context)
                        ? AppColors.whiteColor
                        : headerColor,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.boxShadowColor,
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width,
              height: 60.h,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 27.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.h,
                        bottom: 10.h,
                      ),
                      child: InkWell(
                        onTap: () async {
                          context.go(Wallets.routeName);
                        },
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            width: 182.w,
                            height: 31.h,
                            child: UserAppImage(
                              path: isLightTheme(context)
                                  ? appLogoPath
                                  : appLogoPathDark,
                              width: 246.w,
                              height: 30.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.only(
                        left: 160.h,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.tabs.length - 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              HeaderItemWeb(
                                onTap: selectedPage != data.tabs[index].tabName
                                    ? () async {
                                        if (data.tabs[index].tabName !=
                                            'profile') {
                                          context.go(
                                            data.tabs[index].controller,
                                          );
                                        } else {}
                                      }
                                    : null,
                                icon: data.tabs[index].iconSrc,
                                title: data.tabs[index].title,
                                active: selectedPage == data.tabs[index].tabName
                                    ? true
                                    : false,
                              ),
                              SizedBox(
                                width: 50.w,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.h,
                        bottom: 10.h,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        decoration: BoxDecoration(
                          color: isLightTheme(context)
                              ? AppColors.mainBackgroundLightColor
                              : AppColors.whiteColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              child: HeaderItemWeb(
                                onTap: () async {
                                  if (data.tabs[data.tabs.length - 1].tabName !=
                                      Profile.routeName) {
                                    if (selectedPage !=
                                        data.tabs[data.tabs.length - 1]
                                            .tabName) {
                                      context.go(
                                        data.tabs[data.tabs.length - 1]
                                            .controller,
                                      );
                                    }
                                  } else {
                                    showGeneralDialog(
                                      barrierLabel: "Label",
                                      barrierDismissible: true,
                                      barrierColor:
                                          AppColors.blackColor.withOpacity(0),
                                      transitionDuration:
                                          const Duration(milliseconds: 200),
                                      context: context,
                                      pageBuilder: (context, anim1, anim2) {
                                        return Stack(
                                          alignment:
                                              AlignmentDirectional.bottomCenter,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 55.h,
                                              ),
                                              child: SizedBox(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: ClipRRect(
                                                  child: BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                      sigmaX: 4,
                                                      sigmaY: 4,
                                                    ),
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      color: MainColorsApp
                                                          .safeAreaDarkColor
                                                          .withOpacity(0.5),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                  top: 55.h,
                                                ),
                                                child: const DropDownMenu(
                                                  platformType:
                                                      PlatformTypeState.web,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                icon: data.tabs[data.tabs.length - 1].iconSrc,
                                title: data.userName,
                                active: (selectedPage ==
                                            NonCustodialExchange.routeName ||
                                        selectedPage == Trade.routeName ||
                                        selectedPage == Wallets.routeName)
                                    ? false
                                    : true,
                                isRightIcon: true,
                                isProfile: true,
                              ),
                            ),
                            SizedBox(
                              width: 25.w,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  showGeneralDialog(
                                    barrierLabel: "Label",
                                    barrierDismissible: true,
                                    barrierColor:
                                        AppColors.blackColor.withOpacity(0),
                                    transitionDuration:
                                        const Duration(milliseconds: 200),
                                    context: context,
                                    pageBuilder: (context, anim1, anim2) {
                                      return const LocalizationListContainer();
                                    },
                                  );
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    localizationIcon,
                                    height: 22.h,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context).primaryColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 25.w,
                            ),
                            ThemeSwitch(
                              width: 53.0.w,
                              height: 25.0.h,
                              borderRadius: 25.0.r,
                              toggleSize: 25.0.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      error: (error, _) => Container(),
      loading: () => Container(
        color: Theme.of(context).colorScheme.background,
      ),
    );
  }
}

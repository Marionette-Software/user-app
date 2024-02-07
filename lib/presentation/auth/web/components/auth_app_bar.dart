import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
import 'package:user_app/application/global_data/actions/global_actions.dart';
import 'package:user_app/domain/auth/auth_state.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/presentation/app/trade/trade.dart';
import 'package:user_app/presentation/auth/authentication.dart';
import 'package:user_app/presentation/components/theme_switch.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/app/exchange/exchange.dart';
import 'package:user_app/presentation/helpers/localization_list_container.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class AuthAppBar extends HookConsumerWidget {
  const AuthAppBar({
    Key? key,
    required this.isWeb,
  }) : super(key: key);

  final bool isWeb;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerStateProvider.notifier);
    final authControllerView = ref.watch(authControllerStateProvider);

    var globalConfigBox = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = globalConfigBox.getAt(0)!;

    final String selectedPage =
        GoRouter.of(context).routeInformationProvider.value.uri.path;

    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: isLightTheme(context) ? AppColors.whiteColor : headerColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: (isWeb ? 30 : 25).w,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              authController.state = AuthState.signIn;
            },
            child: UserAppImage(
              path: isLightTheme(context) ? appLogoPath : appLogoPathDark,
              width: (isWeb ? 182 : 148).w,
              height: (isWeb ? 30 : 26).h,
            ),
          ),
          const Spacer(),
          globalData.enabledNonCustodialExchangePage
              ? InkWell(
                  borderRadius: BorderRadius.circular(8),
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    context.go(Exchange.routeName);

                    authController.state = AuthState.exchange;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: selectedPage == Exchange.routeName
                            ? Theme.of(context).primaryColorLight
                            : Colors.transparent,
                        width: 1,
                      ),
                    ),
                    height: 42.3.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                      ),
                      child: Text(
                        tr('authorization.exchange'),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -1.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          globalData.enabledTradingPage
              ? SizedBox(
                  height: 25.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                    ),
                    child: VerticalDivider(
                      width: 1.0.w,
                      color: Theme.of(context).primaryColor.withOpacity(0.25),
                    ),
                  ),
                )
              : const SizedBox(),
          globalData.enabledTradingPage
              ? InkWell(
                  borderRadius: BorderRadius.circular(8.r),
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    context.go(Trade.routeName);

                    authController.state = AuthState.authTrade;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: selectedPage == Trade.routeName
                            ? Theme.of(context).primaryColorLight
                            : Colors.transparent,
                        width: 1,
                      ),
                    ),
                    height: 42.3.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                      ),
                      child: Text(
                        tr('authorization.trade'),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -1.sp,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          SizedBox(
            height: 25.h,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.w,
              ),
              child: VerticalDivider(
                width: 1.0.w,
                color: Theme.of(context).primaryColor.withOpacity(0.25),
              ),
            ),
          ),
          isWeb
              ? InkWell(
                  onTap: () async {
                    GlobalActionsGeneral globalActionsGeneral =
                        GlobalActionsGeneral();
                    globalActionsGeneral.openLink(
                        url: 'https://marionette.dev/how-it-works/');
                  },
                  child: Text(
                    tr('authorization.how_to_work'),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                )
              : const SizedBox(),
          SizedBox(
            height: 25.h,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.w,
              ),
              child: VerticalDivider(
                width: 1.0.w,
                color: Theme.of(context).primaryColor.withOpacity(0.25),
              ),
            ),
          ),
          authControllerView != AuthState.signIn
              ? InkWell(
                  borderRadius: BorderRadius.circular(8),
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    context.go(Authentication.routeName);

                    authController.state = AuthState.signIn;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: authControllerView == AuthState.signIn
                            ? Theme.of(context).primaryColorLight
                            : Colors.transparent,
                        width: 1,
                      ),
                    ),
                    height: 42.3.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                      ),
                      child: Text(
                        tr('authorization.sign_in'),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          authControllerView == AuthState.signIn
              ? InkWell(
                  borderRadius: BorderRadius.circular(8),
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    context.go(Authentication.routeName);

                    authController.state = AuthState.signUp;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: authControllerView == AuthState.signUp
                            ? Theme.of(context).primaryColorLight
                            : Colors.transparent,
                        width: 1,
                      ),
                    ),
                    height: 42.3.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                      ),
                      child: Text(
                        tr('authorization.sign_up'),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 20.sp,
                              letterSpacing: -1.sp,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          SizedBox(
            width: 22.w,
          ),
          Container(
            width: 150.w,
            height: 42.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26.r),
              color: isLightTheme(context)
                  ? AppColors.mainBackgroundLightColor
                  : AppColors.whiteColor.withOpacity(0.05),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 25.w,
                ),
                InkWell(
                  onTap: () {
                    showGeneralDialog(
                      barrierLabel: "Label",
                      barrierDismissible: true,
                      barrierColor: AppColors.placeHolderGrey,
                      transitionDuration: const Duration(milliseconds: 200),
                      context: context,
                      pageBuilder: (context, anim1, anim2) {
                        return const LocalizationListContainer();
                      },
                    );
                  },
                  child: Container(
                    height: 22.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      localizationIcon,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).primaryColor,
                        BlendMode.srcIn,
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
                SizedBox(
                  width: 25.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

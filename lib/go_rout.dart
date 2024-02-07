// ignore_for_file: use_build_context_synchronously
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/user/user_service.dart';
import 'package:user_app/presentation/app/exchange/exchange.dart';
import 'package:user_app/presentation/app/history/history.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/non_custodial_exchange.dart';
import 'package:user_app/presentation/app/profile/profile.dart';
import 'package:user_app/presentation/app/profile/web/components/api_key/api_key_web.dart';
import 'package:user_app/presentation/app/profile/web/components/referral_user.dart/referral_user_web.dart';
import 'package:user_app/presentation/app/trade/mobile/trade_mobile.dart';
import 'package:user_app/presentation/app/trade/trade.dart';
import 'package:user_app/presentation/app/user_orders/user_orders.dart';
import 'package:user_app/presentation/app/wallets/wallets.dart';
import 'package:user_app/presentation/auth/authentication.dart';
import 'package:user_app/presentation/auth/web/reset_password_form/reset_password_main.dart';
import 'package:user_app/presentation/components/spleash_screen.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.8;
      const end = 1.0;
      var tween = Tween(begin: begin, end: end);
      var fadeAnimation = tween.animate(animation);
      return FadeTransition(
        opacity: fadeAnimation,
        child: child,
      );
    },
  );
}

UserConfigData getUserToken() {
  var userConfigBox = Hive.box<UserConfigData>(Constants.userConfig);
  UserConfigData userData = userConfigBox.getAt(0)!;

  return userData;
}

GlobalConfigData getGlobalConfigData() {
  var box = Hive.box<GlobalConfigData>(Constants.globalConfig);

  return box.getAt(0)!;
}

final GoRouter goRoutes = GoRouter(
  initialLocation: !kIsWeb
      ? SplashScreenMobile.routeName
      : getUserToken().token != null
          ? Wallets.routeName
          : Authentication.routeName,
  errorBuilder: (context, state) {
    var userConfigBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userConfigBox.getAt(0)!;

    if (userData.token != null) {
      GoRouter.of(context).go(Wallets.routeName);
      return const Wallets();
    } else {
      GoRouter.of(context).go(Authentication.routeName);
      return const Authentication();
    }
  },
  routes: <RouteBase>[
    GoRoute(
      path: Authentication.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const Authentication();
      },
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const Authentication(),
        );
      },
    ),
    GoRoute(
      path: Profile.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return Profile(indexSelectedTab: state.extra);
      },
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const Profile(),
      ),
    ),
    GoRoute(
      path: Exchange.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const Exchange();
      },
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const Exchange(),
      ),
    ),
    GoRoute(
      path: NonCustodialExchange.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const NonCustodialExchange();
      },
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const NonCustodialExchange(),
      ),
    ),
    GoRoute(
      path: Wallets.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const Wallets();
      },
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const Wallets(),
      ),
    ),
    if (getGlobalConfigData().enabledTradingPage)
      GoRoute(
        path: Trade.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const Trade();
        },
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const Trade(),
        ),
      ),
    GoRoute(
      path: ApiKeyWeb.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const ApiKeyWeb();
      },
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const ApiKeyWeb(),
      ),
    ),
    GoRoute(
      path: UserOrders.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const UserOrders();
      },
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const UserOrders(),
      ),
    ),
    GoRoute(
      path: ReferralUserWeb.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const ReferralUserWeb();
      },
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const ReferralUserWeb(),
      ),
    ),
    if (getGlobalConfigData().enabledTradingPage)
      GoRoute(
        path: TradeMobile.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const TradeMobile();
        },
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const TradeMobile(),
        ),
      ),
    GoRoute(
      path: History.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const History();
      },
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const History(),
      ),
    ),
    GoRoute(
      path: SplashScreenMobile.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreenMobile(
          isJsonAnimation: true,
        );
      },
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const SplashScreenMobile(
          isJsonAnimation: true,
        ),
      ),
    ),
    GoRoute(
      path: '/controller/ref_code',
      builder: (BuildContext context, GoRouterState state) {
        return Authentication(
          refCode: state.uri.queryParameters['code'].toString(),
        );
      },
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: Authentication(
            refCode: state.uri.queryParameters['code'].toString(),
          ),
        );
      },
    ),
    GoRoute(
      path: '/controller/accounts/password_reset',
      builder: (BuildContext context, GoRouterState state) {
        return ResetPasswordMain(
          resetToken: state.uri.queryParameters['token'].toString(),
        );
      },
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: ResetPasswordMain(
            resetToken: state.uri.queryParameters['token'].toString(),
          ),
        );
      },
    ),
    GoRoute(
      path: '/public/verify',
      builder: (BuildContext context, GoRouterState state) {
        return const Wallets();
      },
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const Wallets(),
        );
      },
      redirect: (context, state) async {
        UserService userService = UserService();
        String token = state.uri.queryParameters['token'].toString();
        bool isWeb = MediaQuery.sizeOf(context).width > 600;

        await userService.verifyEmailToken(token, true);

        final snackBarSuccess = SnackBar(
          elevation: 0,
          clipBehavior: Clip.none,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            titleFontSize: isWeb ? 30.sp : 20.sp,
            messageFontSize: isWeb ? 20.sp : 15.sp,
            title: tr('snack_bar_message.success.success'),
            message: tr('snack_bar_message.success.email_is_verified'),
            contentType: ContentType.success,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBarSuccess);

        return Wallets.routeName;
      },
    ),
  ],
);

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
// import 'package:user_app/domain/auth/auth_state.dart';
// import 'package:user_app/domain/constants/constants.dart';
// import 'package:user_app/domain/user_config/user_config_data.dart';
// import 'package:user_app/presentation/app/non_custodial_exchange/non_custodial_exchange.dart';
// import 'package:user_app/presentation/app/profile/profile.dart';
// import 'package:user_app/presentation/app/trade/trade.dart';
// import 'package:user_app/presentation/app/wallets/wallets.dart';
// import 'package:user_app/presentation/auth/authentication.dart';

// final controllerFutureProvider =
//     FutureProvider.autoDispose.family<Widget, String>(
//   (ref, selectedPage) async {
//     final authController = ref.watch(authControllerStateProvider);
//     var userConfigBox = Hive.box<UserConfigData>(Constants.userConfig);
//     UserConfigData userData = userConfigBox.getAt(0)!;

//     getPageForUnauthorized() {
//       if ((authController == AuthState.signIn ||
//           authController == AuthState.signUp)) {
//         return const Authentication();
//       } else if (authController == AuthState.authTrade) {
//         return const Trade();
//       } else {
//         return const Authentication();
//       }
//     }

//     getPageForAuthorized() {
//       if (selectedPage == Trade.routeName) {
//         return const Trade();
//       } else if (selectedPage == Profile.routeName) {
//         return const Profile();
//       } else if (selectedPage == NonCustodialExchange.routeName) {
//         return const NonCustodialExchange();
//       } else {
//         return const Wallets();
//       }
//     }

//     if (userData.token == null  userData.token != '') {
//       return getPageForUnauthorized();
//     } else {
//       return getPageForAuthorized();
//     }
//   },
// );

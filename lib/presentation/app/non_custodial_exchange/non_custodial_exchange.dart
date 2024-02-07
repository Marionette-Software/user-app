import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/presentation/app/navigation/navigation_mobile.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/mobile/non_custodial_exchange_mobile.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/web/non_custodial_exchange_web.dart';

class NonCustodialExchange extends HookConsumerWidget {
  static const routeName = '/nonCustodialExchange';

  const NonCustodialExchange({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userConfigBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userConfigBox.getAt(0)!;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return const NonCustodialExchangeWeb();
        } else {
          return userData.token != null
              ? const Navigation(tabIndex: 3)
              : const NonCustodialExchangeMobile();
        }
      },
    );
  }
}

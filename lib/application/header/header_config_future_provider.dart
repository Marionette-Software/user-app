import 'package:easy_localization/easy_localization.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/header/header_response.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/presentation/app/components/header_web/components/header_item_list.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/non_custodial_exchange.dart';
import 'package:user_app/presentation/app/profile/profile.dart';
import 'package:user_app/presentation/app/trade/trade.dart';
import 'package:user_app/presentation/app/wallets/wallets.dart';
import 'package:user_app/presentation/constants/assets_path.dart';

final headerConfigFutureProvider =
    FutureProvider.autoDispose.family<HeaderResponse, RefreshRequest>(
  (ref, data) async {
    var globalConfigBox = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = globalConfigBox.getAt(0)!;
    var userConfigBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userConfig = userConfigBox.getAt(0)!;
    List<TabItem> tabs = <TabItem>[];

    tabs.add(
      TabItem(
        title: tr('app_title.wallets'),
        iconSrc: walletTab,
        tabName: Wallets.routeName,
        controller: Wallets.routeName,
        selected: true,
      ),
    );
    if (globalData.enabledNonCustodialExchangePage) {
      tabs.add(
        TabItem(
          title: tr('app_title.exchange'),
          iconSrc: swapTab,
          tabName: NonCustodialExchange.routeName,
          controller: NonCustodialExchange.routeName,
        ),
      );
    }
    if (globalData.enabledTradingPage) {
      tabs.add(
        TabItem(
          title: tr('app_title.trade'),
          iconSrc: tradeTab,
          tabName: Trade.routeName,
          controller: Trade.routeName,
        ),
      );
    }

    tabs.add(
      TabItem(
        title: tr('app_title.profile'),
        iconSrc: accountTab,
        tabName: Profile.routeName,
        controller: Profile.routeName,
      ),
    );

    return HeaderResponse(
      currentPage: '',
      tabs: tabs,
      userName: userConfig.userName!,
    );
  },
);

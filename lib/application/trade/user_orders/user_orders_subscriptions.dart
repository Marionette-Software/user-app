import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/trade/graphql/user_orders/__generated__/private_orders_subscription.req.gql.dart';

final userOrdersStream = StreamProvider.autoDispose((ref) async* {
  var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
  GlobalConfigData globalData = box.getAt(0)!;
  var userBox = Hive.box<UserConfigData>(Constants.userConfig);
  UserConfigData userData = userBox.getAt(0)!;

  final activeMarketWatch = ref.watch(selectMarketsNotifierProvider);
  final stream =
      subscriptionClient(globalData.url).request(GPrivateOrdersSubscriptionReq(
    (b) => b
      ..vars.market = activeMarketWatch.id
      ..vars.token = userData.token,
  ));

  yield stream;
});

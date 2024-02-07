import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/orderbook/orderbook_state_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/trade/orderbook/orderbook_item.dart';
import 'package:user_app/domain/trade/orderbook/orderbook_state.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/full_orderbook_subscription.req.gql.dart';

final orderBookStream = StreamProvider.autoDispose((ref) async* {
  var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
  GlobalConfigData globalData = box.getAt(0)!;

  final activeMarketWatch = ref.watch(selectMarketsNotifierProvider);
  final orderBookRead = ref.read(orderBookStateNotifierProvider.notifier);

  final stream = subscriptionClient(globalData.url).request(
      GPublicFullOrderBookSubscriptionReq(
          (b) => b..vars.market = activeMarketWatch.id!));

  stream.listen(
    (event) {
      List<OrderBookItem> buy = [];
      List<OrderBookItem> sell = [];
      for (int i = 0; i < event.data!.publicFullOrderBook!.buy!.length; i++) {
        buy.add(
          OrderBookItem(
            price: event.data!.publicFullOrderBook!.buy![i]!.price!,
            amount: event.data!.publicFullOrderBook!.buy![i]!.amount!,
            cumulativeAmount:
                event.data!.publicFullOrderBook!.buy![i]!.cumulativeAmount!,
          ),
        );
      }
      for (int i = 0; i < event.data!.publicFullOrderBook!.sell!.length; i++) {
        sell.add(
          OrderBookItem(
            price: event.data!.publicFullOrderBook!.sell![i]!.price!,
            amount: event.data!.publicFullOrderBook!.sell![i]!.amount!,
            cumulativeAmount:
                event.data!.publicFullOrderBook!.sell![i]!.cumulativeAmount!,
          ),
        );
      }
      OrderBookState orderBook = OrderBookState(
        buy: buy,
        sell: sell,
      );
      orderBookRead.updateOrderBook(orderBook);
    },
  );

  yield stream;
});

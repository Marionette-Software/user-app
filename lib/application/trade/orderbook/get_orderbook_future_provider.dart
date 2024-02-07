import 'package:ferry/typed_links.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/orderbook/orderbook_state_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/domain/trade/orderbook/orderbook_item.dart';
import 'package:user_app/domain/trade/orderbook/orderbook_state.dart';
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/public_orderbook.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/public_orderbook.var.gql.dart';
import 'package:user_app/infrastructure/trade/trade_service.dart';

final getOrderBookFutureProvider =
    FutureProvider.autoDispose.family<OrderBookState, RefreshRequest>(
  (ref, orderReq) async {
    ITradeService service = TradeService();
    final selectMarketWatch = ref.watch(selectMarketsNotifierProvider);
    OperationResponse<GPublicOrderBookData, GPublicOrderBookVars> getOrderBook =
        await service.getPublicOrderBook(selectMarketWatch.id!);
    List<OrderBookItem> buy = [];
    List<OrderBookItem> sell = [];
    for (int i = 0; i < getOrderBook.data!.publicOrderBook!.buy!.length; i++) {
      buy.add(
        OrderBookItem(
          price: getOrderBook.data!.publicOrderBook!.buy![i]!.price!,
          amount: getOrderBook.data!.publicOrderBook!.buy![i]!.amount!,
          cumulativeAmount:
              getOrderBook.data!.publicOrderBook!.buy![i]!.cumulativeAmount!,
        ),
      );
    }
    for (int i = 0; i < getOrderBook.data!.publicOrderBook!.sell!.length; i++) {
      sell.add(
        OrderBookItem(
          price: getOrderBook.data!.publicOrderBook!.sell![i]!.price!,
          amount: getOrderBook.data!.publicOrderBook!.sell![i]!.amount!,
          cumulativeAmount:
              getOrderBook.data!.publicOrderBook!.sell![i]!.cumulativeAmount!,
        ),
      );
    }
    OrderBookState orderBook = OrderBookState(
      buy: buy,
      sell: sell,
    );
    ref
        .read(orderBookStateNotifierProvider.notifier)
        .updateOrderBook(orderBook);

    return orderBook;
  },
);

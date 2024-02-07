import 'package:ferry/typed_links.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/trade/market/market_item.dart';
import 'package:user_app/domain/trade/order_req.dart';
import 'package:user_app/domain/trade/user_orders/user_order.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_orders.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_orders.var.gql.dart';
import 'package:user_app/infrastructure/trade/trade_service.dart';

final ordersNotifierProvider = StateNotifierProvider.autoDispose<
    UserOrdersDataStateNotifier, List<UserOrderItem>>(
  (ref) => UserOrdersDataStateNotifier(),
);

class UserOrdersDataStateNotifier extends StateNotifier<List<UserOrderItem>> {
  UserOrdersDataStateNotifier()
      : super(
          [],
        );

  void updateUserOrdersData(List<UserOrderItem> orders) {
    state = List.from(orders);
  }

  void addItem(UserOrderItem order) {
    state = [order, ...state];
  }
}

final ordersTotalNotifierProvider =
    StateNotifierProvider.autoDispose<TotalOrdersDataStateNotifier, int>(
  (ref) => TotalOrdersDataStateNotifier(),
);

class TotalOrdersDataStateNotifier extends StateNotifier<int> {
  TotalOrdersDataStateNotifier()
      : super(
          0,
        );
  var divider = 5;

  void updateTotalOrdersData(int total) {
    if (total < 6) {
      state = 0;
      return;
    }
    var div = total ~/ divider;
    if (div == 0) {
      div = 1;
    }
    var remain = total % divider;
    if (remain > 0 && remain < total) {
      div++;
    } else if (remain == 0) {
      div = div;
    }
    state = div;
  }

  void setDivider(int value) {
    divider = value;
  }
}

final marketOrdersNotifierProvider = StateNotifierProvider.autoDispose<
    MarketOrdersDataStateNotifier, List<UserOrderItem>>(
  (ref) => MarketOrdersDataStateNotifier(),
);

class MarketOrdersDataStateNotifier extends StateNotifier<List<UserOrderItem>> {
  MarketOrdersDataStateNotifier()
      : super(
          [],
        );

  void updateMarketOrdersData(List<UserOrderItem> orders) {
    state = orders;
  }

  void addMarketItem(UserOrderItem order) {
    state = [order, ...state];
  }
}

final orderFutureProvider =
    FutureProvider.autoDispose.family<List<UserOrderItem>, OrderReqData>(
  (ref, orderReq) async {
    ITradeService service = TradeService();
    OperationResponse<GGetUseOrdersData, GGetUseOrdersVars> userOrderResponse =
        await service.getUserOrders(
      market: orderReq.market!,
      status: orderReq.status!,
      page: orderReq.page,
      limit: orderReq.limit,
    );

    List<UserOrderItem> userOrders = [];

    for (int i = 0;
        i < userOrderResponse.data!.userOrders!.result!.length;
        i++) {
      var marketItem = MarketItem(
          id: userOrderResponse.data!.userOrders!.result![i]!.Market!.id ?? '',
          tradingPricePrecision: userOrderResponse.data!.userOrders!.result![i]!
                  .Market!.trading_price_precision ??
              0,
          tradingAmountPrecision: userOrderResponse.data!.userOrders!
                  .result![i]!.Market!.trading_amount_precision ??
              0,
          quoteCurrencyPrecision: userOrderResponse
              .data!.userOrders!.result![i]!.Market!.quote_currency!.precision);
      var item = UserOrderItem(
        id: userOrderResponse.data!.userOrders!.result![i]!.id ?? '',
        date: userOrderResponse.data!.userOrders!.result![i]!.createdAt ?? '',
        market: userOrderResponse.data!.userOrders!.result![i]!.market ?? '',
        side: userOrderResponse.data!.userOrders!.result![i]!.side ?? '',
        type: userOrderResponse.data!.userOrders!.result![i]!.type ?? '',
        price: userOrderResponse.data!.userOrders!.result![i]!.price ?? 0.0,
        amount: userOrderResponse.data!.userOrders!.result![i]!.amount ?? 0.0,
        total: userOrderResponse.data!.userOrders!.result![i]!.executedAmount ??
            0.0,
        executed:
            userOrderResponse.data!.userOrders!.result![i]!.executedVolume ??
                0.0,
        status: userOrderResponse.data!.userOrders!.result![i]!.status ?? '',
        marketItem: marketItem,
      );
      userOrders.add(item);
    }
    orderReq.market!.isEmpty
        ? ref
            .read(ordersNotifierProvider.notifier)
            .updateUserOrdersData(userOrders)
        : ref
            .read(marketOrdersNotifierProvider.notifier)
            .updateMarketOrdersData(userOrders);

    ref
        .read(ordersTotalNotifierProvider.notifier)
        .updateTotalOrdersData(userOrderResponse.data!.userOrders!.total!);

    return userOrders;
  },
);

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/trade/orderbook/orderbook_state.dart';

final orderBookStateNotifierProvider =
    StateNotifierProvider<OrderBookStateNotifier, OrderBookState>(
  (ref) => OrderBookStateNotifier(),
);

class OrderBookStateNotifier extends StateNotifier<OrderBookState> {
  OrderBookStateNotifier()
      : super(
          const OrderBookState(
            buy: [],
            sell: [],
          ),
        );

  void updateOrderBook(OrderBookState orderBook) {
    state = orderBook;
  }
}

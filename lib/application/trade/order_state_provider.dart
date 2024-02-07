import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/trade/order_state.dart';

final userOrderStateProvider = StateProvider<UserOrderState>(
  (ref) => UserOrderState.userOpenOrders,
);

final marketOrderStateProvider = StateProvider.autoDispose<MarketOrderState>(
  (ref) => MarketOrderState.marketOrderBook,
);

final marketOrderStateWebProvider = StateProvider<MarketOrderState>(
  (ref) => MarketOrderState.marketOpenOrders,
);

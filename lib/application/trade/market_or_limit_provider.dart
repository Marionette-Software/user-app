import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/trade/order_type.dart';

final marketOrLimitProvider = StateProvider<OrderType>(
  (ref) => OrderType.limit,
);

final changeMarketProvider = StateNotifierProvider<ChangeMarketNotifier, bool>(
  (ref) => ChangeMarketNotifier(),
);

class ChangeMarketNotifier extends StateNotifier<bool> {
  ChangeMarketNotifier() : super(false);

  void updateChangeMarketData(bool changeMarket) {
    state = changeMarket;
  }
}

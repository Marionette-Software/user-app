import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/trade/market_dynamic/market_dynamic.dart';

final marketDynamicStateNotifierProvider =
    StateNotifierProvider<MarketDynamicsStateNotifier, MarketDynamic>(
  (ref) => MarketDynamicsStateNotifier(),
);

class MarketDynamicsStateNotifier extends StateNotifier<MarketDynamic> {
  MarketDynamicsStateNotifier()
      : super(
          MarketDynamic.initialData(),
        );

  void updateData(MarketDynamic dynamics) {
    state = dynamics;
  }
}

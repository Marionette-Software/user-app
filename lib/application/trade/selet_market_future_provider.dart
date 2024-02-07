import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/trade/market_trade.dart';

final selectMarketsNotifierProvider = StateNotifierProvider<
    SelectMarketsDataStateNotifier, MarketTrade>(
  (ref) => SelectMarketsDataStateNotifier(),
);

class SelectMarketsDataStateNotifier
    extends StateNotifier<MarketTrade> {
  SelectMarketsDataStateNotifier() : super(MarketTrade.initialData());

  void selectMarketData(MarketTrade selectedMarket) {
    state = selectedMarket;
  }
}

import 'package:hooks_riverpod/hooks_riverpod.dart';

final tradeMarketPriceProvider =
    StateNotifierProvider<TradeMarketPriceNotifierProvider, TradeMarketPrice>(
  (ref) => TradeMarketPriceNotifierProvider(),
);

class TradeMarketPriceNotifierProvider extends StateNotifier<TradeMarketPrice> {
  TradeMarketPriceNotifierProvider()
      : super(
          TradeMarketPrice(),
        );

  void updateData(TradeMarketPrice data) {
    state = data;
  }

  updateSell(String? value) {
    state.sell = value;
  }

  updateBuy(String? value) {
    state.buy = value;
  }
}

class TradeMarketPrice {
  String? sell;
  String? buy;

  TradeMarketPrice({
    this.sell = 'none',
    this.buy = 'none',
  });
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_market_rate.data.gql.dart';

final getMarketRateNotifierProvider = StateNotifierProvider<
    GetMarketRateDataStateNotifier, GGetMarketRateData_marketRate>(
  (ref) => GetMarketRateDataStateNotifier(),
);

class GetMarketRateDataStateNotifier
    extends StateNotifier<GGetMarketRateData_marketRate> {
  GetMarketRateDataStateNotifier() : super(GGetMarketRateData_marketRate());

  void selectMarketData(GGetMarketRateData_marketRate selectedMarket) {
    state = selectedMarket;
  }
}

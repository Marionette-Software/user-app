import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_dynamics_query.data.gql.dart';

final walletMarketDynamicsStateNotifierProvider = StateNotifierProvider<
    WalletMarketDynamicsStateNotifier, GGetMarketDynamicsData_marketDynamics>(
  (ref) => WalletMarketDynamicsStateNotifier(),
);

class WalletMarketDynamicsStateNotifier
    extends StateNotifier<GGetMarketDynamicsData_marketDynamics> {
  WalletMarketDynamicsStateNotifier()
      : super(
          GGetMarketDynamicsData_marketDynamics(),
        );

  void updateWalletMarketDynamicsData(
      GGetMarketDynamicsData_marketDynamics walletMarketDynamics) {
    state = walletMarketDynamics;
  }
}

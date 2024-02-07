import 'package:ferry/typed_links.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_market.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_market.var.gql.dart';
import 'package:user_app/infrastructure/trade/trade_service.dart';

/// Creates a [WalletMarketStateNotifier] and exposes its current state.
///
/// This provider is used in combination with [getWalletMarketFutureProvider].
///
final walletMarketStateNotifierProvider =
    StateNotifierProvider<WalletMarketStateNotifier, GGetMarketData_market>(
  (ref) => WalletMarketStateNotifier(),
);

class WalletMarketStateNotifier extends StateNotifier<GGetMarketData_market> {
  WalletMarketStateNotifier()
      : super(
          GGetMarketData_market(),
        );

  void updateWalletMarketData(GGetMarketData_market walletMarket) {
    state = walletMarket;
  }
}

final getWalletMarketFutureProvider = FutureProvider.autoDispose<
    OperationResponse<GGetMarketData, GGetMarketVars>>(
  (ref) async {
    ITradeService service = TradeService();

    final walletWatch = ref.watch(walletDataStateNotifierProvider);
    final walletMarketWatch =
        ref.watch(walletMarketStateNotifierProvider.notifier);

    var response = await service.getMarket('${walletWatch.id}-USDT');

    if (response is OperationResponse<GGetMarketData, GGetMarketVars>) {
      var resMarket = response.data!.market;
      if (resMarket == null || resMarket.marketDynamics == null) {
        walletMarketWatch.updateWalletMarketData(
          GGetMarketData_market(),
        );
      } else {
        walletMarketWatch.updateWalletMarketData(
          response.data!.market!,
        );
      }
    } else {
      walletMarketWatch.updateWalletMarketData(
        GGetMarketData_market(),
      );
    }

    return response;
  },
);

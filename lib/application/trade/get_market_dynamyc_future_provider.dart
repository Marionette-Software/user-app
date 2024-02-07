import 'package:ferry/ferry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/wallets/wallet_market_dynamics_state_notifier_provider.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_dynamics_query.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_dynamics_query.var.gql.dart';
import 'package:user_app/infrastructure/trade/trade_service.dart';

final getMarketDynamicsFutureProvider = FutureProvider.autoDispose
    .family<GGetMarketDynamicsData_marketDynamics, RefreshRequest>(
  (ref, res) async {
    ITradeService service = TradeService();
    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);
    OperationResponse<GGetMarketDynamicsData, GGetMarketDynamicsVars> response =
        await service.getMarketDynamics(marketDataWatch.id);

    ref
        .watch(walletMarketDynamicsStateNotifierProvider.notifier)
        .updateWalletMarketDynamicsData(
          response.data!.marketDynamics!,
        );

    return response.data!.marketDynamics!;
  },
);

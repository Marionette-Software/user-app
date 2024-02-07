import 'package:ferry/ferry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/wallets_data.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/wallets_data.var.gql.dart';
import 'package:user_app/infrastructure/trade/trade_service.dart';

final getWalletsForTradeFutureProvider = FutureProvider.autoDispose.family<
    OperationResponse<GTradeWalletsDataData, GTradeWalletsDataVars>,
    RefreshRequest>(
  (ref, request) async {
    ITradeService service = TradeService();

    ref.watch(selectMarketsNotifierProvider);

    OperationResponse<GTradeWalletsDataData, GTradeWalletsDataVars>
        walletsResponse = await service.getUserWallets();

    ref
        .read(walletTradeDataStateNotifierProvider.notifier)
        .updateTradeWalletData(
            walletsResponse.data!.user!.currencies!.toList());

    return walletsResponse;
  },
);

final walletTradeDataStateNotifierProvider = StateNotifierProvider<
    UserTradingWalletStateNotifier,
    List<GTradeWalletsDataData_user_currencies?>>(
  (ref) => UserTradingWalletStateNotifier(),
);

class UserTradingWalletStateNotifier
    extends StateNotifier<List<GTradeWalletsDataData_user_currencies?>> {
  UserTradingWalletStateNotifier() : super([]);

  void updateTradeWalletData(
      List<GTradeWalletsDataData_user_currencies?> wallet) {
    state = wallet;
  }
}

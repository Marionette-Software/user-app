import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_history_by_wallet.data.gql.dart';

final walletHistoryDataStateNotifierProvider =
    StateNotifierProvider.autoDispose<WalletHistoryDataStateNotifier,
        List<GGetUserHistoryByIdData_history_result?>>(
  (ref) => WalletHistoryDataStateNotifier(),
);

class WalletHistoryDataStateNotifier
    extends StateNotifier<List<GGetUserHistoryByIdData_history_result?>> {
  WalletHistoryDataStateNotifier()
      : super(
          [],
        );

  void updateWalletData(List<GGetUserHistoryByIdData_history_result?> history) {
    state = history;
  }
}

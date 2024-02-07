import 'package:ferry/ferry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/history/history_wallet_notifire_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_history_by_wallet.data.gql.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_history_by_wallet.var.gql.dart';
import 'package:user_app/infrastructure/user/user_service.dart';

final walletHistoryGetFutureProvider = FutureProvider.autoDispose<
        OperationResponse<GGetUserHistoryByIdData, GGetUserHistoryByIdVars>>(
    (ref) async {
  IUserService service = UserService();

  final walletData = ref.watch(walletDataStateNotifierProvider);

  OperationResponse<GGetUserHistoryByIdData, GGetUserHistoryByIdVars>
      userResponse = await service.getWalletHistory(walletData.id);

  List<GGetUserHistoryByIdData_history_result?> walletHistoryList =
      userResponse.data!.history!.result!.toList();

  ref
      .read(walletHistoryDataStateNotifierProvider.notifier)
      .updateWalletData(walletHistoryList);

  return userResponse;
});

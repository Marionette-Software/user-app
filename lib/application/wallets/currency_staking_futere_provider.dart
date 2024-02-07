import 'package:ferry/ferry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/domain/wallet/staking_currency.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_staking_currency.data.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_staking_currency.var.gql.dart';
import 'package:user_app/infrastructure/wallet/wallet_service.dart';

final stakingCurrencyDataStateNotifierProvider =
    StateNotifierProvider<StakingCurrencyDataStateNotifier, StakingCurrency>(
  (ref) => StakingCurrencyDataStateNotifier(),
);

class StakingCurrencyDataStateNotifier extends StateNotifier<StakingCurrency> {
  StakingCurrencyDataStateNotifier()
      : super(
          StakingCurrency.initialData(),
        );

  void updateStakingCurrencyData(StakingCurrency stakingCurrency) {
    state = stakingCurrency;
  }
}

final getCurrencyStakingFutureProvider =
    FutureProvider.autoDispose.family<StakingCurrency, RefreshRequest>(
  (ref, request) async {
    IWalletService service = WalletService();
    final walletData = ref.watch(walletDataStateNotifierProvider);

    OperationResponse<GGetStakingCurrencyData, GGetStakingCurrencyVars>
        getCurrencyStakingResponse =
        await service.getStakingCurrency(currencyId: walletData.id);

    StakingCurrency stakingCurrencyData = StakingCurrency(
      id: getCurrencyStakingResponse.data!.stakingCurrency!.id!,
      staking_period:
          getCurrencyStakingResponse.data!.stakingCurrency!.staking_period,
      staking_apr:
          getCurrencyStakingResponse.data!.stakingCurrency!.staking_apr,
      min_staking_amount:
          getCurrencyStakingResponse.data!.stakingCurrency!.min_staking_amount,
      last_staking_calc:
          getCurrencyStakingResponse.data!.stakingCurrency!.last_staking_calc,
      next_staking_calc:
          getCurrencyStakingResponse.data!.stakingCurrency!.next_staking_calc,
      next_reward_amount:
          getCurrencyStakingResponse.data!.stakingCurrency!.next_reward_amount,
      locked_balance:
          getCurrencyStakingResponse.data!.stakingCurrency!.locked_balance,
      active_balance:
          getCurrencyStakingResponse.data!.stakingCurrency!.active_balance,
      isUnstakingProcess:
          getCurrencyStakingResponse.data!.stakingCurrency!.isUnstakingProcess,
    );

    ref
        .read(stakingCurrencyDataStateNotifierProvider.notifier)
        .updateStakingCurrencyData(stakingCurrencyData);

    return stakingCurrencyData;
  },
);

import 'dart:convert';
import 'package:ferry/ferry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/domain/wallet/user_balance.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_user_balances.data.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_user_balances.var.gql.dart';
import 'package:user_app/infrastructure/wallet/wallet_service.dart';

final userBalancesStateNotifierProvider =
    StateNotifierProvider<UserBalancesStateNotifier, List<UserBalance>>(
  (ref) => UserBalancesStateNotifier(),
);

class UserBalancesStateNotifier extends StateNotifier<List<UserBalance>> {
  UserBalancesStateNotifier() : super([]);

  void saveBalance(List<UserBalance> sortedListBalance) {
    state = sortedListBalance;
  }

  void updateBalance(List<UserBalance> sortedListBalance) {
    state = List.from(_updateList(state, sortedListBalance));
  }

  List<UserBalance> _updateList(
      List<UserBalance> oldList, List<UserBalance> newList) {
    for (var newItem in newList) {
      int index = oldList.indexWhere((oldItem) => oldItem.id == newItem.id);
      if (index != -1) {
        if (oldList[index].balance != newItem.balance) {
          oldList[index].balance = newItem.balance;
        }
        if (oldList[index].advancedTradingLockedBalance !=
            newItem.advancedTradingLockedBalance) {
          oldList[index].advancedTradingLockedBalance =
              newItem.advancedTradingLockedBalance;
        }
        if (oldList[index].lockedBalance != newItem.lockedBalance) {
          oldList[index].lockedBalance = newItem.lockedBalance;
        }
        if (oldList[index].advancedTradingBalance !=
            newItem.advancedTradingBalance) {
          oldList[index].advancedTradingBalance =
              newItem.advancedTradingBalance;
        }
        if (oldList[index].stakingLockedBalance !=
            newItem.stakingLockedBalance) {
          oldList[index].stakingLockedBalance = newItem.stakingLockedBalance;
        }
        if (oldList[index].activeStakingBalance !=
            newItem.activeStakingBalance) {
          oldList[index].activeStakingBalance = newItem.activeStakingBalance;
        }
        if (oldList[index].withdrawLockedBalance !=
            newItem.withdrawLockedBalance) {
          oldList[index].withdrawLockedBalance = newItem.withdrawLockedBalance;
        }
      }
    }
    return oldList;
  }
}

final getUserBalanceFutureProvider =
    FutureProvider.autoDispose.family<List<UserBalance>, RefreshRequest>(
  (ref, request) async {
    IWalletService service = WalletService();

    OperationResponse<GGetUserBalancesData, GGetUserBalancesVars> response =
        await service.getUserBalances();

    final list = response.data!.user!.currencies!.toList();
    final jsonData = jsonEncode(list);
    Iterable data = json.decode(jsonData);

    List<UserBalance> balances = List<UserBalance>.from(
      data.map(
        (model) => UserBalance.fromJson(model),
      ),
    );

    List<UserBalance> sortedList = [];
    for (int i = 0; i < balances.length; i++) {
      if (balances[i].enabled != false) {
        sortedList.add(balances[i]);
      }
    }
    ref
        .read(userBalancesStateNotifierProvider.notifier)
        .saveBalance(sortedList);

    return sortedList;
  },
);

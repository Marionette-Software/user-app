import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/domain/wallet/user_balance.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_all_balance_subscription.req.gql.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_all_balance_subscription.data.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_all_balance_subscription.var.gql.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/swap/swap_dialog.dart';

class SwapWithNavBarMobile extends StatefulHookConsumerWidget {
  const SwapWithNavBarMobile({
    required this.amountTo,
    required this.amountFrom,
    super.key,
  });

  final String amountTo;
  final String amountFrom;

  @override
  ConsumerState<SwapWithNavBarMobile> createState() =>
      _SwapWithNavBarMobileState();
}

class _SwapWithNavBarMobileState extends ConsumerState<SwapWithNavBarMobile> {
  @override
  Widget build(BuildContext context) {
    final userBalancesStateRead =
        ref.read(userBalancesStateNotifierProvider.notifier);
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    var uBox = Hive.box<UserConfigData>(Constants.userConfig);
    GlobalConfigData globalData = box.getAt(0)!;
    UserConfigData userData = uBox.getAt(0)!;

    return Operation(
      client: subscriptionClient(globalData.url),
      operationRequest: GUserAllBalanceReq(
        (b) => b..vars.token = userData.token ?? '',
      ),
      builder: (
        BuildContext context,
        OperationResponse<GUserAllBalanceData?, GUserAllBalanceVars>? response,
        Object? error,
      ) {
        if (response != null &&
            response.data != null &&
            response.data!.userAllBalance != null) {
          List<UserBalance> userAllBalance = [];

          for (var p0 in response.data!.userAllBalance!) {
            userAllBalance.add(
              UserBalance(
                id: p0!.currencyId ?? 'N/A',
                enabled: true,
                balance: p0.balance!,
                lockedBalance: p0.lockedBalance!,
                advancedTradingLockedBalance: p0.advancedTradingLockedBalance!,
                advancedTradingBalance: p0.advancedTradingBalance!,
                withdrawLockedBalance: p0.withdrawLockedBalance,
                stakingLockedBalance: p0.stakingLockedBalance,
                activeStakingBalance: p0.activeStakingBalance,
              ),
            );
          }
          Future.delayed(Duration.zero, () {
            userBalancesStateRead.updateBalance(userAllBalance);
          });
        }

        return SwapMobile(
          fromControllerInitValue: widget.amountFrom,
          toControllerInitValue: widget.amountTo,
          withTradingBalance: globalData.withTradingBalance,
        );
      },
    );
  }
}

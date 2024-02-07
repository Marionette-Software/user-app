import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/domain/wallet/user_balance.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_all_balance_subscription.data.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_all_balance_subscription.req.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_all_balance_subscription.var.gql.dart';
import 'package:user_app/presentation/app/components/header_web/header_web.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_history/wallet_history.dart';
import 'package:user_app/presentation/app/wallets/components/wallets_list/wallets_container.dart';
import 'package:user_app/presentation/app/wallets/web/components/portfolio_overview/portfolio_overview.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/wallet_details_column.dart';
import 'package:user_app/presentation/auth/web/components/footer_components/footer.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/portfolio_overview/sort_wallets_for_portfolio.dart';

class WalletsWeb extends HookConsumerWidget {
  const WalletsWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreshValue = useState(1);

    final getWalletsFuture = ref.watch(
      getWalletsFutureProvider(
        RefreshRequest(refresh: '$refreshValue'),
      ),
    );
    final userBalancesStateRead =
        ref.read(userBalancesStateNotifierProvider.notifier);

    final getUserBalanceFuture = ref.watch(
      getUserBalanceFutureProvider(
        RefreshRequest(refresh: '$refreshValue'),
      ),
    );

    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    var uBox = Hive.box<UserConfigData>(Constants.userConfig);
    GlobalConfigData globalData = box.getAt(0)!;
    UserConfigData userData = uBox.getAt(0)!;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: const HeaderWeb(),
      ),
      body: getWalletsFuture.when(
        data: (getWalletsData) {
          return getUserBalanceFuture.when(
            data: (data) {
              return Operation(
                client: subscriptionClient(globalData.url),
                operationRequest: GUserAllBalanceReq(
                  (b) => b
                    ..vars.token = userData.token ?? ''
                    ..fetchPolicy = FetchPolicy.NoCache,
                ),
                builder: (
                  BuildContext context,
                  OperationResponse<GUserAllBalanceData?, GUserAllBalanceVars>?
                      response,
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
                          advancedTradingLockedBalance:
                              p0.advancedTradingLockedBalance!,
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
                  return Stack(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 25.h,
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          WalletsContainer(
                                            wallets: getWalletsData,
                                          ),
                                          SizedBox(
                                            width: 22.w,
                                          ),
                                          const WalletDetailsColumn()
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  Column(
                                    children: [
                                      Consumer(
                                        builder: (_, ref, __) {
                                          final userBalances = ref.watch(
                                              userBalancesStateNotifierProvider);
                                          return PortfolioOverview(
                                            wallets: sortPortfolioWallets(
                                              getWalletsData,
                                              userBalances,
                                            ),
                                            balances: userBalances,
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 25.h,
                                        ),
                                        child: const WalletHistoryWeb(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 91.h,
                              ),
                              const FooterWeb(),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            },
            error: (error, _) {
              return UserAppError(
                errorMessage: error.toString(),
              );
            },
            loading: () => const MainLoader(),
          );
        },
        error: (error, _) {
          return UserAppError(
            errorMessage: error.toString(),
          );
        },
        loading: () => const MainLoader(),
      ),
    );
  }
}

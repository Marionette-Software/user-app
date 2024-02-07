import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/domain/wallet/user_balance.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_all_balance_subscription.req.gql.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/portfolio_overview/components/get_porfolio_sum.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/portfolio_overview/portfolio_mobile.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallets_list/wallets_container_mobile.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_all_balance_subscription.data.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_all_balance_subscription.var.gql.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class WalletsMobile extends HookConsumerWidget {
  const WalletsMobile({super.key});

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

    return SafeArea(
      child: getWalletsFuture.when(
        data: (getWalletsData) {
          return getUserBalanceFuture.when(
            data: (getUserBalance) {
              return Operation(
                client: subscriptionClient(globalData.url),
                operationRequest: GUserAllBalanceReq(
                  (b) => b..vars.token = userData.token ?? '',
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
                  return Scaffold(
                    resizeToAvoidBottomInset: true,
                    backgroundColor: AppColors.mainBackgroundDarkColor,
                    appBar: PreferredSize(
                      preferredSize: Size.fromHeight(170..h),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 25.w, right: 30.w, top: 50..h, bottom: 10..h),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total value:'.hardcoded,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.5),
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.65.sp,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 5..h,
                                    ),
                                    const GetPortfolioSumMobile(),
                                  ],
                                ),
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Text(
                                      'Portfolio',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                            color: AppColors.whiteColor
                                                .withOpacity(0.5),
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.65.sp,
                                            fontStyle: FontStyle.normal,
                                          ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const PortfolioOverviewMobile(),
                                          ),
                                        );
                                      },
                                      child: SvgPicture.asset(
                                        portfolioMobileIcon,
                                        height: 75.h,
                                        width: 75.w,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    body: Container(
                      margin: EdgeInsets.only(
                        top: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: isLightTheme(context)
                            ? AppColors.whiteColor
                            : walletBackgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: WalletsContainerMobile(
                              wallets: getWalletsData,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            error: (error, _) => UserAppError(
              errorMessage: error.toString(),
            ),
            loading: () => const MainLoaderMobile(),
          );
        },
        error: (error, _) => UserAppError(
          errorMessage: error.toString(),
        ),
        loading: () => const MainLoaderMobile(),
      ),
    );
  }
}

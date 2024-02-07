import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/wallet/statistic_wallet_data.dart';
import 'package:user_app/domain/wallet/user_balance.dart';
import 'package:user_app/domain/wallet/user_wallet.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/portfolio_overview/components/portfolio_item.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/portfolio_overview/components/portfolio_pie_chart.dart';
import 'package:user_app/presentation/app/wallets/web/components/portfolio_overview/portfolio_overview.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/portfolio_overview/sort_wallets_for_portfolio.dart';
import 'package:user_app/presentation/helpers/sum_with_balance.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class PortfolioOverviewMobile extends HookConsumerWidget {
  const PortfolioOverviewMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<PieChartItemState> statisticBalanceAndName = [];
    List<Color> statsColors = [];
    double sumBalanceToUsdt;
    double allSumBalanceToUsdt = 0;

    double other = 0;
    List<StatisticWalletDataState> sortedWalletData = [];
    List<StatisticWalletDataState> sortedWalletDataWithOther = [];

    final List<UserWallet> wallets = sortPortfolioWallets(
      ref.watch(walletsListDataStateNotifierProvider),
      ref.watch(userBalancesStateNotifierProvider),
    );

    final List<UserBalance> balances =
        ref.watch(userBalancesStateNotifierProvider);

    for (int i = 0; i < wallets.length; i++) {
      sumBalanceToUsdt = convertBalanceToUsdt(
        wallets,
        i,
        balances,
      );

      final walletBalances =
          balances.firstWhere((element) => element.id == wallets[i].id);
      final wallet =
          wallets.firstWhere((element) => element.id == wallets[i].id);

      if (sumBalanceToUsdt > 0) {
        sortedWalletData.add(
          StatisticWalletDataState(
            amount: (walletBalances.lockedBalance! +
                    walletBalances.activeStakingBalance! +
                    walletBalances.advancedTradingBalance! +
                    walletBalances.advancedTradingLockedBalance! +
                    walletBalances.balance! +
                    walletBalances.stakingLockedBalance! +
                    walletBalances.withdrawLockedBalance!)
                .toStringAsFixed(wallet.precision),
            balanceToUsdt: sumBalanceToUsdt,
            id: wallets[i].id.toUpperCase(),
            color: getWalletColor(
              wallets[i].lightBgColor1,
              wallets[i].darkBgColor1,
              isLightTheme(context),
            ),
            iconUrl: wallets[i].iconUrl,
          ),
        );
        allSumBalanceToUsdt = allSumBalanceToUsdt + sumBalanceToUsdt;
      }
    }

    sortedWalletData.sort((a, b) => b.balanceToUsdt.compareTo(a.balanceToUsdt));

    for (int i = 0; i < sortedWalletData.length; i++) {
      if (i >= 5) {
        other = other + sortedWalletData[i].balanceToUsdt;
      }

      if (i < 5) {
        sortedWalletDataWithOther.add(sortedWalletData[i]);
      } else if (i == sortedWalletData.length - 1) {
        sortedWalletDataWithOther.add(
          StatisticWalletDataState(
            amount: '',
            iconUrl: isLightTheme(context)
                ? emptyPortfolioItemLightIcon
                : emptyPortfolioItemDarkIcon,
            balanceToUsdt: other,
            id: 'Other',
            color: isLightTheme(context)
                ? AppColors.borderSideColor
                : const Color(0xFFA5A3A3),
          ),
        );
      }
    }

    for (var element in sortedWalletDataWithOther) {
      statisticBalanceAndName.add(
        PieChartItemState(
          id: element.id,
          balanceToUsdt: double.parse(
              ((element.balanceToUsdt * 100) / allSumBalanceToUsdt)
                  .toStringAsFixed(1)),
          color: element.color,
        ),
      );

      statsColors.add(element.color);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainBackgroundDarkColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50..h),
          child: Padding(
            padding: EdgeInsets.only(
              top: 15..h,
              bottom: 12..h,
              left: 25.w,
            ),
            child: Row(
              children: [
                BackButtonMobile(
                  onTap: () => context.pop(),
                ),
                Expanded(
                  child: AutoSizeText(
                    'Portfolio Overview'.hardcoded,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 15.sp,
                          letterSpacing: -0.75.sp,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const IgnorePointer(
                  child: Opacity(
                    opacity: 0,
                    child: SearchButtonMobile(),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            color: isLightTheme(context)
                ? AppColors.whiteColor
                : walletBackgroundColor,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 25..h,
                top: 25..h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PortfolioPieChartMobile(
                    statsColors: statsColors,
                    allSumBalanceToUsdt: allSumBalanceToUsdt,
                    statisticBalanceAndName: statisticBalanceAndName,
                  ),
                  SizedBox(
                    height: 30..h,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20..h,
                    ),
                    itemCount: sortedWalletDataWithOther.length,
                    itemBuilder: (context, i) {
                      return PortfolioItemMobile(
                        item: sortedWalletDataWithOther[i],
                        allSumBalanceToUsdt: allSumBalanceToUsdt,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

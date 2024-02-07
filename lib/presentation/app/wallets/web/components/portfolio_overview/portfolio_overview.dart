import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/wallet/statistic_wallet_data.dart';
import 'package:user_app/domain/wallet/user_balance.dart';
import 'package:user_app/domain/wallet/user_wallet.dart';
import 'package:user_app/presentation/app/wallets/web/components/portfolio_overview/components/empty_portfolio.dart';
import 'package:user_app/presentation/app/wallets/web/components/portfolio_overview/components/empty_portfolio_item.dart';
import 'package:user_app/presentation/app/wallets/web/components/portfolio_overview/components/portfolio_item.dart';
import 'package:user_app/presentation/app/wallets/web/components/portfolio_overview/components/portfolio_pie_chart.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/sum_with_balance.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class PortfolioOverview extends StatelessWidget {
  const PortfolioOverview({
    super.key,
    required this.wallets,
    required this.balances,
  });

  final List<UserWallet> wallets;
  final List<UserBalance> balances;

  @override
  Widget build(BuildContext context) {
    List<PieChartItemState> statisticBalanceAndName = [];
    List<Color> statsColors = [];
    double sumBalanceToUsdt;
    double allSumBalanceToUsdt = 0;

    double other = 0;
    List<StatisticWalletDataState> sortedWalletData = [];
    List<StatisticWalletDataState> sortedWalletDataWithOther = [];

    for (int i = 0; i < wallets.length; i++) {
      sumBalanceToUsdt = convertBalanceToUsdt(
        wallets,
        i,
        balances,
      );

      if (sumBalanceToUsdt > 0) {
        final walletBalances =
            balances.firstWhere((element) => element.id == wallets[i].id);
        final wallet =
            wallets.firstWhere((element) => element.id == wallets[i].id);

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

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 670.w,
        height: 400.h,
        child: Padding(
          padding: EdgeInsets.only(
            top: sortedWalletDataWithOther.isEmpty ? 32.h : 39.h,
            bottom: 56.h,
            left: 50.w,
            right: 57.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              sortedWalletDataWithOther.isEmpty
                  ? const EmptyPortfolio()
                  : Row(
                      children: [
                        PortfolioPieChart(
                          statsColors: statsColors,
                          allSumBalanceToUsdt: allSumBalanceToUsdt,
                          statisticBalanceAndName: statisticBalanceAndName,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 250.w,
                          child: ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => SizedBox(
                              height: 25.h,
                            ),
                            itemCount: 6,
                            itemBuilder: (context, i) {
                              if (i >= sortedWalletDataWithOther.length) {
                                return const EmptyPortfolioItem(
                                  withEmptyPortfolio: false,
                                );
                              } else {
                                return PortfolioItem(
                                  item: sortedWalletDataWithOther[i],
                                  allSumBalanceToUsdt: allSumBalanceToUsdt,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class PieChartItemState {
  const PieChartItemState({
    required this.id,
    required this.balanceToUsdt,
    required this.color,
  });

  final String id;
  final double balanceToUsdt;
  final Color color;
}

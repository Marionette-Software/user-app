import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/get_wallet_history_kline_futere_provider.dart';
import 'package:user_app/application/wallets/wallet_market_state_notifier_provider.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_chart_web/components/chart_web.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_chart_web/components/header_chart.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_chart_web/components/wallet_market_dynamics.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/helpers/error.dart';

class WalletChartWeb extends HookConsumerWidget {
  const WalletChartWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletMarketWatch = ref.watch(walletMarketStateNotifierProvider);
    final walletHistoryKlineFuture =
        ref.watch(getWalletsHistoryKlineFutureProvider);

    final getMarketWithWalletFuture = ref.watch(getWalletMarketFutureProvider);

    return walletMarketWatch.id != null
        ? Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Column(
              children: [
                SizedBox(
                  child: MainDecorationContainerWeb(
                    content: SizedBox(
                      height: 400.h,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 25.h,
                          bottom: 15.h,
                        ),
                        child: getMarketWithWalletFuture.when(
                          data: (dataMarket) {
                            return walletHistoryKlineFuture.when(
                              data: (data) {
                                var walletHistoryKline =
                                    data.data!.kline!.toList();

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const HeaderChart(),
                                    SizedBox(height: 18.h),
                                    ChartWeb(
                                      walletHistoryKline: walletHistoryKline,
                                    ),
                                    SizedBox(height: 15.h),
                                    const WalletMarketDynamics(),
                                  ],
                                );
                              },
                              loading: () => SizedBox(
                                height: 360.h,
                                child: const MainLoader(),
                              ),
                              error: (error, _) => () {
                                return UserAppError(
                                  errorMessage: error.toString(),
                                );
                              }(),
                            );
                          },
                          loading: () => SizedBox(
                            height: 360.h,
                            child: const MainLoader(),
                          ),
                          error: (error, _) => () {
                            return UserAppError(
                              errorMessage: error.toString(),
                            );
                          }(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/get_wallet_history_kline_futere_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/application/wallets/wallet_market_state_notifier_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/app/trade/trade.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/wallet_chart/componenst/chart_mobile.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/wallet_chart/componenst/headre_wallet_chart_mobile.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/wallet_chart/componenst/wallet_market_dynamics_mobile.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ContainerWalletChartMobile extends HookConsumerWidget {
  const ContainerWalletChartMobile({required this.scrollController, super.key});

  final ScrollController scrollController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletMarketWatch = ref.watch(walletMarketStateNotifierProvider);
    final walletState = ref.watch(walletDataStateNotifierProvider);

    final walletHistoryKlineFuture =
        ref.watch(getWalletsHistoryKlineFutureProvider);

    final getMarketWithWalletFuture = ref.watch(getWalletMarketFutureProvider);

    return walletMarketWatch.id != null
        ? Padding(
            padding: EdgeInsets.only(
              top: 15..h,
              left: 15.w,
              right: 15.w,
            ),
            child: Container(
              width: 360.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: isLightTheme(context)
                    ? Border.all(
                        width: 1,
                        color: AppColors.mainBackgroundLightColor,
                      )
                    : null,
                color: isLightTheme(context)
                    ? AppColors.whiteColor
                    : AppColors.whiteColor.withOpacity(0.05),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 11..h, bottom: 15..h),
                child: getMarketWithWalletFuture.when(
                  data: (dataMarket) {
                    return walletHistoryKlineFuture.when(
                      data: (data) {
                        var walletHistoryKline = data.data!.kline!.toList();

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const HeaderWalletChartMobile(),
                            SizedBox(height: 18..h),
                            WalletChartMobile(
                              walletHistoryKline: walletHistoryKline,
                            ),
                            SizedBox(height: 14..h),
                            const WalletMarketDynamicsMobile(),
                            SizedBox(height: 15..h),
                            InkWell(
                              borderRadius: BorderRadius.circular(25.r),
                              onTap: () {
                                context.go(Trade.routeName);
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 306.w,
                                  height: 45..h,
                                  decoration: BoxDecoration(
                                    color: HexColor(walletState.lightBgColor1!),
                                    borderRadius: BorderRadius.circular(25.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Open Trading'.hardcoded,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                            color: AppColors.whiteColor,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: -0.75.sp,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      loading: () => const SizedBox(
                        child: MainLoaderMobile(
                          loaderSize: 100,
                        ),
                      ),
                      error: (error, _) => () {
                        return UserAppError(
                          errorMessage: error.toString(),
                        );
                      }(),
                    );
                  },
                  loading: () => const SizedBox(
                    child: MainLoaderMobile(
                      loaderSize: 100,
                    ),
                  ),
                  error: (error, _) => () {
                    return UserAppError(
                      errorMessage: error.toString(),
                    );
                  }(),
                ),
              ),
            ),
          )
        : Container();
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/trade_avalible_balance_state_provider.dart';
import 'package:user_app/application/user_data/global_data_future_provider.dart';
import 'package:user_app/application/wallets/timestamp_state_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/trade/market_trade.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/presentation/app/trade/mobile/components/open_book_and_open_orders.dart';
import 'package:user_app/presentation/app/trade/mobile/components/market_page/components/bottom_batton_panel.dart';
import 'package:user_app/presentation/app/trade/mobile/components/trade_chart/trade_chart.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_balance_update_subscription.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_balance_update_subscription.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_balance_update_subscription.var.gql.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SelectedMarketMobile extends StatefulHookConsumerWidget {
  const SelectedMarketMobile({
    super.key,
    required this.item,
  });

  final MarketTrade item;

  @override
  ConsumerState<SelectedMarketMobile> createState() =>
      _SelectedMarketMobileState();
}

class _SelectedMarketMobileState extends ConsumerState<SelectedMarketMobile> {
  @override
  Widget build(BuildContext context) {
    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);
    final tradeMarketPriceRead = ref.read(tradeMarketPriceProvider.notifier);

    final timestampQuatBalanceWatch =
        ref.watch(timestampQuatBalanceStateProvider);
    final timestampQuatBalanceRead =
        ref.read(timestampQuatBalanceStateProvider.notifier);

    final timestampBaseBalanceWatch =
        ref.watch(timestampBaseBalanceStateProvider);
    final timestampBaseBalanceRead =
        ref.read(timestampBaseBalanceStateProvider.notifier);
    final globalData = ref.watch(configDataFutureProvider);

    final ScrollController scrollController = ScrollController();
    var userConfigBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userConfigBox.getAt(0)!;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainBackgroundDarkColor,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50..h),
          child: Padding(
            padding: EdgeInsets.only(top: 15..h, left: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BackButtonMobile(
                  onTap: () => context.pop(),
                ),
                Expanded(
                  child: AutoSizeText(
                    'Trade ${widget.item.base_currency.name}',
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
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 10..h,
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
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Scrollbar(
                controller: scrollController,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 15..h,
                          left: 15.w,
                          right: 15.w,
                        ),
                        decoration: BoxDecoration(
                          color: isLightTheme(context)
                              ? AppColors.whiteColor
                              : Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10.r),
                          border: isLightTheme(context)
                              ? Border.all(
                                  width: 1.h,
                                  color: AppColors.mainBackgroundLightColor,
                                )
                              : null,
                        ),
                        child: ContainerTradeChartMobile(
                          item: widget.item,
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20..h, bottom: 80..h),
                          child: OrderBookAndOpenOrderMobile(
                            scrollController: scrollController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              userData.token != null
                  ? Positioned(
                      bottom: 0,
                      child: globalData.when(
                        data: (data) {
                          GlobalConfigData gData = data[Constants.globalConfig];
                          UserConfigData uData = data[Constants.userConfig];
                          return Operation(
                            client: subscriptionClient(gData.url),
                            operationRequest: GGetUserBalanceUpdatedReq(
                              (b) => b..vars.token = uData.token!,
                            ),
                            builder: (
                              BuildContext context,
                              OperationResponse<GGetUserBalanceUpdatedData,
                                      GGetUserBalanceUpdatedVars>?
                                  response,
                              Object? error,
                            ) {
                              if (response != null &&
                                  response.data != null &&
                                  response.data!.userBalanceUpdated != null) {
                                if (response
                                        .data!.userBalanceUpdated!.currencyId ==
                                    marketDataWatch.quote_currency.id) {
                                  Future.delayed(
                                    Duration.zero,
                                    () {
                                      timestampQuatBalanceRead.state =
                                          int.parse(response
                                              .data!.userBalanceUpdated!.ts!);
                                    },
                                  );

                                  if (int.parse(response
                                          .data!.userBalanceUpdated!.ts!) >=
                                      timestampQuatBalanceWatch) {
                                    Future.delayed(
                                      Duration.zero,
                                      () {
                                        timestampQuatBalanceRead.state =
                                            int.parse(response
                                                .data!.userBalanceUpdated!.ts!);
                                      },
                                    );

                                    tradeMarketPriceRead.updateBuy(
                                      (gData.withTradingBalance
                                              ? response
                                                  .data!
                                                  .userBalanceUpdated!
                                                  .advancedTradingBalance!
                                              : (response
                                                      .data!
                                                      .userBalanceUpdated!
                                                      .advancedTradingBalance! +
                                                  response
                                                      .data!
                                                      .userBalanceUpdated!
                                                      .balance!))
                                          .toStringAsFixed(marketDataWatch
                                              .quote_currency.precision),
                                    );
                                  }
                                } else if (response
                                        .data!.userBalanceUpdated!.currencyId ==
                                    marketDataWatch.base_currency.id) {
                                  Future.delayed(Duration.zero, () {
                                    timestampBaseBalanceRead.state = int.parse(
                                        response.data!.userBalanceUpdated!.ts!);
                                  });

                                  if (int.parse(response
                                          .data!.userBalanceUpdated!.ts!) >=
                                      timestampBaseBalanceWatch) {
                                    Future.delayed(
                                      Duration.zero,
                                      () {
                                        timestampBaseBalanceRead.state =
                                            int.parse(response
                                                .data!.userBalanceUpdated!.ts!);
                                      },
                                    );

                                    tradeMarketPriceRead.updateSell(
                                      (gData.withTradingBalance
                                              ? response
                                                  .data!
                                                  .userBalanceUpdated!
                                                  .advancedTradingBalance!
                                              : (response
                                                      .data!
                                                      .userBalanceUpdated!
                                                      .advancedTradingBalance! +
                                                  response
                                                      .data!
                                                      .userBalanceUpdated!
                                                      .balance!))
                                          .toStringAsFixed(marketDataWatch
                                              .base_currency.precision),
                                    );
                                  }
                                }
                              }

                              return BottomButtonPanelMobile(
                                item: widget.item,
                              );
                            },
                          );
                        },
                        error: (error, stacktrace) {
                          return const Text('error');
                        },
                        loading: () => const SizedBox(),
                      ),
                    )
                  : Positioned(
                      bottom: 0,
                      child: BottomButtonPanelMobile(
                        item: widget.item,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

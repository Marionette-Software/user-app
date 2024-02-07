import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/trade_history/trade_history_future_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_private_trades_subscription.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_private_trades_subscription.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_private_trades_subscription.var.gql.dart';
import 'package:user_app/presentation/app/trade/web/components/market_my_trades/componenst/header_my_trades.dart';
import 'package:user_app/presentation/app/trade/web/components/market_my_trades/componenst/my_trade_item.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/domain/trade/trade_history/trade_history_item.dart'
    as TradeHistoryItemDTO;
import 'package:user_app/presentation/helpers/theme.dart';

class MarketMyTradesWeb extends HookConsumerWidget {
  const MarketMyTradesWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectMarketWatch = ref.watch(selectMarketsNotifierProvider);
    final getUserTradesHistory = ref.watch(
      getUserTradesHistoryFutureProvider(
        selectMarketWatch.id,
      ),
    );

    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    var uBox = Hive.box<UserConfigData>(Constants.userConfig);
    ScrollController controllerScroll = ScrollController();

    GlobalConfigData globalData = box.getAt(0)!;
    UserConfigData userData = uBox.getAt(0)!;

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: getUserTradesHistory.when(
          data: (data) {
            var userHistoryTrades = data;

            return Scrollbar(
              child: SingleChildScrollView(
                child: Operation(
                  operationRequest: GGetPrivateTradesReq(
                    (b) => b
                      ..vars.market = selectMarketWatch.id
                      ..vars.token = userData.token,
                  ),
                  client: subscriptionClient(globalData.url),
                  builder: (
                    BuildContext context,
                    OperationResponse<GGetPrivateTradesData,
                            GGetPrivateTradesVars>?
                        response,
                    Object? error,
                  ) {
                    if (response!.data != null &&
                        response.data!.privateTrades != null &&
                        response.data!.privateTrades!.amount != null &&
                        response.data!.privateTrades!.price != null &&
                        response.data!.privateTrades!.createdAt != null) {
                      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
                        int.tryParse(response.data!.privateTrades!.createdAt!)!,
                        isUtc: true,
                      );

                      String formattedDateItem =
                          dateTime.toUtc().toIso8601String().substring(0, 23);

                      TradeHistoryItemDTO.TradeHistoryItem item =
                          TradeHistoryItemDTO.TradeHistoryItem(
                        price: response.data!.privateTrades!.price!,
                        amount: response.data!.privateTrades!.amount!,
                        date: formattedDateItem,
                        side: response.data!.privateTrades!.side!,
                      );
                      userHistoryTrades = [item, ...userHistoryTrades];
                    }
                    return Column(
                      children: [
                        const HeaderMyTradesWeb(),
                        userHistoryTrades.isEmpty
                            ? Padding(
                                padding: EdgeInsets.only(top: 74.h),
                                child: Text(
                                  'No order history',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -1.sp,
                                        color: isLightTheme(context)
                                            ? AppColors.aboutHeaderLight
                                            : AppColors.whiteColor
                                                .withOpacity(0.5),
                                      ),
                                ),
                              )
                            : ListView.separated(
                                controller: controllerScroll,
                                shrinkWrap: true,
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 10.h,
                                ),
                                itemCount: userHistoryTrades.length,
                                itemBuilder: (context, i) {
                                  return MyTradeItemWeb(
                                    item: userHistoryTrades[i],
                                  );
                                },
                              )
                      ],
                    );
                  },
                ),
              ),
            );
          },
          error: (error, _) => UserAppError(
            errorMessage: error.toString(),
          ),
          loading: () => const MainLoader(),
        ),
      ),
    );
  }
}

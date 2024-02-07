import 'package:ferry/typed_links.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/domain/trade/trade_history/trade_history_item.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_history.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_history.var.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_trades_history.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_trades_history.var.gql.dart';
import 'package:user_app/infrastructure/trade/trade_service.dart';

final getUserTradesHistoryFutureProvider =
    FutureProvider.autoDispose.family<List<TradeHistoryItem>, String>(
  (ref, market) async {
    ITradeService service = TradeService();
    OperationResponse<GGetUserTradesHistoryData, GGetUserTradesHistoryVars>
        userOrderResponse = await service.getUserTradesHistory(market);
    List<TradeHistoryItem> historyList = [];

    var uBox = Hive.box<UserConfigData>(Constants.userConfig);

    UserConfigData userData = uBox.getAt(0)!;

    for (int i = 0;
        i < userOrderResponse.data!.userTrades!.result!.length;
        i++) {
      if (userOrderResponse.data!.userTrades!.result![i]!.sellUserId! ==
          userData.userId) {
        historyList.add(TradeHistoryItem(
          price: userOrderResponse.data!.userTrades!.result![i]!.price!,
          amount: userOrderResponse.data!.userTrades!.result![i]!.amount!,
          date: userOrderResponse.data!.userTrades!.result![i]!.createdAt!,
          side: 'sell',
        ));
      }
      if (userOrderResponse.data!.userTrades!.result![i]!.buyUserId! ==
          userData.userId) {
        historyList.add(TradeHistoryItem(
          price: userOrderResponse.data!.userTrades!.result![i]!.price!,
          amount: userOrderResponse.data!.userTrades!.result![i]!.amount!,
          date: userOrderResponse.data!.userTrades!.result![i]!.createdAt!,
          side: 'buy',
        ));
      }
    }
    return historyList;
  },
);

final getPublicTradesHistoryFutureProvider = FutureProvider.autoDispose
    .family<List<TradeHistoryItem>, RefreshRequestPublicTradeHistory>(
  (ref, data) async {
    ITradeService service = TradeService();

    OperationResponse<GGetPublicTradesHistoryData, GGetPublicTradesHistoryVars>
        userOrderResponse = await service.getPublicTradesHistory(data.marketId);
    List<TradeHistoryItem> historyList = [];

    for (int i = 0;
        i < userOrderResponse.data!.publicTrades!.result!.length;
        i++) {
      TradeHistoryItem item = TradeHistoryItem(
        price: userOrderResponse.data!.publicTrades!.result![i]!.price!,
        amount: userOrderResponse.data!.publicTrades!.result![i]!.amount!,
        date: userOrderResponse.data!.publicTrades!.result![i]!.createdAt!,
        side: userOrderResponse.data!.publicTrades!.result![i]!.makerOrderSide!,
      );
      historyList.add(item);
    }

    return historyList;
  },
);

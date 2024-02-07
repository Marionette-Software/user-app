import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/trade/trade_history/trade_history_state.dart';

final tradeHistoryStateProvider = StateProvider<TradeHistoryState>(
  (ref) => TradeHistoryState.publicTradeHistory,
);

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/trade_avalible_balance_state_provider.dart';
import 'package:user_app/presentation/app/navigation/navigation_mobile.dart';
import 'package:user_app/presentation/app/trade/web/trade_web.dart';

class Trade extends HookConsumerWidget {
  const Trade({
    Key? key,
  }) : super(key: key);

  static const routeName = '/trade';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tradeMarketPriceRead = ref.read(tradeMarketPriceProvider.notifier);
    tradeMarketPriceRead.updateBuy('none');
    tradeMarketPriceRead.updateSell('none');

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return const TradePageWeb();
        } else {
          return const Navigation(
            tabIndex: 1,
          );
        }
      },
    );
  }
}

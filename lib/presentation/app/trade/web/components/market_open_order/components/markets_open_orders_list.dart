import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/user_orders/user_order_future_provider.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/infrastructure/trade/trade_service.dart';
import 'package:user_app/presentation/app/trade/web/components/market_open_order/components/market_open_order_item.dart';

class MarketOpenOrdersListWeb extends HookConsumerWidget {
  const MarketOpenOrdersListWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketOrdersRead = ref.read(marketOrdersNotifierProvider.notifier);
    final marketOrdersWatch = ref.watch(marketOrdersNotifierProvider);

    ITradeService service = TradeService();
    ScrollController controllerScroll = ScrollController();

    return ListView.separated(
      controller: controllerScroll,
      shrinkWrap: true,
      separatorBuilder: (context, index) => SizedBox(
        height: 25.h,
      ),
      itemCount: marketOrdersWatch.length,
      itemBuilder: (context, i) {
        var item = marketOrdersWatch[i];
        return MarketOpenOrderItemWeb(
          item: item,
          onTap: () async {
            var result = await service.cancelOrder(item.id);
            if (result) {
              marketOrdersWatch.removeWhere(
                (element) => element.id == item.id,
              );

              marketOrdersRead.updateMarketOrdersData(marketOrdersWatch);

              final snackBar = SnackBar(
                elevation: 0,
                clipBehavior: Clip.none,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  titleFontSize: 30.sp,
                  messageFontSize: 20.sp,
                  title: tr('snack_bar_message.success.success'),
                  message: tr('snack_bar_message.success.success_delete_order'),
                  contentType: ContentType.success,
                ),
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
            } else if (result is GraphQlError) {
              final snackBar = SnackBar(
                elevation: 0,
                clipBehavior: Clip.none,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  titleFontSize: 30.sp,
                  messageFontSize: 20.sp,
                  title:
                      tr('snack_bar_message.success.success_delete_all_order'),
                  message: result.message,
                  contentType: ContentType.success,
                ),
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
            }
          },
        );
      },
    );
  }
}

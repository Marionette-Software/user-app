import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/user_orders/user_order_future_provider.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/infrastructure/trade/trade_service.dart';
import 'package:user_app/presentation/app/trade/mobile/components/market_open_order/components/market_open_order_item.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MarketOrdersListMobile extends HookConsumerWidget {
  const MarketOrdersListMobile({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ITradeService service = TradeService();
    final marketOrdersRead = ref.read(marketOrdersNotifierProvider.notifier);
    final marketOrdersWatch = ref.watch(marketOrdersNotifierProvider);

    return ListView.separated(
      controller: scrollController,
      separatorBuilder: (context, index) => Divider(
        height: 2.h,
        color: isLightTheme(context)
            ? AppColors.mainBackgroundLightColor
            : AppColors.whiteColor.withOpacity(0.05),
      ),
      itemCount: marketOrdersWatch.length,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        var item = marketOrdersWatch[i];
        return MarketOpenOrdersItemMobile(
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
                  titleFontSize: 20.sp,
                  messageFontSize: 15.sp,
                  title: tr('snack_bar_message.success.success'),
                  message: tr('snack_bar_message.success.success'),
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
                  titleFontSize: 20.sp,
                  messageFontSize: 15.sp,
                  title: tr('snack_bar_message.errors.error'),
                  message: result.message,
                  contentType: ContentType.failure,
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

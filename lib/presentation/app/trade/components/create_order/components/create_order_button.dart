// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/actions/trade_actions.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/application/trade/market_percet_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/tranding_tab_provider.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/trade/order_type.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/create_order.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_user_order.data.gql.dart';

createOrder({
  required BuildContext context,
  required WidgetRef ref,
  required TextEditingController priceController,
  required TextEditingController totalController,
  required TextEditingController amountController,
  required ValueNotifier<int> counter,
  required ValueNotifier<LoadState> loaderState,
  required PlatformTypeState platformType,
}) async {
  TradeActionsGeneral tradeActionsGeneral = TradeActionsGeneral();

  final marketDataWatch = ref.watch(selectMarketsNotifierProvider);
  final marketOrLimitProviderWatch = ref.watch(marketOrLimitProvider);
  final tradingTabWatch = ref.watch(tradingTabProvider);
  final marketPercentRead = ref.read(marketPercentProviderProvider.notifier);

  loaderState.value = LoadState.loading;

  final response = marketOrLimitProviderWatch == OrderType.limit
      ? await tradeActionsGeneral.createLimitOrder(
          market: marketDataWatch.id,
          side: tradingTabWatch == 1 ? 'buy' : 'sell',
          type: 'limit',
          price: double.parse(priceController.text),
          amount: double.parse(amountController.text),
        )
      : await tradeActionsGeneral.createMarketOrder(
          market: marketDataWatch.id,
          side: tradingTabWatch == 1 ? 'buy' : 'sell',
          type: 'market',
          amount: double.parse(amountController.text),
        );

  if (response is GraphQlError) {
    loaderState.value = LoadState.notLoading;

    amountController.text =
        0.toStringAsFixed(marketDataWatch.trading_amount_precision);
    totalController.text =
        0.toStringAsFixed(marketDataWatch.quote_currency.precision);

    marketPercentRead.state = 0;

    final snackBar = SnackBar(
      elevation: 0,
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom + 30
          ..h,
      ),
      behavior: SnackBarBehavior.floating,
      clipBehavior: Clip.none,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        titleFontSize: platformType == PlatformTypeState.mobile ? 20.sp : 30.sp,
        messageFontSize:
            platformType == PlatformTypeState.mobile ? 15.sp : 20.sp,
        title: tr('snack_bar_message.errors.error'),
        message: response.message,
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  } else if (response is GCreateOrderData_openOrder) {
    if (response.status != 'pending') {
      loaderState.value = LoadState.notLoading;

      amountController.text =
          0.toStringAsFixed(marketDataWatch.trading_amount_precision);
      totalController.text =
          0.toStringAsFixed(marketDataWatch.quote_currency.precision);

      final snackBar = SnackBar(
        elevation: 0,
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom + 30
            ..h,
        ),
        behavior: SnackBarBehavior.floating,
        clipBehavior: Clip.none,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          titleFontSize:
              platformType == PlatformTypeState.mobile ? 20.sp : 30.sp,
          messageFontSize:
              platformType == PlatformTypeState.mobile ? 15.sp : 20.sp,
          title: tr('snack_bar_message.success.success'),
          message: marketOrLimitProviderWatch == OrderType.limit
              ? tr('snack_bar_message.success.limit_order_created')
              : tr('snack_bar_message.success.market_order_created'),
          contentType: ContentType.success,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    } else {
      counter.value = 0;
      void getStatusFunction() async {
        final getStatus =
            await tradeActionsGeneral.getUserOrder(id: response.id!);

        if (getStatus is GGetUserOrderData_userOrder) {
          if (getStatus.status == 'pending' && counter.value < 3) {
            counter.value++;
            getStatusFunction();
          } else if (getStatus.status == 'pending' && counter.value > 3) {
            loaderState.value = LoadState.notLoading;

            final snackBar = SnackBar(
              elevation: 0,
              padding: EdgeInsets.only(
                bottom: MediaQuery.viewInsetsOf(context).bottom + 30
                  ..h,
              ),
              behavior: SnackBarBehavior.floating,
              clipBehavior: Clip.none,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                titleFontSize:
                    platformType == PlatformTypeState.mobile ? 20.sp : 30.sp,
                messageFontSize:
                    platformType == PlatformTypeState.mobile ? 15.sp : 20.sp,
                title: tr('snack_bar_message.success.success'),
                message: tr('snack_bar_message.success.order_processing'),
                contentType: ContentType.success,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
            amountController.text =
                0.toStringAsFixed(marketDataWatch.trading_amount_precision);
            totalController.text =
                0.toStringAsFixed(marketDataWatch.quote_currency.precision);
            marketPercentRead.state = 0;
          } else {
            loaderState.value = LoadState.notLoading;

            amountController.text =
                0.toStringAsFixed(marketDataWatch.trading_amount_precision);
            totalController.text =
                0.toStringAsFixed(marketDataWatch.quote_currency.precision);
            marketPercentRead.state = 0;

            final snackBar = SnackBar(
              elevation: 0,
              padding: EdgeInsets.only(
                bottom: MediaQuery.viewInsetsOf(context).bottom + 30
                  ..h,
              ),
              behavior: SnackBarBehavior.floating,
              clipBehavior: Clip.none,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                titleFontSize:
                    platformType == PlatformTypeState.mobile ? 20.sp : 30.sp,
                messageFontSize:
                    platformType == PlatformTypeState.mobile ? 15.sp : 20.sp,
                title: tr('snack_bar_message.success.success'),
                message: marketOrLimitProviderWatch == OrderType.limit
                    ? tr('snack_bar_message.success.limit_order_created')
                    : tr('snack_bar_message.success.market_order_created'),
                contentType: ContentType.success,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          }
        } else if (getStatus is GraphQlError) {
          loaderState.value = LoadState.notLoading;

          amountController.text =
              0.toStringAsFixed(marketDataWatch.trading_amount_precision);
          totalController.text =
              0.toStringAsFixed(marketDataWatch.quote_currency.precision);
          marketPercentRead.state = 0;

          final snackBar = SnackBar(
            elevation: 0,
            padding: EdgeInsets.only(
              bottom: MediaQuery.viewInsetsOf(context).bottom + 30
                ..h,
            ),
            behavior: SnackBarBehavior.floating,
            clipBehavior: Clip.none,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              titleFontSize:
                  platformType == PlatformTypeState.mobile ? 20.sp : 30.sp,
              messageFontSize:
                  platformType == PlatformTypeState.mobile ? 15.sp : 20.sp,
              title: tr('snack_bar_message.errors.error'),
              message: getStatus.message,
              contentType: ContentType.failure,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
          counter.value = 3;
        }
      }

      Future.delayed(const Duration(
        seconds: 1,
      )).then((_) async {
        getStatusFunction();
      });
    }
  }
}

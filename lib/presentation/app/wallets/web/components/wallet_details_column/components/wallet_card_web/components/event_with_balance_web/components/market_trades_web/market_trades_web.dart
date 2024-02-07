import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/exchange/exchange_rate_provider.dart';
import 'package:user_app/application/exchange/exchange_state_provider.dart';
import 'package:user_app/application/trade/actions/trade_actions.dart';
import 'package:user_app/application/trade/is_active_buy_sell_provider.dart';
import 'package:user_app/application/trade/market_percet_provider.dart';
import 'package:user_app/application/trade/tranding_tab_provider.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/domain/exchange/exchange_rate.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/create_order.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_user_order.data.gql.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/market_trades_web/components/buy_sell_percent_selector.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/market_trades_web/components/market_ammount_error_message.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/formatters/text_input_formater.dart';
import 'package:user_app/presentation/helpers/rate_convert/create_order_convert.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MarketTradesWeb extends HookConsumerWidget {
  const MarketTradesWeb({
    super.key,
    required this.fromControllerInitValue,
    required this.toControllerInitValue,
    required this.withTradingBalance,
  });

  final String fromControllerInitValue;
  final String toControllerInitValue;
  final bool withTradingBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tradingTabWatch = ref.watch(tradingTabProvider);
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final exchangeDataWatch = ref.watch(exchangeStateNotifierProvider);
    final exchangeDataRead = ref.read(exchangeStateNotifierProvider.notifier);
    final marketPercentState = ref.read(marketPercentProviderProvider.notifier);
    final activeInputBuySellRead =
        ref.read(activeInputBuySellProvider.notifier);
    final activeInputBuySellWatch = ref.watch(activeInputBuySellProvider);
    final userBalance = ref.watch(userBalancesStateNotifierProvider);
    final isActiveBuySellProviderWatch = ref.watch(isActiveBuySellProvider);

    var fromValueController =
        useTextEditingController(text: fromControllerInitValue);
    var toValueController =
        useTextEditingController(text: toControllerInitValue);

    var convertedValue = tradingTabWatch == 1
        ? createOrderConvert(
            market: exchangeDataWatch.activeMarket,
            currencyFrom: exchangeDataWatch.selectedFromCurrency.id,
            currencyTo: exchangeDataWatch.selectedToCurrency.id,
            amount: withTradingBalance
                ? userBalance
                    .firstWhere((element) =>
                        element.id == exchangeDataWatch.selectedFromCurrency.id)
                    .advancedTradingBalance!
                : (userBalance
                        .firstWhere((element) =>
                            element.id ==
                            exchangeDataWatch.selectedFromCurrency.id)
                        .advancedTradingBalance! +
                    userBalance
                        .firstWhere((element) =>
                            element.id ==
                            exchangeDataWatch.selectedFromCurrency.id)
                        .balance!),
          )
        : createOrderConvert(
            market: exchangeDataWatch.activeMarket,
            currencyFrom: exchangeDataWatch.selectedToCurrency.id,
            currencyTo: exchangeDataWatch.selectedFromCurrency.id,
            amount: withTradingBalance
                ? userBalance
                    .firstWhere((element) =>
                        element.id == exchangeDataWatch.selectedToCurrency.id)
                    .advancedTradingBalance!
                : (userBalance
                        .firstWhere((element) =>
                            element.id ==
                            exchangeDataWatch.selectedToCurrency.id)
                        .advancedTradingBalance! +
                    userBalance
                        .firstWhere((element) =>
                            element.id ==
                            exchangeDataWatch.selectedToCurrency.id)
                        .balance!),
          );

    List<DropdownMenuItem<Currency>> addDividersAfterItems() {
      final List<DropdownMenuItem<Currency>> menuItems = [];
      for (final Currency item in exchangeDataWatch.currencyFromList) {
        menuItems.addAll(
          [
            DropdownMenuItem<Currency>(
              value: item,
              child: Row(
                children: [
                  UserAppImage(
                    clipBehavior: Clip.hardEdge,
                    path: item.iconUrl,
                    width: 50.w,
                    height: 50.h,
                    isNetwork: true,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    item.id,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -1.sp,
                        ),
                  ),
                ],
              ),
            ),
            //If it's last item, we will not add Divider after it.
            if (item != exchangeDataWatch.currencyFromList.last)
              DropdownMenuItem<Currency>(
                enabled: false,
                child: Divider(
                  height: 2.h,
                  color: isLightTheme(context)
                      ? AppColors.whiteColor.withOpacity(0.5)
                      : AppColors.whiteColor.withOpacity(0.05),
                ),
              ),
          ],
        );
      }
      return menuItems;
    }

    List<double> getCustomItemsHeights() {
      final List<double> itemsHeights = [];
      for (int i = 0;
          i < (exchangeDataWatch.currencyFromList.length * 2) - 1;
          i++) {
        if (i.isEven) {
          itemsHeights.add(58.h);
        }
        //Dividers indexes will be the odd indexes
        if (i.isOdd) {
          itemsHeights.add(1.h);
        }
      }
      return itemsHeights;
    }

    final active = useState(false);
    var counter = useState(0);
    final loaderState = useState(LoadState.notLoading);

    String sendAvailableBalance =
        "${numberFormatWithPrecision(exchangeDataWatch.currencyToList[0].precision).format((withTradingBalance ? userBalance.firstWhere((element) => element.id == exchangeDataWatch.selectedToCurrency.id).advancedTradingBalance : (userBalance.firstWhere((element) => element.id == exchangeDataWatch.selectedToCurrency.id).balance! + userBalance.firstWhere((element) => element.id == exchangeDataWatch.selectedToCurrency.id).advancedTradingBalance!)))} ";
    String getAvailableBalance =
        "${numberFormatWithPrecision(exchangeDataWatch.selectedFromCurrency.precision).format((withTradingBalance ? userBalance.firstWhere((element) => element.id == exchangeDataWatch.selectedFromCurrency.id).advancedTradingBalance! : (userBalance.firstWhere((element) => element.id == exchangeDataWatch.selectedFromCurrency.id).advancedTradingBalance! + userBalance.firstWhere((element) => element.id == exchangeDataWatch.selectedFromCurrency.id).balance!)))} ";

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 600.w,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: 50.h, left: 25.w, right: 25.w, top: 30.h),
          child: Column(
            children: [
              Text(
                tradingTabWatch == 1
                    ? tr('wallet.market_buy_order')
                    : tr('wallet.market_sell_order'),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 30.sp,
                      color: isLightTheme(context)
                          ? AppColors.darkColorText
                          : AppColors.whiteColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1.5.sp,
                    ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Market Price',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 20.sp,
                          letterSpacing: -1.sp,
                          color: isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : AppColors.whiteColor.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    '≈ ${numberFormatWithPrecision(exchangeDataWatch.activeMarket.trading_price_precision).format(exchangeDataWatch.activeMarket.marketDynamics!.lastPrice!)} ${exchangeDataWatch.selectedFromCurrency.id.toUpperCase()}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 20.sp,
                          letterSpacing: -1.sp,
                          color: isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : AppColors.whiteColor.withOpacity(0.5),
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 11.h,
              ),
              Container(
                width: double.infinity,
                height: 5.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: isLightTheme(context)
                      ? AppColors.mainBackgroundLightColor
                      : AppColors.whiteColor.withOpacity(0.25),
                ),
              ),
              SizedBox(
                height: 34.h,
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 28.w),
                    child: Text(
                      tradingTabWatch == 1
                          ? tr('wallet.buy')
                          : tr('wallet.sell'),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            fontSize: 25.sp,
                            letterSpacing: -1.25.sp,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  (fromValueController.text.isEmpty ||
                                  fromValueController.text == '0.' ||
                                  fromValueController.text == '.'
                              ? 0
                              : double.parse(fromValueController.text)) <
                          exchangeDataWatch.activeMarket.trading_min_amount
                      ? MarketAmountErrorMessageWeb(
                          minAmountMessage: exchangeDataWatch
                              .activeMarket.trading_min_amount
                              .toStringAsFixed(exchangeDataWatch
                                  .activeMarket.trading_amount_precision),
                        )
                      : Padding(
                          padding: EdgeInsets.only(bottom: 21.h),
                          child: Padding(
                            padding: EdgeInsets.only(left: 190.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                tradingTabWatch == 2
                                    ? Expanded(
                                        child: BuySellPercentSelectorWeb(
                                          withTradingBalance:
                                              withTradingBalance,
                                          toControllerInitValue:
                                              toValueController,
                                          fromControllerInitValue:
                                              fromValueController,
                                          active: active,
                                        ),
                                      )
                                    : SizedBox(
                                        height: 26.h,
                                      ),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserAppImage(
                    clipBehavior: Clip.hardEdge,
                    path: exchangeDataWatch.activeMarket.base_currency.icon_url,
                    width: 50.w,
                    height: 50.h,
                    isNetwork: true,
                  ),
                  SizedBox(
                    width: 17.w,
                  ),
                  Text(
                    exchangeDataWatch.activeMarket.base_currency.id
                        .toUpperCase(),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 20.sp,
                          letterSpacing: -1.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Expanded(
                    child: Focus(
                      onFocusChange: (value) {
                        active.value = true;
                        activeInputBuySellRead.state = false;
                        if ((double.parse(fromValueController.text) ==
                                exchangeDataWatch
                                    .activeMarket.trading_min_amount) &&
                            !activeInputBuySellWatch) {
                          fromValueController.text = '';
                          toValueController.text =
                              '≈ ${0.toStringAsFixed(exchangeDataWatch.selectedFromCurrency.precision)}';
                        }
                      },
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (str) {},
                        controller: fromValueController,
                        inputFormatters: [
                          RegExInputFormatter.withRegex(
                            '^\$|^(0|([1-9.][0-9.]{0,}))(\\.[0-9]{0,})?\$',
                          ),
                          NumberTextInputFormatter(
                            decimalRange: exchangeDataWatch
                                        .activeMarket.trading_amount_precision <
                                    1
                                ? 1
                                : exchangeDataWatch
                                    .activeMarket.trading_amount_precision,
                          ),
                        ],
                        onChanged: (String value) {
                          activeInputBuySellRead.state = true;
                          if (value == '.') {
                            fromValueController.text =
                                value == '.' ? '0.' : value;
                            fromValueController.selection =
                                TextSelection.fromPosition(
                              TextPosition(
                                  offset: fromValueController.text.length),
                            );
                          }

                          marketPercentState.state = 0;

                          var amount =
                              (value.isEmpty || value == '.' || value == '0.')
                                  ? 0.0
                                  : double.parse(value);

                          var calculatedValue = createOrderConvert(
                            market: exchangeDataWatch.activeMarket,
                            currencyFrom:
                                exchangeDataWatch.selectedToCurrency.id,
                            currencyTo:
                                exchangeDataWatch.selectedFromCurrency.id,
                            amount: amount,
                          );

                          exchangeDataRead.updateRate(
                            ExchangeRate(
                              currencyTo:
                                  exchangeDataWatch.selectedFromCurrency,
                              currencyFrom:
                                  exchangeDataWatch.selectedToCurrency,
                              rateWithPrecision: (calculatedValue / amount)
                                  .toStringAsFixed(exchangeDataWatch
                                      .selectedFromCurrency.precision),
                              rate: calculatedValue / amount,
                            ),
                          );

                          toValueController.text =
                              '≈ ${numberFormatWithPrecision(exchangeDataWatch.selectedFromCurrency.precision).format(calculatedValue)}';
                        },
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          floatingLabelAlignment: FloatingLabelAlignment.center,
                          filled: false,
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                          contentPadding:
                              EdgeInsets.only(left: 11.w, bottom: 0, top: 0),
                          fillColor: isLightTheme(context)
                              ? cardColor
                              : Theme.of(context)
                                  .inputDecorationTheme
                                  .fillColor,
                          hoverColor: isLightTheme(context)
                              ? cardColor
                              : Theme.of(context)
                                  .inputDecorationTheme
                                  .fillColor,
                          focusColor: isLightTheme(context)
                              ? cardColor
                              : Theme.of(context)
                                  .inputDecorationTheme
                                  .fillColor,
                          isCollapsed: false,
                        ),
                        style: TextStyle(
                          fontSize: 40.sp,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                          letterSpacing: -2.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: double.infinity,
                height: 5.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: isLightTheme(context)
                      ? AppColors.mainBackgroundLightColor
                      : AppColors.whiteColor.withOpacity(0.25),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  loaderState.value == LoadState.loading
                      ? 'Processing...'
                      : '${tr('wallet.available')} $sendAvailableBalance${exchangeDataWatch.currencyToList[0].id.toUpperCase()}',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        fontSize: 18.sp,
                        letterSpacing: -0.9.sp,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 180.w),
                    child: Text(
                      tradingTabWatch == 2 ? 'Receive' : 'Pay',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            fontSize: 25.sp,
                            letterSpacing: -1.25.sp,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  tradingTabWatch == 1
                      ? Expanded(
                          child: BuySellPercentSelectorWeb(
                            withTradingBalance: withTradingBalance,
                            toControllerInitValue: toValueController,
                            fromControllerInitValue: fromValueController,
                            active: active,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              SizedBox(
                height: 21.h,
              ),
              Row(
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<Currency>(
                      isDense: true,
                      isExpanded: true,
                      value: exchangeDataWatch.selectedFromCurrency,
                      iconStyleData: IconStyleData(
                        iconSize: 28.w,
                      ),
                      alignment: Alignment.center,
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          color: isLightTheme(context)
                              ? AppColors.mainBackgroundLightColor
                              : AppColors.mainBackgroundDarkColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        offset: Offset(0, 50..h),
                      ),
                      buttonStyleData:
                          ButtonStyleData(width: 204.w, height: 58.h),
                      menuItemStyleData: MenuItemStyleData(
                        customHeights: getCustomItemsHeights(),
                        padding: EdgeInsets.only(left: 20.w),
                      ),
                      items: addDividersAfterItems(),
                      onChanged: (value) {
                        final currency = exchangeDataWatch.currencyFromList
                            .firstWhere((element) => element.id == value!.id);
                        exchangeDataRead.updateSelectedFromCurrency(currency);

                        final newMarket = walletData.markets
                            .firstWhere((p0) => p0.id == currency.marketId);

                        exchangeDataRead.updateActiveMarket(newMarket);

                        fromValueController.text = newMarket.trading_min_amount
                            .toStringAsFixed(
                                newMarket.trading_amount_precision);

                        var convertedValue = createOrderConvert(
                          market: newMarket,
                          currencyFrom:
                              exchangeDataRead.state.selectedToCurrency.id,
                          currencyTo: currency.id,
                          amount: double.parse(fromValueController.text),
                        );
                        exchangeDataRead.updateRate(
                          ExchangeRate(
                            currencyTo: currency,
                            currencyFrom:
                                exchangeDataRead.state.selectedToCurrency,
                            rateWithPrecision: (convertedValue /
                                    double.parse(fromValueController.text))
                                .toStringAsFixed(currency.precision),
                            rate: convertedValue /
                                double.parse(fromValueController.text),
                          ),
                        );
                        marketPercentState.state = 0;

                        toValueController.text =
                            '≈ ${numberFormatWithPrecision(exchangeDataRead.state.selectedFromCurrency.precision).format(convertedValue)}';
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (str) {},
                      controller: toValueController,
                      inputFormatters: [
                        RegExInputFormatter.withRegex(
                          '^\$|^(0|([1-9.][0-9.]{0,7}))(\\.[0-9]{0,7})?\$',
                        ),
                      ],
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        filled: false,
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 11.w, bottom: 0, top: 0),
                        fillColor: isLightTheme(context)
                            ? cardColor
                            : Theme.of(context).inputDecorationTheme.fillColor,
                        hoverColor: isLightTheme(context)
                            ? cardColor
                            : Theme.of(context).inputDecorationTheme.fillColor,
                        focusColor: isLightTheme(context)
                            ? cardColor
                            : Theme.of(context).inputDecorationTheme.fillColor,
                        isCollapsed: false,
                      ),
                      style: TextStyle(
                        fontSize: 40.sp,
                        color: validateAmount(
                                    ref: ref,
                                    fromValueController: fromValueController,
                                    toValueController: toValueController,
                                    convertedValue: convertedValue) ||
                                isActiveBuySellProviderWatch
                            ? Theme.of(context).primaryColor.withOpacity(0.5)
                            : MainColorsApp.redColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                        letterSpacing: -2.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: double.infinity,
                height: 5.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: isLightTheme(context)
                      ? AppColors.mainBackgroundLightColor
                      : AppColors.whiteColor.withOpacity(0.25),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  loaderState.value == LoadState.loading
                      ? 'Processing...'
                      : '${tr('wallet.available')} $getAvailableBalance${exchangeDataWatch.selectedFromCurrency.id.toUpperCase()}',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        fontSize: 18.sp,
                        letterSpacing: -0.9.sp,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              loaderState.value == LoadState.loading
                  ? const CircularProgressIndicator()
                  : MainButton(
                      onTap: validateAmount(
                                  ref: ref,
                                  fromValueController: fromValueController,
                                  toValueController: toValueController,
                                  convertedValue: convertedValue) ||
                              isActiveBuySellProviderWatch
                          ? () async {
                              TradeActionsGeneral tradeActionsGeneral =
                                  TradeActionsGeneral();

                              loaderState.value = LoadState.loading;
                              final response =
                                  await tradeActionsGeneral.createMarketOrder(
                                market: exchangeDataWatch.activeMarket.id,
                                side: tradingTabWatch == 1 ? 'buy' : 'sell',
                                type: 'market',
                                amount: double.parse(fromValueController.text),
                              );

                              if (response is GraphQlError) {
                                loaderState.value = LoadState.notLoading;

                                final snackBar = SnackBar(
                                  elevation: 0,
                                  padding: EdgeInsets.only(
                                    bottom:
                                        // ignore: use_build_context_synchronously
                                        MediaQuery.viewInsetsOf(context)
                                                .bottom +
                                            30
                                          ..h,
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  clipBehavior: Clip.none,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    titleFontSize: 30.sp,
                                    messageFontSize: 20.sp,
                                    title: tr('snack_bar_message.errors.error'),
                                    message: response.message,
                                    contentType: ContentType.failure,
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar);
                              } else if (response
                                  is GCreateOrderData_openOrder) {
                                if (response.status != 'pending') {
                                  loaderState.value = LoadState.notLoading;

                                  final snackBar = SnackBar(
                                    elevation: 0,
                                    padding: EdgeInsets.only(
                                      bottom:
                                          // ignore: use_build_context_synchronously
                                          MediaQuery.viewInsetsOf(context)
                                                  .bottom +
                                              30
                                            ..h,
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    clipBehavior: Clip.none,
                                    backgroundColor: Colors.transparent,
                                    content: AwesomeSnackbarContent(
                                      titleFontSize: 30.sp,
                                      messageFontSize: 20.sp,
                                      title: tr(
                                          'snack_bar_message.success.success'),
                                      message: tr(
                                          'snack_bar_message.success.market_order_was_successfully'),
                                      contentType: ContentType.success,
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(snackBar);
                                  context.pop();
                                } else {
                                  counter.value = 0;
                                  void getStatusFunction() async {
                                    final getStatus = await tradeActionsGeneral
                                        .getUserOrder(id: response.id!);

                                    if (getStatus
                                        is GGetUserOrderData_userOrder) {
                                      if (getStatus.status == 'pending' &&
                                          counter.value < 3) {
                                        counter.value++;
                                        getStatusFunction();
                                      } else if (getStatus.status ==
                                              'pending' &&
                                          counter.value > 3) {
                                        loaderState.value =
                                            LoadState.notLoading;

                                        final snackBar = SnackBar(
                                          elevation: 0,
                                          behavior: SnackBarBehavior.floating,
                                          clipBehavior: Clip.none,
                                          padding: EdgeInsets.only(
                                            bottom:
                                                // ignore: use_build_context_synchronously
                                                MediaQuery.viewInsetsOf(context)
                                                        .bottom +
                                                    30
                                                  ..h,
                                          ),
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            titleFontSize: 30.sp,
                                            messageFontSize: 20.sp,
                                            title: tr(
                                                'snack_bar_message.success.success'),
                                            message: tr(
                                                'snack_bar_message.success.order_processing'),
                                            contentType: ContentType.success,
                                          ),
                                        );

                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(snackBar);
                                        context.pop();
                                      } else {
                                        loaderState.value =
                                            LoadState.notLoading;

                                        final snackBar = SnackBar(
                                          elevation: 0,
                                          behavior: SnackBarBehavior.floating,
                                          clipBehavior: Clip.none,
                                          padding: EdgeInsets.only(
                                            bottom:
                                                // ignore: use_build_context_synchronously
                                                MediaQuery.viewInsetsOf(context)
                                                        .bottom +
                                                    30
                                                  ..h,
                                          ),
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            titleFontSize: 30.sp,
                                            messageFontSize: 20.sp,
                                            title: tr(
                                                'snack_bar_message.success.success'),
                                            message: tr(
                                                'snack_bar_message.success.market_order_was_successfully'),
                                            contentType: ContentType.success,
                                          ),
                                        );

                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(snackBar);

                                        context.pop();
                                      }
                                    } else if (getStatus is GraphQlError) {
                                      loaderState.value = LoadState.notLoading;

                                      final snackBar = SnackBar(
                                        elevation: 0,
                                        padding: EdgeInsets.only(
                                          bottom:
                                              // ignore: use_build_context_synchronously
                                              MediaQuery.viewInsetsOf(context)
                                                      .bottom +
                                                  30
                                                ..h,
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        clipBehavior: Clip.none,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                          titleFontSize: 30.sp,
                                          messageFontSize: 20.sp,
                                          title: tr(
                                              'snack_bar_message.errors.error'),
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
                          : null,
                      text: tradingTabWatch == 1
                          ? 'Buy ${exchangeDataWatch.currencyToList[0].id.toUpperCase()}'
                          : 'Sell ${exchangeDataWatch.currencyToList[0].id.toUpperCase()}',
                      height: 60.h,
                      disableColor: isLightTheme(context)
                          ? AppColors.mainBackgroundLightColor
                          : AppColors.whiteColor.withOpacity(0.05),
                      color: (tradingTabWatch == 2
                          ? MainColorsApp.redColor
                          : MainColorsApp.greenColor),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

bool validateAmount({
  required WidgetRef ref,
  required TextEditingController fromValueController,
  required double convertedValue,
  required TextEditingController toValueController,
}) {
  final tradingTabWatch = ref.watch(tradingTabProvider);
  final exchangeDataWatch = ref.watch(exchangeStateNotifierProvider);
  final userBalances = ref.watch(userBalancesStateNotifierProvider);

  if (tradingTabWatch == 1) {
    if ((fromValueController.text.isEmpty ||
                fromValueController.text == '0.' ||
                fromValueController.text == '.'
            ? 0
            : double.parse(fromValueController.text)) >
        double.parse(convertedValue
            .toStringAsFixed(exchangeDataWatch.selectedToCurrency.precision))) {
      return false;
    } else if ((fromValueController.text.isEmpty ||
                fromValueController.text == '0.' ||
                fromValueController.text == '.'
            ? 0
            : double.parse(fromValueController.text)) <
        exchangeDataWatch.activeMarket.trading_min_amount) {
      return false;
    } else {
      return true;
    }
  } else {
    if ((fromValueController.text.isEmpty ||
                fromValueController.text == '0.' ||
                fromValueController.text == '.'
            ? 0
            : double.parse(fromValueController.text)) <
        exchangeDataWatch.activeMarket.trading_min_amount) {
      return false;
    } else if (userBalances
            .firstWhere(
              (element) =>
                  element.id == exchangeDataWatch.selectedToCurrency.id,
            )
            .balance! <
        double.parse(fromValueController.text)) {
      return false;
    } else {
      return true;
    }
  }
}

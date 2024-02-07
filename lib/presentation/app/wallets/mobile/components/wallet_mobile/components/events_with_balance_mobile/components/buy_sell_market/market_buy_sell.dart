import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:slide_action/slide_action.dart';
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
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/buy_sell_market/components/amount_market_error_messege.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/buy_sell_market/components/buy_sell_percent_selector.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/formatters/text_input_formater.dart';
import 'package:user_app/presentation/helpers/rate_convert/create_order_convert.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class MarketBuySellMobile extends StatefulHookConsumerWidget {
  const MarketBuySellMobile({
    super.key,
    required this.fromControllerInitValue,
    required this.toControllerInitValue,
    required this.withTradingBalance,
  });

  final String fromControllerInitValue;
  final String toControllerInitValue;
  final bool withTradingBalance;

  @override
  ConsumerState<MarketBuySellMobile> createState() =>
      _MarketBuySellMobileState();
}

class _MarketBuySellMobileState extends ConsumerState<MarketBuySellMobile> {
  @override
  Widget build(BuildContext context) {
    final tradingTabWatch = ref.watch(tradingTabProvider);
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final exchangeDataWatch = ref.watch(exchangeStateNotifierProvider);
    final exchangeDataRead = ref.read(exchangeStateNotifierProvider.notifier);
    final marketPercentState =
        ref.read(marketPercentProviderProviderMobile.notifier);
    var isActiveBuySellProviderWatch = ref.watch(isActiveBuySellProvider);
    final activeInputBuySellRead =
        ref.read(activeInputBuySellProvider.notifier);
    final activeInputBuySellWatch = ref.watch(activeInputBuySellProvider);

    var fromValueController =
        useTextEditingController(text: widget.fromControllerInitValue);
    var toValueController =
        useTextEditingController(text: widget.toControllerInitValue);

    var counter = useState(0);
    final active = useState(false);
    final loaderState = useState(LoadState.notLoading);

    final userBalance = ref.watch(userBalancesStateNotifierProvider);

    var convertedValue = tradingTabWatch == 1
        ? createOrderConvert(
            market: exchangeDataWatch.activeMarket,
            currencyFrom: exchangeDataWatch.selectedFromCurrency.id,
            currencyTo: exchangeDataWatch.selectedToCurrency.id,
            amount: widget.withTradingBalance
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
            amount: widget.withTradingBalance
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
                    width: 30.w,
                    height: 30..h,
                    isNetwork: true,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    item.id,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.75.sp,
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
                  height: 2..h,
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
          itemsHeights.add(58..h);
        }
        //Dividers indexes will be the odd indexes
        if (i.isOdd) {
          itemsHeights.add(1.h);
        }
      }
      return itemsHeights;
    }

    String sendAvailableBalance =
        "${numberFormatWithPrecision(exchangeDataWatch.currencyToList[0].precision).format((widget.withTradingBalance ? userBalance.firstWhere((element) => element.id == exchangeDataWatch.selectedToCurrency.id).advancedTradingBalance : (userBalance.firstWhere((element) => element.id == exchangeDataWatch.selectedToCurrency.id).balance! + userBalance.firstWhere((element) => element.id == exchangeDataWatch.selectedToCurrency.id).advancedTradingBalance!)))} ";
    String getAvailableBalance =
        "${numberFormatWithPrecision(exchangeDataWatch.selectedFromCurrency.precision).format((widget.withTradingBalance ? userBalance.firstWhere((element) => element.id == exchangeDataWatch.selectedFromCurrency.id).advancedTradingBalance! : (userBalance.firstWhere((element) => element.id == exchangeDataWatch.selectedFromCurrency.id).advancedTradingBalance! + userBalance.firstWhere((element) => element.id == exchangeDataWatch.selectedFromCurrency.id).balance!)))} ";

    return SafeArea(
      child: Scaffold(
        backgroundColor: getWalletColor(
          walletData.lightBgColor1,
          walletData.darkBgColor1,
          isLightTheme(context),
        ),
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50..h),
          child: Padding(
            padding: EdgeInsets.only(
              top: 15..h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: BackButtonMobile(
                    onTap: () => context.pop(),
                  ),
                ),
                Text(
                  '${tradingTabWatch == 1 ? tr('wallet.buy') : tr('wallet.sell')} ${walletData.id.toUpperCase()}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 15.sp,
                        letterSpacing: -0.75.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  width: 70.w,
                  height: 25..h,
                )
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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20..h,
                left: 15.w,
                right: 15.w,
                bottom: MediaQuery.of(context).viewInsets.bottom + 50
                  ..h,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Market Price',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 15.sp,
                              letterSpacing: -0.75.sp,
                              color: isLightTheme(context)
                                  ? AppColors.aboutHeaderLight
                                  : AppColors.whiteColor.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        '≈ ${(exchangeDataWatch.activeMarket.marketDynamics!.lastPrice!).toStringAsFixed(exchangeDataWatch.activeMarket.trading_price_precision)} ${exchangeDataWatch.selectedToCurrency.id.toUpperCase()}',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 25.sp,
                              letterSpacing: -1.25.sp,
                              color: isLightTheme(context)
                                  ? AppColors.aboutHeaderLight
                                  : AppColors.whiteColor.withOpacity(0.5),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8..h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 5..h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: isLightTheme(context)
                          ? AppColors.mainBackgroundLightColor
                          : AppColors.whiteColor.withOpacity(0.25),
                    ),
                  ),
                  SizedBox(
                    height: 30..h,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 28.w),
                        child: Text(
                          tradingTabWatch == 1
                              ? tr('wallet.buy')
                              : tr('wallet.sell'),
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5),
                                    fontSize: 20.sp,
                                    letterSpacing: -1.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      (fromValueController.text.isEmpty ||
                                      fromValueController.text == '0.' ||
                                      fromValueController.text == '.'
                                  ? 0
                                  : double.parse(fromValueController.text)) <
                              exchangeDataWatch.activeMarket.trading_min_amount
                          ? MarketAmountErrorMessageMobile(
                              minAmountMessage: exchangeDataWatch
                                  .activeMarket.trading_min_amount
                                  .toStringAsFixed(exchangeDataWatch
                                      .activeMarket.trading_amount_precision),
                            )
                          : Padding(
                              padding: EdgeInsets.only(bottom: 21..h),
                              child: Padding(
                                padding: EdgeInsets.only(left: 60.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    tradingTabWatch == 2
                                        ? Expanded(
                                            child: BuySellPercentSelectorMobile(
                                              withTradingBalance:
                                                  widget.withTradingBalance,
                                              toControllerInitValue:
                                                  toValueController,
                                              fromControllerInitValue:
                                                  fromValueController,
                                              active: active,
                                            ),
                                          )
                                        : SizedBox(
                                            height: 26..h,
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
                        path: exchangeDataWatch
                            .activeMarket.base_currency.icon_url,
                        width: 30.w,
                        height: 30..h,
                        isNetwork: true,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        exchangeDataWatch.activeMarket.base_currency.id
                            .toUpperCase(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 15.sp,
                              letterSpacing: -0.75.sp,
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
                                decimalRange: exchangeDataWatch.activeMarket
                                            .trading_amount_precision <
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

                              var amount = (value.isEmpty ||
                                      value == '.' ||
                                      value == '0.')
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
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
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
                              contentPadding: EdgeInsets.only(
                                  left: 11.w, bottom: 0, top: 0),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.75.sp,
                                      color: isLightTheme(context)
                                          ? AppColors.aboutHeaderLight
                                          : AppColors.whiteColor
                                              .withOpacity(0.5)),
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
                              fontSize: 25.sp,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                              letterSpacing: -1.25.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        exchangeDataWatch.activeMarket.base_currency.id
                            .toUpperCase(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 25.sp,
                              letterSpacing: -1.25.sp,
                              fontWeight: FontWeight.w600,
                            ),
                      )
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 5..h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: isLightTheme(context)
                          ? AppColors.mainBackgroundLightColor
                          : AppColors.whiteColor.withOpacity(0.25),
                    ),
                  ),
                  SizedBox(
                    height: 5..h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      loaderState.value == LoadState.loading
                          ? 'Processing...'
                          : '${tr('wallet.available')} $sendAvailableBalance${exchangeDataWatch.selectedToCurrency.id.toUpperCase()}',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            fontSize: 15.sp,
                            letterSpacing: -0.75.sp,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 18..h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 28.w),
                        child: Text(
                          tradingTabWatch == 2 ? 'Receive' : 'Pay',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5),
                                    fontSize: 20.sp,
                                    letterSpacing: -1.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      tradingTabWatch == 1
                          ? Expanded(
                              child: BuySellPercentSelectorMobile(
                                withTradingBalance: widget.withTradingBalance,
                                toControllerInitValue: toValueController,
                                fromControllerInitValue: fromValueController,
                                active: active,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  SizedBox(
                    height: 21..h,
                  ),
                  Row(
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<Currency>(
                          isDense: true,
                          isExpanded: true,
                          value: exchangeDataWatch.selectedFromCurrency,
                          iconStyleData: IconStyleData(
                            iconSize: 20.w,
                          ),
                          alignment: Alignment.center,
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              color: isLightTheme(context)
                                  ? AppColors.mainBackgroundLightColor
                                  : AppColors.mainBackgroundDarkColor,
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            offset: Offset(0, 50..h),
                          ),
                          buttonStyleData:
                              ButtonStyleData(width: 130.w, height: 40..h),
                          menuItemStyleData: MenuItemStyleData(
                            customHeights: getCustomItemsHeights(),
                            padding: EdgeInsets.only(left: 20.w),
                          ),
                          items: addDividersAfterItems(),
                          onChanged: (value) {
                            final currency = exchangeDataWatch.currencyFromList
                                .firstWhere(
                                    (element) => element.id == value!.id);
                            exchangeDataRead
                                .updateSelectedFromCurrency(currency);

                            final newMarket = walletData.markets
                                .firstWhere((p0) => p0.id == currency.marketId);

                            exchangeDataRead.updateActiveMarket(newMarket);

                            fromValueController.text =
                                newMarket.trading_min_amount.toStringAsFixed(
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
                            floatingLabelAlignment:
                                FloatingLabelAlignment.center,
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
                            hintStyle: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.75.sp,
                                    color: isLightTheme(context)
                                        ? AppColors.aboutHeaderLight
                                        : AppColors.whiteColor
                                            .withOpacity(0.5)),
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
                            fontSize: 25.sp,
                            color: validateAmount(
                                        ref: ref,
                                        fromValueController:
                                            fromValueController,
                                        toValueController: toValueController,
                                        convertedValue: convertedValue) ||
                                    isActiveBuySellProviderWatch
                                ? Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5)
                                : MainColorsApp.redColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                            letterSpacing: -1.25.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 5..h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: isLightTheme(context)
                          ? AppColors.mainBackgroundLightColor
                          : AppColors.whiteColor.withOpacity(0.25),
                    ),
                  ),
                  SizedBox(
                    height: 5..h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      loaderState.value == LoadState.loading
                          ? 'Processing...'
                          : '${tr('wallet.available')} $getAvailableBalance${exchangeDataWatch.selectedFromCurrency.id.toUpperCase()}',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            fontSize: 15.sp,
                            letterSpacing: -0.75.sp,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 18..h,
                  ),
                  loaderState.value == LoadState.loading
                      ? const CircularProgressIndicator()
                      : SlideAction(
                          trackHeight: 50..h,
                          trackBuilder: (context, state) {
                            return Container(
                              margin: EdgeInsets.only(top: 3..h, bottom: 3..h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                                color: validateAmount(
                                            ref: ref,
                                            fromValueController:
                                                fromValueController,
                                            toValueController:
                                                toValueController,
                                            convertedValue: convertedValue) ||
                                        isActiveBuySellProviderWatch == true
                                    ? (tradingTabWatch == 2
                                        ? MainColorsApp.redColor
                                            .withOpacity(0.5)
                                        : MainColorsApp.greenColor
                                            .withOpacity(0.5))
                                    : isLightTheme(context)
                                        ? AppColors.mainBackgroundLightColor
                                            .withOpacity(0.5)
                                        : AppColors.whiteColor
                                            .withOpacity(0.25),
                              ),
                              child: Center(
                                child: Text(
                                  tradingTabWatch == 1
                                      ? 'Swipe to buy ${exchangeDataWatch.currencyToList[0].id.toUpperCase()}'
                                      : 'Swipe to sell ${exchangeDataWatch.currencyToList[0].id.toUpperCase()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: -0.75.sp,
                                        color: validateAmount(
                                                    ref: ref,
                                                    fromValueController:
                                                        fromValueController,
                                                    toValueController:
                                                        toValueController,
                                                    convertedValue:
                                                        convertedValue) ||
                                                isActiveBuySellProviderWatch ==
                                                    true
                                            ? Colors.white
                                            : isLightTheme(context)
                                                ? AppColors.aboutHeaderLight
                                                : AppColors.whiteColor
                                                    .withOpacity(0.25),
                                      ),
                                ),
                              ),
                            );
                          },
                          thumbBuilder: (context, state) {
                            return Container(
                              height: 50..h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: validateAmount(
                                            ref: ref,
                                            fromValueController:
                                                fromValueController,
                                            toValueController:
                                                toValueController,
                                            convertedValue: convertedValue) ||
                                        isActiveBuySellProviderWatch == true
                                    ? (tradingTabWatch == 2
                                        ? MainColorsApp.redColor
                                        : MainColorsApp.greenColor)
                                    : isLightTheme(context)
                                        ? AppColors.mainBackgroundLightColor
                                        : AppColors.mainBackgroundDarkColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Container(
                                  height: 22..h,
                                  width: 22.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            );
                          },
                          action: validateAmount(
                                      ref: ref,
                                      fromValueController: fromValueController,
                                      toValueController: toValueController,
                                      convertedValue: convertedValue) ||
                                  isActiveBuySellProviderWatch == true
                              ? () async {
                                  TradeActionsGeneral tradeActionsGeneral =
                                      TradeActionsGeneral();

                                  loaderState.value = LoadState.loading;
                                  final response = await tradeActionsGeneral
                                      .createMarketOrder(
                                    market: exchangeDataWatch.activeMarket.id,
                                    side: tradingTabWatch == 1 ? 'buy' : 'sell',
                                    type: 'market',
                                    amount:
                                        double.parse(fromValueController.text),
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
                                        titleFontSize: 20.sp,
                                        messageFontSize: 15.sp,
                                        title: tr(
                                            'snack_bar_message.errors.error'),
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
                                          titleFontSize: 20.sp,
                                          messageFontSize: 15.sp,
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

                                      marketPercentState.state = 0;

                                      fromValueController.text =
                                          exchangeDataWatch
                                              .activeMarket.trading_min_amount
                                              .toStringAsFixed(exchangeDataWatch
                                                  .activeMarket
                                                  .trading_amount_precision);

                                      var convertedValue = createOrderConvert(
                                        market: exchangeDataWatch.activeMarket,
                                        currencyFrom: exchangeDataWatch
                                            .selectedToCurrency.id,
                                        currencyTo: exchangeDataWatch
                                            .selectedFromCurrency.id,
                                        amount: double.parse(
                                            fromValueController.text),
                                      );

                                      toValueController.text =
                                          '≈ ${numberFormatWithPrecision(exchangeDataWatch.selectedFromCurrency.precision).format(convertedValue)}';
                                    } else {
                                      counter.value = 0;
                                      void getStatusFunction() async {
                                        final getStatus =
                                            await tradeActionsGeneral
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
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              clipBehavior: Clip.none,
                                              padding: EdgeInsets.only(
                                                bottom:
                                                    // ignore: use_build_context_synchronously
                                                    MediaQuery.viewInsetsOf(
                                                                context)
                                                            .bottom +
                                                        30
                                                      ..h,
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
                                              content: AwesomeSnackbarContent(
                                                titleFontSize: 20.sp,
                                                messageFontSize: 15.sp,
                                                title: tr(
                                                    'snack_bar_message.success.success'),
                                                message: tr(
                                                    'snack_bar_message.success.order_processing'),
                                                contentType:
                                                    ContentType.success,
                                              ),
                                            );

                                            ScaffoldMessenger.of(context)
                                              ..hideCurrentSnackBar()
                                              ..showSnackBar(snackBar);
                                          } else {
                                            loaderState.value =
                                                LoadState.notLoading;

                                            final snackBar = SnackBar(
                                              elevation: 0,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              clipBehavior: Clip.none,
                                              padding: EdgeInsets.only(
                                                bottom:
                                                    // ignore: use_build_context_synchronously
                                                    MediaQuery.viewInsetsOf(
                                                                context)
                                                            .bottom +
                                                        30
                                                      ..h,
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
                                              content: AwesomeSnackbarContent(
                                                titleFontSize: 20.sp,
                                                messageFontSize: 15.sp,
                                                title: tr(
                                                    'snack_bar_message.success.success'),
                                                message: tr(
                                                    'snack_bar_message.success.market_order_was_successfully'),
                                                contentType:
                                                    ContentType.success,
                                              ),
                                            );

                                            marketPercentState.state = 0;

                                            fromValueController.text =
                                                exchangeDataWatch.activeMarket
                                                    .trading_min_amount
                                                    .toStringAsFixed(
                                                        exchangeDataWatch
                                                            .activeMarket
                                                            .trading_amount_precision);

                                            var convertedValue =
                                                createOrderConvert(
                                              market: exchangeDataWatch
                                                  .activeMarket,
                                              currencyFrom: exchangeDataWatch
                                                  .selectedToCurrency.id,
                                              currencyTo: exchangeDataWatch
                                                  .selectedFromCurrency.id,
                                              amount: double.parse(
                                                  fromValueController.text),
                                            );

                                            toValueController.text =
                                                '≈ ${numberFormatWithPrecision(exchangeDataWatch.selectedFromCurrency.precision).format(convertedValue)}';

                                            ScaffoldMessenger.of(context)
                                              ..hideCurrentSnackBar()
                                              ..showSnackBar(snackBar);
                                          }
                                        } else if (getStatus is GraphQlError) {
                                          loaderState.value =
                                              LoadState.notLoading;

                                          final snackBar = SnackBar(
                                            elevation: 0,
                                            padding: EdgeInsets.only(
                                              bottom:
                                                  // ignore: use_build_context_synchronously
                                                  MediaQuery.viewInsetsOf(
                                                              context)
                                                          .bottom +
                                                      30
                                                    ..h,
                                            ),
                                            behavior: SnackBarBehavior.floating,
                                            clipBehavior: Clip.none,
                                            backgroundColor: Colors.transparent,
                                            content: AwesomeSnackbarContent(
                                              titleFontSize: 20.sp,
                                              messageFontSize: 15.sp,
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
                        ),
                ],
              ),
            ),
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
    } else if (toValueController.text == '≈ 0.00') {
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
    if (toValueController.text == '≈ 0.00') {
      return false;
    } else if ((fromValueController.text.isEmpty ||
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

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/history/history_state_provider.dart';
import 'package:user_app/application/trade/get_markets_future_provider.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.data.gql.dart';
import 'package:user_app/presentation/app/history/mobile/components/details_components/datails_balance_transfer.dart';
import 'package:user_app/presentation/app/history/mobile/components/details_components/details_deposit.dart';
import 'package:user_app/presentation/app/history/mobile/components/details_components/details_referral_rewards.dart';
import 'package:user_app/presentation/app/history/mobile/components/details_components/details_staking.dart';
import 'package:user_app/presentation/app/history/mobile/components/details_components/details_swap.dart';
import 'package:user_app/presentation/app/history/mobile/components/details_components/details_trade.dart';
import 'package:user_app/presentation/app/history/mobile/components/details_components/details_withdraw.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/format_date.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class HistoryDetailMobile extends StatefulHookConsumerWidget {
  final List<GGetUserHistoryData_history_result?> localHistoryFiltered;

  const HistoryDetailMobile({
    super.key,
    required this.localHistoryFiltered,
  });

  @override
  ConsumerState<HistoryDetailMobile> createState() =>
      _HistoryDetailMobileState();
}

class _HistoryDetailMobileState extends ConsumerState<HistoryDetailMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundDarkColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          50..h,
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.only(top: 15..h, left: 10.w, right: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BackButtonMobile(
                  onTap: () {
                    context.pop();
                  },
                ),
                Text(
                  tr('trade.details'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 15.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75,
                      ),
                  textAlign: TextAlign.center,
                ),
                Opacity(
                  opacity: 0,
                  child: MobileAppBarButton(
                    onTap: () {},
                    picPath: historyFilterMobile,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
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
          child: detailWindow(
            ref: ref,
            localHistoryFiltered: widget.localHistoryFiltered,
          ),
        ),
      ),
    );
  }
}

Widget detailWindow({
  required WidgetRef ref,
  required List<GGetUserHistoryData_history_result?> localHistoryFiltered,
}) {
  final historyWatch = ref.watch(historySelectedProvider);
  final getMarketsWatch = ref.watch(getMarketsNotifierProvider);

  if (localHistoryFiltered[historyWatch]!.initiator_type == 'staking_rewards') {
    return DetailStakingComponentMobile(
      iconUrl:
          localHistoryFiltered[historyWatch]!.initiator_currency!.icon_url!,
      currency: localHistoryFiltered[historyWatch]!
          .initiator_currency!
          .id!
          .toUpperCase(),
      date: formatShortDate(localHistoryFiltered[historyWatch]!.createdAt!),
      type: 'Staking  reward',
      amount:
          double.parse(localHistoryFiltered[historyWatch]!.initiator_amount!)
              .toStringAsFixed(localHistoryFiltered[historyWatch]!
                  .initiator_currency!
                  .precision!),
      precision: localHistoryFiltered[historyWatch]!.initiator_currency != null
          ? localHistoryFiltered[historyWatch]!.initiator_currency!.precision!
          : 2,
    );
  } else if (localHistoryFiltered[historyWatch]!.initiator_type ==
          'deposit_reward' ||
      localHistoryFiltered[historyWatch]!.initiator_type == 'trade_reward') {
    return DetailReferralRewardsComponentMobile(
      iconUrl:
          localHistoryFiltered[historyWatch]!.initiator_currency!.icon_url!,
      currency: localHistoryFiltered[historyWatch]!
          .initiator_currency!
          .id!
          .toUpperCase(),
      date: formatShortDate(localHistoryFiltered[historyWatch]!.createdAt!),
      type:
          localHistoryFiltered[historyWatch]!.initiator_type == 'deposit_reward'
              ? 'Referral deposit reward'
              : 'Referral trade reward',
      amount:
          double.parse(localHistoryFiltered[historyWatch]!.initiator_amount!)
              .toStringAsFixed(localHistoryFiltered[historyWatch]!
                  .initiator_currency!
                  .precision!),
      precision: localHistoryFiltered[historyWatch]!.initiator_currency != null
          ? localHistoryFiltered[historyWatch]!.initiator_currency!.precision!
          : 2,
    );
  } else if (historyWatch < localHistoryFiltered.length &&
      localHistoryFiltered[historyWatch]!.initiator_type == 'exchange') {
    var temp = localHistoryFiltered[historyWatch];
    int ratePrecision = 0;

    for (var element in getMarketsWatch) {
      if (element.id ==
          '${temp!.initiator_currency!.id}-${temp.result_currency!.id}') {
        ratePrecision = element.swapBaseToQuotePricePrecision;
      } else if (element.id ==
          '${temp.result_currency!.id}-${temp.initiator_currency!.id}') {
        ratePrecision = element.swapQuoteToBasePricePrecision;
      }
    }

    return DetailSwapComponentMobile(
      iconUrlFrom: temp!.initiator_currency!.icon_url!,
      currency:
          '${temp.initiator_currency!.id!.toUpperCase()}/${temp.result_currency!.id!.toUpperCase()}',
      date: formatShortDate(temp.createdAt!),
      type: tr('history.swap'),
      side: tr('history.sell'),
      rate: temp.result_amount != null && temp.initiator_amount != null
          ? (double.parse(temp.result_amount!) /
                  double.parse(temp.initiator_amount!))
              .toString()
          : '0',
      total: temp.result_amount != null ? temp.result_amount! : '0',
      iconUrlTo: temp.result_currency!.icon_url!,
      precision:
          temp.result_currency != null ? temp.result_currency!.precision! : 2,
      ratePrecision: ratePrecision,
      sellAmount:
          '${temp.initiator_amount != null && temp.initiator_amount != null ? numberFormatWithPrecision(temp.initiator_currency!.precision!).format(double.parse(temp.initiator_amount!)).toString() : '0'} ${temp.initiator_currency!.id!.toUpperCase()}',
      buyAmount:
          '${temp.result_currency != null && temp.result_amount != null ? numberFormatWithPrecision(temp.result_currency!.precision!).format(double.parse(temp.result_amount!)).toString() : '0'} ${temp.result_currency!.id!.toUpperCase()}',
    );
  } else if (historyWatch < localHistoryFiltered.length &&
      localHistoryFiltered[historyWatch]!.initiator_type ==
          'custodial_withdrawal') {
    var temp = localHistoryFiltered[historyWatch];

    return DetailWithdrawComponentMobile(
      iconUrl: temp!.initiator_currency!.icon_url!,
      amount: temp.result_amount != null
          ? numberFormatWithPrecision(temp.result_currency!.precision!)
              .format(double.parse(temp.result_amount!))
          : '0',
      currency: temp.initiator_currency!.id!.toUpperCase(),
      date: formatShortDate(temp.createdAt!),
      type: tr('history.withdraw'),
      network:
          '${temp.initiator_payment_interface!.title!} ${temp.initiator_payment_interface!.subtitle!}',
      fee: temp.initiator_fee != null ? temp.initiator_fee!.toString() : '0',
      link: temp.result_txid != null
          ? temp.initiator_explorer_transaction!
              .replaceAll('#{txid}', temp.result_txid!)
          : '',
      status: temp.status!,
      peymentInterfaceType: temp.initiator_currency!.currencyPaymentInterfaces!
          .firstWhere((p0) =>
              p0!.paymentInterfaceId == temp.initiator_payment_interface_id)!
          .type!,
    );
  } else if (historyWatch < localHistoryFiltered.length &&
      localHistoryFiltered[historyWatch]!.initiator_type == 'trading') {
    var temp = localHistoryFiltered[historyWatch];

    String sideForTrade = '';
    String marketId = '';
    String amountTrade = '';
    String priceTrade = '';
    String totalTrade = '';
    String iconTo = '';
    String iconFrom = '';
    bool? showPriceTotal;

    for (var element in getMarketsWatch) {
      if (element.id ==
          '${temp!.initiator_currency!.id}-${temp.result_currency!.id}') {
        sideForTrade = tr('history.sell');
        marketId =
            '${element.base_currency.id.toUpperCase()}/${element.quote_currency.id.toUpperCase()}';
        amountTrade = double.parse(temp.initiator_amount!)
            .toStringAsFixed(element.trading_amount_precision);

        showPriceTotal = double.parse(temp.result_amount!) > 0 ? true : false;
        priceTrade = (double.parse(temp.result_amount!) /
                double.parse(temp.initiator_amount!))
            .toStringAsFixed(element.trading_price_precision);

        totalTrade = (double.parse(amountTrade) * double.parse(priceTrade))
            .toStringAsFixed(element.quote_currency.precision);

        iconTo = element.quote_currency.icon_url;
        iconFrom = element.base_currency.icon_url;
      } else if (element.id ==
          '${temp.result_currency!.id}-${temp.initiator_currency!.id}') {
        sideForTrade = tr('history.buy');
        marketId =
            '${element.base_currency.id.toUpperCase()}/${element.quote_currency.id.toUpperCase()}';
        amountTrade = double.parse(temp.result_amount!)
            .toStringAsFixed(element.trading_amount_precision);
        showPriceTotal =
            double.parse(temp.initiator_amount!) > 0 ? true : false;
        priceTrade = (double.parse(temp.initiator_amount!) /
                double.parse(temp.result_amount!))
            .toStringAsFixed(element.trading_price_precision);
        totalTrade = (double.parse(amountTrade) * double.parse(priceTrade))
            .toStringAsFixed(element.quote_currency.precision);

        iconTo = element.quote_currency.icon_url;
        iconFrom = element.base_currency.icon_url;
      }
    }

    return DetailTradeComponentMobile(
      showPriceTotal: showPriceTotal!,
      iconUrlFrom: iconFrom,
      iconUrlTo: iconTo,
      side: sideForTrade,
      rate: temp!.result_amount != null && temp.initiator_amount != null
          ? '$priceTrade ${sideForTrade == 'Sell' ? temp.result_currency!.id!.toUpperCase() : temp.initiator_currency!.id!.toUpperCase()}'
          : '0',
      total:
          '${temp.initiator_amount != null ? totalTrade : '0'} ${sideForTrade == 'Sell' ? temp.result_currency!.id!.toUpperCase() : temp.initiator_currency!.id!.toUpperCase()}',
      type: tr('history.advanced_trade'),
      amount:
          '$amountTrade ${sideForTrade == 'Sell' ? temp.initiator_currency!.id!.toUpperCase() : temp.result_currency!.id!.toUpperCase()}',
      currency: marketId,
      date: formatShortDate(temp.createdAt!),
    );
  } else if (historyWatch < localHistoryFiltered.length &&
          localHistoryFiltered[historyWatch]!.initiator_type ==
              'move_from_advanced' ||
      localHistoryFiltered[historyWatch]!.initiator_type ==
          'move_to_advanced') {
    var temp = localHistoryFiltered[historyWatch];

    return DetailBalanceTransferComponentMobile(
      iconUrl: temp!.initiator_currency!.icon_url!,
      amount: temp.result_amount != null
          ? double.parse(temp.result_amount!)
              .toStringAsFixed(temp.result_currency!.precision!)
              .toString()
          : '0',
      currency: temp.initiator_currency!.id!.toUpperCase(),
      date: formatShortDate(temp.createdAt!),
      type: tr('history.balance_transfer'),
      from: localHistoryFiltered[historyWatch]!.initiator_type ==
              'move_to_advanced'
          ? tr('history.primary')
          : tr('history.advanced'),
      precision:
          temp.result_currency != null ? temp.result_currency!.precision! : 2,
      to: localHistoryFiltered[historyWatch]!.initiator_type ==
              'move_from_advanced'
          ? tr('history.primary')
          : tr('history.advanced'),
    );
  } else if (historyWatch < localHistoryFiltered.length &&
          localHistoryFiltered[historyWatch]!.initiator_type ==
              'custodial_deposit' ||
      localHistoryFiltered[historyWatch]!.initiator_type == 'deposit') {
    var temp = localHistoryFiltered[historyWatch];

    return DetailDepositComponentMobile(
      amount: temp!.result_amount == null
          ? double.parse(temp.initiator_amount!)
              .toStringAsFixed(temp.initiator_currency!.precision!)
          : double.parse(temp.result_amount!)
              .toStringAsFixed(temp.initiator_currency!.precision!),
      currency: temp.initiator_currency != null
          ? temp.initiator_currency!.id!.toUpperCase()
          : '0',
      date: formatShortDate(temp.createdAt!),
      iconUrl: temp.initiator_currency!.icon_url!,
      type: tr('history.deposit'),
      precision: temp.initiator_amount != null
          ? temp.initiator_currency!.precision!
          : 0,
      fee: temp.initiator_amount == null || temp.result_amount == null
          ? 0.toStringAsFixed(temp.initiator_currency!.precision!)
          : (double.parse(temp.initiator_amount!) -
                  double.parse(temp.result_amount!))
              .toString(),
      network:
          '${temp.initiator_payment_interface!.title!} ${temp.initiator_payment_interface!.subtitle!}',
      link: temp.initiator_explorer_transaction == null
          ? ''
          : temp.initiator_explorer_transaction!,
      status: tr('history.success'),
      peymentInterfaceType: temp.initiator_currency!.currencyPaymentInterfaces!
          .firstWhere((p0) =>
              p0!.paymentInterfaceId == temp.initiator_payment_interface_id)!
          .type!,
    );
  } else {
    return Container();
  }
}

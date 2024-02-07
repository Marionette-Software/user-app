import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/history/history_state_provider.dart';
import 'package:user_app/application/trade/get_markets_future_provider.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.data.gql.dart';
import 'package:user_app/presentation/app/history/web/components/details_components/components/detail_balance_transfer.dart';
import 'package:user_app/presentation/app/history/web/components/details_components/components/detail_staking.dart';
import 'package:user_app/presentation/app/history/web/components/details_components/components/detail_withdraw.dart';
import 'package:user_app/presentation/app/history/web/components/details_components/components/details_deposit.dart';
import 'package:user_app/presentation/app/history/web/components/details_components/components/details_exchange.dart';
import 'package:user_app/presentation/app/history/web/components/details_components/components/details_referral_rewards.dart';
import 'package:user_app/presentation/app/history/web/components/details_components/components/details_trade_by_component.dart';
import 'package:user_app/presentation/helpers/formatters/format_date.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';

class DetailContainer extends HookConsumerWidget {
  const DetailContainer({
    required this.localHistoryFiltered,
    super.key,
  });

  final List<GGetUserHistoryData_history_result?>? localHistoryFiltered;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyWatch = ref.watch(historySelectedProvider);
    final getMarketsWatch = ref.watch(getMarketsNotifierProvider);

    return Column(
      children: [
        historyWatch < localHistoryFiltered!.length &&
                    localHistoryFiltered![historyWatch]!.initiator_type ==
                        'deposit_reward' ||
                historyWatch < localHistoryFiltered!.length &&
                    localHistoryFiltered![historyWatch]!.initiator_type ==
                        'trade_reward'
            ? DetailReferralsRewardsComponent(
                iconUrl: localHistoryFiltered![historyWatch]!
                    .initiator_currency!
                    .icon_url!,
                currency: localHistoryFiltered![historyWatch]!
                    .initiator_currency!
                    .id!
                    .toUpperCase(),
                date: formatShortDate(
                    localHistoryFiltered![historyWatch]!.createdAt!),
                type: localHistoryFiltered![historyWatch]!.initiator_type ==
                        'deposit_reward'
                    ? 'Referral deposit reward'
                    : 'Referral trade reward',
                amount: double.parse(
                        localHistoryFiltered![historyWatch]!.initiator_amount!)
                    .toStringAsFixed(localHistoryFiltered![historyWatch]!
                        .initiator_currency!
                        .precision!),
                precision:
                    localHistoryFiltered![historyWatch]!.initiator_currency !=
                            null
                        ? localHistoryFiltered![historyWatch]!
                            .initiator_currency!
                            .precision!
                        : 2,
              )
            : historyWatch < localHistoryFiltered!.length &&
                    localHistoryFiltered![historyWatch]!.initiator_type ==
                        'staking_rewards'
                ? DetailStakingComponent(
                    iconUrl: localHistoryFiltered![historyWatch]!
                        .initiator_currency!
                        .icon_url!,
                    currency: localHistoryFiltered![historyWatch]!
                        .initiator_currency!
                        .id!
                        .toUpperCase(),
                    date: formatShortDate(
                        localHistoryFiltered![historyWatch]!.createdAt!),
                    type: 'Staking reward',
                    amount: numberFormatWithPrecision(
                            localHistoryFiltered![historyWatch]!
                                .initiator_currency!
                                .precision!)
                        .format(double.parse(
                            localHistoryFiltered![historyWatch]!
                                .initiator_amount!)),
                    precision: localHistoryFiltered![historyWatch]!
                                .initiator_currency !=
                            null
                        ? localHistoryFiltered![historyWatch]!
                            .initiator_currency!
                            .precision!
                        : 2,
                  )
                : historyWatch < localHistoryFiltered!.length &&
                        localHistoryFiltered![historyWatch]!.initiator_type ==
                            'exchange'
                    ? () {
                        var temp = localHistoryFiltered![historyWatch];
                        int ratePrecision = 0;

                        for (var element in getMarketsWatch) {
                          if (element.id ==
                              '${temp!.initiator_currency!.id}-${temp.result_currency!.id}') {
                            ratePrecision =
                                element.swapBaseToQuotePricePrecision;
                          } else if (element.id ==
                              '${temp.result_currency!.id}-${temp.initiator_currency!.id}') {
                            ratePrecision =
                                element.swapQuoteToBasePricePrecision;
                          }
                        }

                        return DetailExchangeComponent(
                          iconUrlFrom: temp!.initiator_currency!.icon_url!,
                          sellAmount:
                              '${temp.initiator_amount != null && temp.initiator_amount != null ? numberFormatWithPrecision(temp.initiator_currency!.precision!).format(double.parse(temp.initiator_amount!)).toString() : '0'} ${temp.initiator_currency!.id!.toUpperCase()}',
                          buyAmount:
                              '${temp.result_currency != null && temp.result_amount != null ? numberFormatWithPrecision(temp.result_currency!.precision!).format(double.parse(temp.result_amount!)).toString() : '0'} ${temp.result_currency!.id!.toUpperCase()}',
                          currency:
                              '${temp.initiator_currency!.id!.toUpperCase()}/${temp.result_currency!.id!.toUpperCase()}',
                          date: formatShortDate(temp.createdAt!),
                          type: tr('history.swap'),
                          side: tr('history.sell'),
                          rate: temp.result_amount != null &&
                                  temp.initiator_amount != null
                              ? (double.parse(temp.result_amount!) /
                                      double.parse(temp.initiator_amount!))
                                  .toString()
                              : '0',
                          total: temp.result_amount != null
                              ? temp.result_amount!
                              : '0',
                          iconUrlTo: temp.result_currency!.icon_url!,
                          precision: temp.result_currency != null
                              ? temp.result_currency!.precision!
                              : 2,
                          ratePrecision: ratePrecision,
                        );
                      }()
                    : historyWatch < localHistoryFiltered!.length &&
                            localHistoryFiltered![historyWatch]!.initiator_type ==
                                'custodial_withdrawal'
                        ? () {
                            var temp = localHistoryFiltered![historyWatch];

                            return DetailWithdrawComponent(
                              peymentInterfaceType: temp!.initiator_currency!
                                  .currencyPaymentInterfaces!
                                  .firstWhere((p0) =>
                                      p0!.paymentInterfaceId ==
                                      temp.initiator_payment_interface_id)!
                                  .type!,
                              iconUrl: temp.initiator_currency!.icon_url!,
                              amount: temp.result_amount != null
                                  ? numberFormatWithPrecision(
                                          temp.result_currency!.precision!)
                                      .format(double.parse(temp.result_amount!))
                                  : '0',
                              currency:
                                  temp.initiator_currency!.id!.toUpperCase(),
                              date: formatShortDate(temp.createdAt!),
                              type: tr('history.withdraw'),
                              network:
                                  '${temp.initiator_payment_interface!.title!} ${temp.initiator_payment_interface!.subtitle!}',
                              fee: temp.initiator_fee != null
                                  ? temp.initiator_fee!.toString()
                                  : '0',
                              precision: temp.initiator_currency!.precision!,
                              link: temp.result_txid != null
                                  ? temp.initiator_explorer_transaction!
                                      .replaceAll('#{txid}', temp.result_txid!)
                                  : '',
                              status: temp.status!,
                            );
                          }()
                        : historyWatch < localHistoryFiltered!.length &&
                                localHistoryFiltered![historyWatch]!.initiator_type ==
                                    'trading'
                            ? () {
                                var temp = localHistoryFiltered![historyWatch];

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
                                    amountTrade = double.parse(
                                            temp.initiator_amount!)
                                        .toStringAsFixed(
                                            element.trading_amount_precision);
                                    showPriceTotal =
                                        double.parse(temp.result_amount!) > 0
                                            ? true
                                            : false;
                                    priceTrade = (double.parse(
                                                temp.result_amount!) /
                                            double.parse(
                                                temp.initiator_amount!))
                                        .toStringAsFixed(
                                            element.trading_price_precision);

                                    totalTrade = (double.parse(amountTrade) *
                                            double.parse(priceTrade))
                                        .toStringAsFixed(
                                            element.quote_currency.precision);

                                    iconTo = element.quote_currency.icon_url;
                                    iconFrom = element.base_currency.icon_url;
                                  } else if (element.id ==
                                      '${temp.result_currency!.id}-${temp.initiator_currency!.id}') {
                                    sideForTrade = tr('history.buy');
                                    marketId =
                                        '${element.base_currency.id.toUpperCase()}/${element.quote_currency.id.toUpperCase()}';
                                    amountTrade = double.parse(
                                            temp.result_amount!)
                                        .toStringAsFixed(
                                            element.trading_amount_precision);
                                    showPriceTotal =
                                        double.parse(temp.initiator_amount!) > 0
                                            ? true
                                            : false;
                                    priceTrade = (double.parse(
                                                temp.initiator_amount!) /
                                            double.parse(temp.result_amount!))
                                        .toStringAsFixed(
                                            element.trading_price_precision);
                                    totalTrade = (double.parse(amountTrade) *
                                            double.parse(priceTrade))
                                        .toStringAsFixed(
                                            element.quote_currency.precision);

                                    iconTo = element.quote_currency.icon_url;
                                    iconFrom = element.base_currency.icon_url;
                                  }
                                }

                                return DetailTradeByComponent(
                                  showPriceTotal: showPriceTotal!,
                                  iconUrlFrom: iconFrom,
                                  iconUrlTo: iconTo,
                                  side: sideForTrade,
                                  rate: (temp!.result_amount != null &&
                                          temp.initiator_amount != null)
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
                              }()
                            : historyWatch < localHistoryFiltered!.length &&
                                        localHistoryFiltered![historyWatch]!
                                                .initiator_type ==
                                            'move_to_advanced' ||
                                    localHistoryFiltered![historyWatch]!
                                            .initiator_type ==
                                        'move_from_advanced'
                                ? () {
                                    var temp =
                                        localHistoryFiltered![historyWatch];

                                    return DetailBalanceTransferComponent(
                                      iconUrl:
                                          temp!.initiator_currency!.icon_url!,
                                      amount: temp.result_amount != null
                                          ? numberFormatWithPrecision(temp
                                                  .result_currency!.precision!)
                                              .format(double.parse(
                                                  temp.result_amount!))
                                          : '0',
                                      currency: temp.initiator_currency!.id!
                                          .toUpperCase(),
                                      date: formatShortDate(temp.createdAt!),
                                      type: tr('history.balance_transfer'),
                                      from: localHistoryFiltered![historyWatch]!
                                                  .initiator_type ==
                                              'move_to_advanced'
                                          ? tr('history.primary')
                                          : tr('history.advanced'),
                                      precision: temp.result_currency != null
                                          ? temp.result_currency!.precision!
                                          : 2,
                                      to: localHistoryFiltered![historyWatch]!
                                                  .initiator_type ==
                                              'move_from_advanced'
                                          ? tr('history.primary')
                                          : tr('history.advanced'),
                                    );
                                  }()
                                : historyWatch < localHistoryFiltered!.length &&
                                        (localHistoryFiltered![historyWatch]!
                                                    .initiator_type ==
                                                'custodial_deposit' ||
                                            localHistoryFiltered![historyWatch]!
                                                    .initiator_type ==
                                                'deposit')
                                    ? () {
                                        var temp =
                                            localHistoryFiltered![historyWatch];
                                        return DetailDepositComponent(
                                          status: 'Success',
                                          paymentInterfaceType: temp!
                                              .initiator_currency!
                                              .currencyPaymentInterfaces!
                                              .firstWhere((p0) =>
                                                  p0!.paymentInterfaceId ==
                                                  temp.initiator_payment_interface_id)!
                                              .type!,
                                          amount: temp.result_amount == null
                                              ? numberFormatWithPrecision(temp
                                                      .initiator_currency!
                                                      .precision!)
                                                  .format(double.parse(
                                                      temp.initiator_amount!))
                                              : numberFormatWithPrecision(temp
                                                      .initiator_currency!
                                                      .precision!)
                                                  .format(double.parse(
                                                      temp.result_amount!)),
                                          currency:
                                              temp.initiator_currency != null
                                                  ? temp.initiator_currency!.id!
                                                      .toUpperCase()
                                                  : '0',
                                          date:
                                              formatShortDate(temp.createdAt!),
                                          iconUrl: temp
                                              .initiator_currency!.icon_url!,
                                          type: tr('history.deposit'),
                                          precision:
                                              temp.initiator_amount != null
                                                  ? temp.initiator_currency!
                                                      .precision!
                                                  : 0,
                                          fee: temp.initiator_amount == null ||
                                                  temp.result_amount == null
                                              ? 0.toStringAsFixed(temp
                                                  .initiator_currency!
                                                  .precision!)
                                              : (double.parse(temp
                                                          .initiator_amount!) -
                                                      double.parse(
                                                          temp.result_amount!))
                                                  .toString(),
                                          network:
                                              '${temp.initiator_payment_interface!.title!} ${temp.initiator_payment_interface!.subtitle!}',
                                          link: temp.initiator_explorer_transaction ==
                                                  null
                                              ? ''
                                              : temp
                                                  .initiator_explorer_transaction!,
                                        );
                                      }()
                                    : const SizedBox(),
      ],
    );
  }
}

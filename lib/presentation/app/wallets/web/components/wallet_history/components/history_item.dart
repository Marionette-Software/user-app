import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_history_by_wallet.data.gql.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/history/web/components/details_components/components/detail_staking.dart';
import 'package:user_app/presentation/app/history/web/components/details_components/components/detail_withdraw.dart';
import 'package:user_app/presentation/app/history/web/components/details_components/components/details_deposit.dart';
import 'package:user_app/presentation/app/history/web/components/details_components/components/details_exchange.dart';
import 'package:user_app/presentation/app/history/web/components/details_components/components/details_referral_rewards.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/check_type.dart';
import 'package:user_app/presentation/helpers/formatters/format_date.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class HistoryItemWeb extends HookConsumerWidget {
  const HistoryItemWeb({
    Key? key,
    required this.item,
    required this.walletId,
    required this.date,
  }) : super(key: key);

  final GGetUserHistoryByIdData_history_result item;
  final String walletId;
  final String date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);

    String getFormattedAmount(GGetUserHistoryByIdData_history_result item) {
      String operationType = checkTypeOperations(item, walletId);
      double initiatorAmount = double.parse(item.initiator_amount!);
      double resultAmount =
          item.result_amount != null ? double.parse(item.result_amount!) : 0.0;

      String formattedAmount = '';

      switch (operationType) {
        case 'Staking reward':
          formattedAmount =
              '+ ${abbreviateNumber(number: initiatorAmount, precision: walletData.precision)}';
          break;

        case 'Referral reward':
          formattedAmount =
              '+ ${abbreviateNumber(number: initiatorAmount, precision: walletData.precision)}';
          break;

        case 'Withdrawal':
          formattedAmount =
              '- ${abbreviateNumber(number: initiatorAmount, precision: walletData.precision)}';
          break;

        case 'Deposit':
        case 'Transfer to Advanced':
        case 'Transfer to Primary':
          formattedAmount =
              '+ ${abbreviateNumber(number: resultAmount, precision: walletData.precision)}';
          break;

        case '-':
          formattedAmount =
              '- ${abbreviateNumber(number: initiatorAmount, precision: walletData.precision)}';
          break;

        default:
          formattedAmount =
              '+ ${abbreviateNumber(number: resultAmount, precision: walletData.precision)}';
          break;
      }

      return formattedAmount;
    }

    return SizedBox(
      width: 620.w,
      child: Row(
        children: [
          SizedBox(
            width: 22.w,
            height: 22.h,
            child: checkTypeIcon(
              item,
              (walletData.lightBgColor2 != null &&
                      walletData.lightBgColor2 != '')
                  ? HexColor(walletData.lightBgColor2!)
                  : MainColorsApp.accentColor,
              (walletData.lightBgColor1 != null &&
                      walletData.lightBgColor1 != '')
                  ? HexColor(walletData.lightBgColor1!)
                  : MainColorsApp.accentColor,
              walletId,
              PlatformTypeState.web,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Text(
                  checkType(item, walletId),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1.sp,
                      ),
                ),
              ),
              Text(
                date,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: isLightTheme(context)
                          ? opacityTextColor
                          : AppColors.whiteColor.withOpacity(0.5),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.75.sp,
                    ),
              )
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                getFormattedAmount(item),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -1.sp,
                    ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        width: 10.w,
                        child: Icon(
                          Icons.circle,
                          size: 10.r,
                          color: checkTypeOperations(item, walletId) ==
                                      'Deposit' ||
                                  checkTypeOperations(item, walletId) ==
                                      'Staking reward' ||
                                  checkTypeOperations(item, walletId) ==
                                      'Referral reward'
                              ? MainColorsApp.greenColor
                              : walletHistoryStatus(item.status!) == 'Success'
                                  ? MainColorsApp.greenColor
                                  : walletHistoryStatus(item.status!) ==
                                          'Rejected'
                                      ? MainColorsApp.redColor
                                      : MainColorsApp.yellowLogoColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          checkTypeOperations(item, walletId) == 'Deposit' ||
                                  checkTypeOperations(item, walletId) ==
                                      'Staking reward' ||
                                  checkTypeOperations(item, walletId) ==
                                      'Referral reward'
                              ? tr('wallet.success')
                              : walletHistoryStatus(item.status!),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                color: checkTypeOperations(item, walletId) ==
                                            'Deposit' ||
                                        checkTypeOperations(item, walletId) ==
                                            'Staking reward' ||
                                        checkTypeOperations(item, walletId) ==
                                            'Referral reward'
                                    ? MainColorsApp.greenColor
                                    : walletHistoryStatus(item.status!) ==
                                            'Success'
                                        ? MainColorsApp.greenColor
                                        : walletHistoryStatus(item.status!) ==
                                                'Rejected'
                                            ? MainColorsApp.redColor
                                            : MainColorsApp.yellowLogoColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.75.sp,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 12.w,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              if (item.initiator_type == 'custodial_deposit' ||
                  item.initiator_type == 'deposit') {
                showDialog(
                  barrierColor: AppColors.placeHolderGrey,
                  context: context,
                  builder: (context) => ModalWindowWallet(
                    titleSize: 30,
                    title: '',
                    backgroundColor: Colors.transparent,
                    content: DetailDepositComponent(
                      status: 'Success',
                      paymentInterfaceType: item
                          .initiator_currency!.currencyPaymentInterfaces!
                          .firstWhere((p0) =>
                              p0!.paymentInterfaceId ==
                              item.initiator_payment_interface_id)!
                          .type!,
                      amount: item.result_amount == null
                          ? numberFormatWithPrecision(
                                  item.initiator_currency!.precision!)
                              .format(double.parse(item.initiator_amount!))
                          : numberFormatWithPrecision(
                                  item.initiator_currency!.precision!)
                              .format(double.parse(item.result_amount!)),
                      currency: item.initiator_currency != null
                          ? item.initiator_currency!.id!.toUpperCase()
                          : '0',
                      date: formatShortDate(item.createdAt!),
                      iconUrl: item.initiator_currency!.icon_url!,
                      type: tr('history.deposit'),
                      precision: item.initiator_amount != null
                          ? item.initiator_currency!.precision!
                          : 0,
                      fee: item.initiator_amount == null ||
                              item.result_amount == null
                          ? 0.toStringAsFixed(
                              item.initiator_currency!.precision!)
                          : (double.parse(item.initiator_amount!) -
                                  double.parse(item.result_amount!))
                              .toString(),
                      network:
                          '${item.initiator_payment_interface!.title!} ${item.initiator_payment_interface!.subtitle!}',
                      link: item.initiator_explorer_transaction == null
                          ? ''
                          : item.initiator_explorer_transaction!,
                    ),
                  ),
                );
              } else if (item.initiator_type == 'custodial_withdrawal') {
                showDialog(
                  barrierColor: AppColors.placeHolderGrey,
                  context: context,
                  builder: (context) => ModalWindowWallet(
                    titleSize: 30,
                    title: '',
                    backgroundColor: Colors.transparent,
                    content: DetailWithdrawComponent(
                      peymentInterfaceType: item
                          .initiator_currency!.currencyPaymentInterfaces!
                          .firstWhere((p0) =>
                              p0!.paymentInterfaceId ==
                              item.initiator_payment_interface_id)!
                          .type!,
                      iconUrl: item.initiator_currency!.icon_url!,
                      amount: item.result_amount != null
                          ? numberFormatWithPrecision(
                                  item.result_currency!.precision!)
                              .format(double.parse(item.result_amount!))
                          : '0',
                      currency: item.initiator_currency!.id!.toUpperCase(),
                      date: formatShortDate(item.createdAt!),
                      type: tr('history.withdraw'),
                      network:
                          '${item.initiator_payment_interface!.title!} ${item.initiator_payment_interface!.subtitle!}',
                      fee: item.initiator_fee != null
                          ? item.initiator_fee!.toString()
                          : '0',
                      precision: item.initiator_currency!.precision!,
                      link: item.result_txid != null
                          ? item.initiator_explorer_transaction!
                              .replaceAll('#{txid}', item.result_txid!)
                          : '',
                      status: item.status!,
                    ),
                  ),
                );
              } else if (item.initiator_type == 'staking_rewards') {
                showDialog(
                  barrierColor: AppColors.placeHolderGrey,
                  context: context,
                  builder: (context) => ModalWindowWallet(
                    titleSize: 30,
                    title: '',
                    backgroundColor: Colors.transparent,
                    content: DetailStakingComponent(
                      iconUrl: item.initiator_currency!.icon_url!,
                      currency: item.initiator_currency!.id!.toUpperCase(),
                      date: formatShortDate(item.createdAt!),
                      type: 'Staking reward',
                      amount: numberFormatWithPrecision(
                              item.initiator_currency!.precision!)
                          .format(double.parse(item.initiator_amount!)),
                      precision: item.initiator_currency != null
                          ? item.initiator_currency!.precision!
                          : 2,
                    ),
                  ),
                );
              } else if (item.initiator_type == 'deposit_reward' ||
                  item.initiator_type == 'trade_reward') {
                showDialog(
                  barrierColor: AppColors.placeHolderGrey,
                  context: context,
                  builder: (context) => ModalWindowWallet(
                    titleSize: 30,
                    title: '',
                    backgroundColor: Colors.transparent,
                    content: DetailReferralsRewardsComponent(
                      iconUrl: item.initiator_currency!.icon_url!,
                      currency: item.initiator_currency!.id!.toUpperCase(),
                      date: formatShortDate(item.createdAt!),
                      type: item.initiator_type == 'deposit_reward'
                          ? 'Referral deposit reward'
                          : 'Referral trade reward',
                      amount: double.parse(item.initiator_amount!)
                          .toStringAsFixed(item.initiator_currency!.precision!),
                      precision: item.initiator_currency != null
                          ? item.initiator_currency!.precision!
                          : 2,
                    ),
                  ),
                );
              } else if (item.initiator_type == 'exchange') {
                int ratePrecision = 0;

                for (var element in walletData.markets) {
                  if (element.id ==
                      '${item.initiator_currency!.id}-${item.result_currency!.id}') {
                    ratePrecision = element.swapBaseToQuotePricePrecision;
                  } else if (element.id ==
                      '${item.result_currency!.id}-${item.initiator_currency!.id}') {
                    ratePrecision = element.swapQuoteToBasePricePrecision;
                  }
                }
                showDialog(
                  barrierColor: AppColors.placeHolderGrey,
                  context: context,
                  builder: (context) => ModalWindowWallet(
                    titleSize: 30,
                    title: '',
                    backgroundColor: Colors.transparent,
                    content: DetailExchangeComponent(
                      ratePrecision: ratePrecision,
                      iconUrlFrom: item.initiator_currency!.icon_url!,
                      sellAmount:
                          '${item.initiator_amount != null && item.initiator_amount != null ? numberFormatWithPrecision(item.initiator_currency!.precision!).format(double.parse(item.initiator_amount!)).toString() : '0'} ${item.initiator_currency!.id!.toUpperCase()}',
                      buyAmount:
                          '${item.result_currency != null && item.result_amount != null ? numberFormatWithPrecision(item.result_currency!.precision!).format(double.parse(item.result_amount!)).toString() : '0'} ${item.result_currency!.id!.toUpperCase()}',
                      currency:
                          '${item.initiator_currency!.id!.toUpperCase()}/${item.result_currency!.id!.toUpperCase()}',
                      date: formatShortDate(item.createdAt!),
                      type: tr('history.swap'),
                      side: tr('history.sell'),
                      rate: item.result_amount != null &&
                              item.initiator_amount != null
                          ? (double.parse(item.result_amount!) /
                                  double.parse(item.initiator_amount!))
                              .toString()
                          : '0',
                      total: item.result_amount != null
                          ? item.result_amount!
                          : '0',
                      iconUrlTo: item.result_currency!.icon_url!,
                      precision: item.result_currency != null
                          ? item.result_currency!.precision!
                          : 2,
                    ),
                  ),
                );
              }
            },
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                isLightTheme(context)
                    ? Theme.of(context).primaryColor.withOpacity(0.5)
                    : AppColors.whiteColor.withOpacity(0.5),
                BlendMode.srcIn,
              ),
              child: SvgPicture.asset(
                walletInfoPath,
                width: 18.w,
              ),
            ),
          )
        ],
      ),
    );
  }
}

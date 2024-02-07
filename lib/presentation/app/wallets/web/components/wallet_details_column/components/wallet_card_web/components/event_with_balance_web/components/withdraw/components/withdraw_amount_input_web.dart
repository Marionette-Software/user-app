import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/application/withdrawal/fee_withdraw_state_provider.dart';
import 'package:user_app/application/withdrawal/net_withdrawal_amount_state_notifier_provider.dart';
import 'package:user_app/application/withdrawal/withdraw_payment_interface_state_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/text_input_formater.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/truncate_decimals.dart';

class WithdrawAmountInputWeb extends HookConsumerWidget {
  const WithdrawAmountInputWeb({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.withTradingBalance,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String) onChanged;
  final bool withTradingBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final updateWithdrawalFee =
        ref.read(feeWithdrawalNotifierProvider.notifier);
    final paymentInterfaceWatch =
        ref.watch(withdrawPaymentInterfaceNotifierProvider);
    final updateNetAmount =
        ref.read(netWithdrawalAmountNotifierProvider.notifier);

    final userBalance = ref
        .watch(userBalancesStateNotifierProvider)
        .firstWhere((e) => e.id == walletData.id);

    double walletBalance = withTradingBalance
        ? userBalance.balance!
        : (userBalance.balance! + userBalance.advancedTradingBalance!);

    return Column(
      children: [
        Row(
          children: [
            UserAppImage(
              clipBehavior: Clip.hardEdge,
              path: paymentInterfaceWatch.currency.icon_url!,
              width: 50.w,
              height: 50.h,
              isNetwork: true,
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              paymentInterfaceWatch.currency.id.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1.sp,
                  ),
            ),
            Expanded(
              child: Focus(
                onFocusChange: (value) {
                  var v = controller.text;

                  if ((v.isEmpty || v == '0') && value == false) {
                    controller.text = 0.toStringAsFixed(walletData.precision);
                  } else if ((v == 0.toStringAsFixed(walletData.precision) ||
                          v == 'Infinity') &&
                      value == true) {
                    controller.text = '';
                  }
                },
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (str) {},
                  controller: controller,
                  inputFormatters: [
                    RegExInputFormatter.withRegex(
                      '^\$|^(0|([1-9.][0-9.]{0,14}))(\\.[0-9]{0,14})?\$',
                    ),
                    NumberTextInputFormatter(
                      decimalRange: walletData.precision,
                    ),
                  ],
                  onChanged: onChanged,
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
                    hintText: tr('wallet.amount'),
                    hintStyle: TextStyle(
                      fontSize: 30.sp,
                      color: isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      letterSpacing: -1.5.sp,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 11.w, bottom: 0.h, top: 0),
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
                    fontSize: 30.sp,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                    letterSpacing: -2.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Tooltip(
              message: 'Use all available balance'.hardcoded,
              verticalOffset: -60.h,
              child: InkWell(
                onTap: () {
                  controller.text = walletBalance
                      .truncateToDecimalPlaces(walletData.precision)
                      .toStringAsFixed(walletData.precision);
                  var amount = walletBalance;
                  var withdrawalFeeFactor =
                      (paymentInterfaceWatch.withdrawFee / 100);

                  if (amount >= paymentInterfaceWatch.minWithdrawFee) {
                    if (amount * withdrawalFeeFactor >=
                            paymentInterfaceWatch.minWithdrawFee &&
                        amount * withdrawalFeeFactor <=
                            paymentInterfaceWatch.maxWithdrawFee) {
                      updateWithdrawalFee.updateFee(
                          (amount * withdrawalFeeFactor)
                              .toStringAsFixed(walletData.precision));

                      updateNetAmount.updateNetAmount(
                        (amount - amount * withdrawalFeeFactor)
                            .truncateToDecimalPlaces(walletData.precision)
                            .toStringAsFixed(walletData.precision),
                      );
                    } else if (amount > walletBalance) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        clipBehavior: Clip.none,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          titleFontSize: 30.sp,
                          messageFontSize: 20.sp,
                          title: tr('snack_bar_message.errors.error'),
                          message:
                              tr('snack_bar_message.errors.not_enough_balance'),
                          contentType: ContentType.failure,
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                      updateNetAmount.updateNetAmount(
                        (amount - paymentInterfaceWatch.maxWithdrawFee)
                            .truncateToDecimalPlaces(walletData.precision)
                            .toStringAsFixed(walletData.precision),
                      );

                      updateWithdrawalFee.updateFee(paymentInterfaceWatch
                          .maxWithdrawFee
                          .toStringAsFixed(walletData.precision));
                    } else if (amount * withdrawalFeeFactor >
                        paymentInterfaceWatch.maxWithdrawFee) {
                      updateNetAmount.updateNetAmount(
                        (amount - paymentInterfaceWatch.maxWithdrawFee)
                            .truncateToDecimalPlaces(walletData.precision)
                            .toStringAsFixed(walletData.precision),
                      );

                      updateWithdrawalFee.updateFee(paymentInterfaceWatch
                          .maxWithdrawFee
                          .toStringAsFixed(walletData.precision));
                    } else {
                      updateNetAmount.updateNetAmount(
                        (amount - (paymentInterfaceWatch.minWithdrawFee))
                            .truncateToDecimalPlaces(walletData.precision)
                            .toStringAsFixed(walletData.precision),
                      );
                    }
                  } else {
                    updateWithdrawalFee.updateFee(
                      paymentInterfaceWatch.minWithdrawFee
                          .toStringAsFixed(walletData.precision),
                    );
                    updateNetAmount.updateNetAmount(
                      double.parse('0').toStringAsFixed(walletData.precision),
                    );
                  }
                },
                borderRadius: BorderRadius.circular(21.r),
                child: Container(
                  width: 75.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    color: MainColorsApp.accentColor,
                    borderRadius: BorderRadius.circular(21.r),
                  ),
                  child: Center(
                    child: Text(
                      'Max'.hardcoded,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 20.sp,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -1.sp,
                          ),
                    ),
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
            borderRadius: BorderRadius.circular(16.r),
            color: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : AppColors.whiteColor.withOpacity(0.25),
          ),
        ),
      ],
    );
  }
}

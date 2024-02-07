import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/application/withdrawal/fee_withdraw_state_provider.dart';
import 'package:user_app/application/withdrawal/net_withdrawal_amount_state_notifier_provider.dart';
import 'package:user_app/application/withdrawal/withdraw_payment_interface_state_provider.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/wallet/recipient.dart';
import 'package:user_app/infrastructure/withdraw/withdraw_service.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/withdraw/components/fee_info.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/withdraw/components/row_alailable_balance.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/withdraw/components/withdraw_amount_input.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/withdraw/withdrawal_fiat/components/add_new_recipient_btn_mobile.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/withdraw/withdrawal_fiat/components/list_recipirnt_mobile.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/withdraw/withdrawal_fiat/components/select_recipient_container_mobile.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/two_fa/mobile/permission_two_fa.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class WithdrawalFiatMobile extends StatefulHookConsumerWidget {
  const WithdrawalFiatMobile({
    required this.withTradingBalance,
    super.key,
  });

  final bool withTradingBalance;

  @override
  ConsumerState<WithdrawalFiatMobile> createState() =>
      _WithdrawalFiatMobileState();
}

class _WithdrawalFiatMobileState extends ConsumerState<WithdrawalFiatMobile> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final updateNetAmountWatch = ref.watch(netWithdrawalAmountNotifierProvider);
    final updateNetAmount =
        ref.read(netWithdrawalAmountNotifierProvider.notifier);
    final updateWithdrawalFeeWatch = ref.watch(feeWithdrawalNotifierProvider);
    final updateWithdrawalFee =
        ref.read(feeWithdrawalNotifierProvider.notifier);
    final paymentInterfaceWatch =
        ref.watch(withdrawPaymentInterfaceNotifierProvider);

    final amountController = useTextEditingController(
      text: (0.0).toStringAsFixed(walletData.precision),
    );

    final loaderState = useState(LoadState.notLoading);

    final userBalance = ref
        .watch(userBalancesStateNotifierProvider)
        .firstWhere((e) => e.id == walletData.id);

    double walletBalance = widget.withTradingBalance
        ? userBalance.balance!
        : (userBalance.balance! + userBalance.advancedTradingBalance!);

    final IWithdrawService serviceWithdraw = WithdrawService();

    final selectedRecipient = useState(
      Recipient(id: '', data: '', description: ''),
    );

    withdrawal(String code) async {
      final responseWithdraw = await serviceWithdraw.createWithdraw(
        code: code,
        recipientId: selectedRecipient.value.id,
        amount: double.parse(amountController.text),
      );

      if (responseWithdraw is GraphQlError) {
        context.pop();
        final snackBar = SnackBar(
          elevation: 0,
          padding: EdgeInsets.only(
            bottom:
                // ignore: use_build_context_synchronously
                MediaQuery.viewInsetsOf(context).bottom + 30
                  ..h,
          ),
          behavior: SnackBarBehavior.floating,
          clipBehavior: Clip.none,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            titleFontSize: 20.sp,
            messageFontSize: 15.sp,
            title: tr('snack_bar_message.errors.error'),
            message: tr('snack_bar_message.errors.${responseWithdraw.message}'),
            contentType: ContentType.failure,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      } else {
        final snackBar = SnackBar(
          elevation: 0,
          padding: EdgeInsets.only(
            bottom:
                // ignore: use_build_context_synchronously
                MediaQuery.viewInsetsOf(context).bottom + 30
                  ..h,
          ),
          behavior: SnackBarBehavior.floating,
          clipBehavior: Clip.none,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            titleFontSize: 20.sp,
            messageFontSize: 15.sp,
            title: tr('snack_bar_message.success.success'),
            message: tr('snack_bar_message.success.successful'),
            contentType: ContentType.success,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        context.pop();
        context.pop();
      }
    }

    validateWithdrawalInput() {
      if (amountController.text.isEmpty) {
        return false;
      }

      if (updateNetAmountWatch['amount'].isEmpty) {
        return false;
      }

      var parsedAmount = double.parse(updateWithdrawalFeeWatch['fee']) +
          double.parse(updateNetAmountWatch['amount']);

      if (parsedAmount <
          paymentInterfaceWatch.minWithdrawAmount +
              paymentInterfaceWatch.minWithdrawFee) {
        return false;
      }

      if (parsedAmount > paymentInterfaceWatch.maxWithdrawAmount) {
        return false;
      }

      if (parsedAmount > walletBalance) {
        return false;
      }
      if ((amountController.text.isNotEmpty
              ? double.parse(amountController.text)
              : 0) >
          walletBalance) {
        return false;
      }
      if (double.parse(updateNetAmountWatch['amount'])
              .toStringAsFixed(walletData.precision) ==
          0.toStringAsFixed(walletData.precision)) {
        return false;
      }

      if (selectedRecipient.value.description!.isEmpty) {
        return false;
      }

      return true;
    }

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
                  'Buy ${walletData.id.toUpperCase()}',
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
                  InkWell(
                    onTap: () {
                      showDialog(
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: isLightTheme(context)
                                ? const Color(0xFFEFEFF4)
                                : const Color(0xFF293037),
                            alignment: Alignment.topCenter,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            insetPadding: EdgeInsets.only(
                              left: 20.w,
                              right: 20.w,
                              top: 65..h,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 20..h,
                                    bottom: 5..h,
                                    left: 22.w,
                                    right: 22.w,
                                  ),
                                  child: const AddNewRecipientBtnMobile(),
                                ),
                                ListRecipientMobile(
                                  selectedRecipient: selectedRecipient,
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: SelectRecipientContainerMobile(
                      selectedRecipient: selectedRecipient,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: Column(
                      children: [
                        WithdrawAmountInputMobile(
                          withTradingBalance: widget.withTradingBalance,
                          controller: amountController,
                          onChanged: (value) {
                            value = value == '.' ? '0.' : value;
                            if (value.isEmpty) {
                              updateWithdrawalFee.updateFee(
                                paymentInterfaceWatch.minWithdrawFee
                                    .toStringAsFixed(walletData.precision),
                              );
                              updateNetAmount.updateNetAmount(
                                double.parse('0')
                                    .toStringAsFixed(walletData.precision),
                              );
                            } else {
                              var amount = double.parse(value);
                              var withdrawalFeeFactor =
                                  (paymentInterfaceWatch.withdrawFee / 100);

                              if (amount >=
                                  paymentInterfaceWatch.minWithdrawFee) {
                                if (amount * withdrawalFeeFactor >=
                                        paymentInterfaceWatch.minWithdrawFee &&
                                    amount * withdrawalFeeFactor <=
                                        paymentInterfaceWatch.maxWithdrawFee) {
                                  updateWithdrawalFee.updateFee((amount *
                                          withdrawalFeeFactor)
                                      .toStringAsFixed(walletData.precision));

                                  updateNetAmount.updateNetAmount(
                                    (amount - amount * withdrawalFeeFactor)
                                        .toStringAsFixed(walletData.precision),
                                  );
                                } else if (amount > walletBalance) {
                                  updateNetAmount.updateNetAmount(
                                    (0.0).toStringAsFixed(walletData.precision),
                                  );

                                  updateWithdrawalFee.updateFee(
                                      paymentInterfaceWatch.maxWithdrawFee
                                          .toStringAsFixed(
                                              walletData.precision));
                                } else if (amount * withdrawalFeeFactor >
                                    paymentInterfaceWatch.maxWithdrawFee) {
                                  updateNetAmount.updateNetAmount(
                                    (amount -
                                            paymentInterfaceWatch
                                                .maxWithdrawFee)
                                        .toStringAsFixed(walletData.precision),
                                  );

                                  updateWithdrawalFee.updateFee(
                                      paymentInterfaceWatch.maxWithdrawFee
                                          .toStringAsFixed(
                                              walletData.precision));
                                } else {
                                  updateWithdrawalFee.updateFee(
                                      paymentInterfaceWatch.minWithdrawFee
                                          .toStringAsFixed(
                                              walletData.precision));
                                  updateNetAmount.updateNetAmount(
                                    (amount -
                                            (paymentInterfaceWatch
                                                .minWithdrawFee))
                                        .toStringAsFixed(walletData.precision),
                                  );
                                }
                              } else {
                                updateWithdrawalFee.updateFee(
                                  paymentInterfaceWatch.minWithdrawFee
                                      .toStringAsFixed(walletData.precision),
                                );
                                updateNetAmount.updateNetAmount(
                                  double.parse('0')
                                      .toStringAsFixed(walletData.precision),
                                );
                              }
                            }
                          },
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
                        RowAvailableBalanceMobile(
                          walletBalance: walletBalance,
                          walletData: walletData,
                        ),
                      ],
                    ),
                  ),
                  FeeInfoMobile(
                    amountController: amountController,
                    withLimitWithdraw: false,
                  ),
                  SizedBox(height: 25..h),
                  loaderState.value == LoadState.loading
                      ? const CircularProgressIndicator()
                      : MainButton(
                          onTap: validateWithdrawalInput()
                              ? () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PerditionTwoFaMobile(
                                        onPermission2Fa: withdrawal,
                                      ),
                                    ),
                                  );
                                }
                              : null,
                          text: tr('wallet.submit'),
                          height: 45..h,
                          fontSize: 15,
                          borderRadius: 25,
                          color: Theme.of(context).primaryColorLight,
                          disableColor:
                              MainColorsApp.accentColor.withOpacity(0.5),
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

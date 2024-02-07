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
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/wallet/recipient.dart';
import 'package:user_app/infrastructure/withdraw/withdraw_service.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/withdraw/components/fee_info_web.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/withdraw/components/row_available_balance.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/withdraw/components/withdraw_amount_input_web.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/withdraw/fiat_withdraw/components/add_new_recipient_btn.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/withdraw/fiat_withdraw/components/list_recipient.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/withdraw/fiat_withdraw/components/select_recipient_container.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/components/two_fa/permission_2fa.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class FiatWithdrawWeb extends StatefulHookConsumerWidget {
  const FiatWithdrawWeb({
    required this.withTradingBalance,
    super.key,
  });

  final bool withTradingBalance;

  @override
  ConsumerState<FiatWithdrawWeb> createState() => _FiatWithdrawWebState();
}

class _FiatWithdrawWebState extends ConsumerState<FiatWithdrawWeb> {
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
          clipBehavior: Clip.none,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            titleFontSize: 30.sp,
            messageFontSize: 20.sp,
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
          clipBehavior: Clip.none,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            titleFontSize: 30.sp,
            messageFontSize: 20.sp,
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

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 600.w,
        child: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
            bottom: 50.h,
            left: 25.w,
            right: 25.w,
          ),
          child: Column(
            children: [
              Text(
                '${'Send'.hardcoded} ${walletData.id.toUpperCase()}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 30.sp,
                      color: isLightTheme(context)
                          ? AppColors.darkColorText
                          : AppColors.whiteColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1.5.sp,
                    ),
              ),
              paymentInterfaceWatch.recipients.isEmpty
                  ? Padding(
                      padding: EdgeInsets.only(
                        top: 38.h,
                        bottom: 38.h,
                      ),
                      child: const AddNewRecipientBtn(),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                        top: 25.h,
                        bottom: 25.h,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25.r),
                        onTap: () {
                          showDialog(
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.only(top: 90.h),
                                child: Dialog(
                                  backgroundColor: isLightTheme(context)
                                      ? const Color(0xFFEFEFF4)
                                      : const Color(0xFF293037),
                                  alignment: Alignment.topCenter,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 18.h,
                                          bottom: 15.h,
                                        ),
                                        child: const AddNewRecipientBtn(),
                                      ),
                                      ListRecipient(
                                        selectedRecipient: selectedRecipient,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: SelectRecipientContainerWeb(
                          selectedRecipient: selectedRecipient,
                        ),
                      ),
                    ),
              WithdrawAmountInputWeb(
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
                      double.parse('0').toStringAsFixed(walletData.precision),
                    );
                  } else {
                    var amount = double.parse(value);
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
                              .toStringAsFixed(walletData.precision),
                        );
                      } else if (amount > walletBalance) {
                        updateNetAmount.updateNetAmount(
                          (0.0).toStringAsFixed(walletData.precision),
                        );

                        updateWithdrawalFee.updateFee(paymentInterfaceWatch
                            .maxWithdrawFee
                            .toStringAsFixed(walletData.precision));
                      } else if (amount * withdrawalFeeFactor >
                          paymentInterfaceWatch.maxWithdrawFee) {
                        updateNetAmount.updateNetAmount(
                          (amount - paymentInterfaceWatch.maxWithdrawFee)
                              .toStringAsFixed(walletData.precision),
                        );

                        updateWithdrawalFee.updateFee(paymentInterfaceWatch
                            .maxWithdrawFee
                            .toStringAsFixed(walletData.precision));
                      } else {
                        updateWithdrawalFee.updateFee(paymentInterfaceWatch
                            .minWithdrawFee
                            .toStringAsFixed(walletData.precision));
                        updateNetAmount.updateNetAmount(
                          (amount - (paymentInterfaceWatch.minWithdrawFee))
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
                  }
                },
              ),
              RowAvailableBalanceWeb(
                walletBalance: walletBalance,
                walletData: walletData,
              ),
              FeeInfoWeb(
                amountController: amountController,
                withLimitWithdraw: false,
              ),
              SizedBox(height: 30.h),
              loaderState.value == LoadState.loading
                  ? const CircularProgressIndicator()
                  : MainButton(
                      disableColor: MainColorsApp.accentColor.withOpacity(0.5),
                      onTap: validateWithdrawalInput()
                          ? () async {
                              showDialog(
                                barrierColor: AppColors.placeHolderGrey,
                                context: context,
                                builder: (context) => ModalWindowWallet(
                                  titleSize: 30,
                                  title: '',
                                  content: Permission2Fa(
                                    platformType: PlatformTypeState.web,
                                    onPermission2Fa: withdrawal,
                                  ),
                                ),
                              );
                            }
                          : null,
                      text: tr('wallet.submit'),
                      height: 60.h,
                      color: Theme.of(context).primaryColorLight,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

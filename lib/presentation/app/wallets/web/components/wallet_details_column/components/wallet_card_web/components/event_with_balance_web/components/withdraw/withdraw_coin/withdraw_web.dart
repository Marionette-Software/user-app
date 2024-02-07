// ignore_for_file: use_build_context_synchronously
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/actions/wallet_actions.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/application/withdrawal/withdraw_payment_interface_state_provider.dart';
import 'package:user_app/application/withdrawal/fee_withdraw_state_provider.dart';
import 'package:user_app/application/withdrawal/net_withdrawal_amount_state_notifier_provider.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/wallet/withdraw_payment_interface.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/withdraw/components/row_available_balance.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/withdraw/withdraw_coin/components/choose_payment_interface_web.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/withdraw/components/fee_info_web.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/components/wallet/withdraw/request_exceeds_web.dart';
import 'package:user_app/presentation/components/two_fa/permission_2fa.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/withdraw/components/withdraw_amount_input_web.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/withdraw/withdraw_coin/components/withdrow_important.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class WithdrawWeb extends HookConsumerWidget {
  const WithdrawWeb({
    required this.withTradingBalance,
    required this.listWalletWithdrawPI,
    super.key,
  });

  final bool withTradingBalance;
  final List<WithdrawPaymentInterface> listWalletWithdrawPI;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final updateNetAmountWatch = ref.watch(netWithdrawalAmountNotifierProvider);
    final updateNetAmount =
        ref.read(netWithdrawalAmountNotifierProvider.notifier);
    final updateWithdrawalFeeWatch = ref.watch(feeWithdrawalNotifierProvider);
    final updateWithdrawalFee =
        ref.read(feeWithdrawalNotifierProvider.notifier);
    final paymentInterfaceWatch =
        ref.watch(withdrawPaymentInterfaceNotifierProvider);

    final walletAddressController = useTextEditingController(text: '');
    final amountController = useTextEditingController(
      text: (0.0).toStringAsFixed(walletData.precision),
    );

    final loaderState = useState(LoadState.notLoading);
    final walletAddress = useState('');

    WalletActionsGeneral walletActionsGeneral = WalletActionsGeneral();

    double limitWithdraw24h = paymentInterfaceWatch.maxWithdrawAmount24h -
        paymentInterfaceWatch.withdrawAmount24h;

    final userBalance = ref
        .watch(userBalancesStateNotifierProvider)
        .firstWhere((e) => e.id == walletData.id);

    double walletBalance = withTradingBalance
        ? userBalance.balance!
        : (userBalance.balance! + userBalance.advancedTradingBalance!);

    validateWithdrawalInput(String address) {
      if (address.isEmpty) {
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
      if (limitWithdraw24h <= 0) {
        return false;
      }
      return true;
    }

    withdrawal(String code) async {
      final responseWithdraw = await walletActionsGeneral.withdraw(
        paymentInterfaceId: paymentInterfaceWatch.paymentInterface.id,
        currencyId: walletData.id,
        code: code,
        recipientData: '{"address":"${walletAddressController.text}"}',
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

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 600.w,
        child: Padding(
          padding: EdgeInsets.only(
            top: 25.h,
            bottom: 50.h,
          ),
          child: Column(
            children: [
              Text(
                '${tr('wallet.send')} ${walletData.name}',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: isLightTheme(context)
                          ? AppColors.darkColorText
                          : AppColors.whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 30.sp,
                      letterSpacing: -1.5.sp,
                    ),
              ),
              SizedBox(
                height: 25.h,
              ),
              ChoosePaymentInterfaceWeb(
                amountController: amountController,
                walletAddressController: walletAddressController,
                paymentInterfacesList: listWalletWithdrawPI,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 25.w,
                  right: 25.w,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20.h,
                        bottom: 30.h,
                      ),
                      child: const WithdrawImportantWeb(),
                    ),
                    Row(
                      children: [
                        walletAddressController.text.isNotEmpty
                            ? Tooltip(
                                message: walletAddressController.text,
                                verticalOffset: -50.h,
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    isLightTheme(context)
                                        ? Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.5)
                                        : AppColors.whiteColor.withOpacity(0.5),
                                    BlendMode.srcIn,
                                  ),
                                  child: SvgPicture.asset(
                                    walletInfoPath,
                                    width: 25.w,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            onFieldSubmitted: (str) {},
                            controller: walletAddressController,
                            onChanged: (value) {
                              walletAddress.value = value;
                            },
                            validator: (text) {
                              if (text!.isEmpty) {
                                return 'Error';
                              } else {
                                return null;
                              }
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
                              hintText: 'Enter wallet address',
                              hintStyle: TextStyle(
                                fontSize: 30.sp,
                                color: isLightTheme(context)
                                    ? AppColors.aboutHeaderLight
                                    : AppColors.whiteColor.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                                letterSpacing: -1.5.sp,
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                              ),
                              contentPadding: EdgeInsets.only(
                                  left: 11.w, bottom: 0.h, top: 0),
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
                              fontSize: 30.sp,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                              letterSpacing: -2.sp,
                            ),
                          ),
                        ),
                      ],
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
                      height: 25.h,
                    ),
                    WithdrawAmountInputWeb(
                      withTradingBalance: withTradingBalance,
                      controller: amountController,
                      onChanged: paymentInterfaceWatch.paymentInterface != null
                          ? (value) {
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
                                          paymentInterfaceWatch
                                              .minWithdrawFee &&
                                      amount * withdrawalFeeFactor <=
                                          paymentInterfaceWatch
                                              .maxWithdrawFee) {
                                    updateWithdrawalFee.updateFee((amount *
                                            withdrawalFeeFactor)
                                        .toStringAsFixed(walletData.precision));

                                    updateNetAmount.updateNetAmount(
                                      (amount - amount * withdrawalFeeFactor)
                                          .toStringAsFixed(
                                              walletData.precision),
                                    );
                                  } else if (amount > walletBalance) {
                                    updateNetAmount.updateNetAmount(
                                      (amount -
                                              paymentInterfaceWatch
                                                  .maxWithdrawFee)
                                          .toStringAsFixed(
                                              walletData.precision),
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
                                          .toStringAsFixed(
                                              walletData.precision),
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
                                          .toStringAsFixed(
                                              walletData.precision),
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
                            }
                          : (value) {},
                    ),
                    RowAvailableBalanceWeb(
                      walletBalance: walletBalance,
                      walletData: walletData,
                    ),
                    FeeInfoWeb(
                      amountController: amountController,
                      withLimitWithdraw: true,
                    ),
                    SizedBox(height: 17.5.h),
                    loaderState.value == LoadState.loading
                        ? const CircularProgressIndicator()
                        : MainButton(
                            disableColor:
                                MainColorsApp.accentColor.withOpacity(0.5),
                            onTap: validateWithdrawalInput(walletAddress.value)
                                ? () async {
                                    if (limitWithdraw24h <
                                            double.parse(updateNetAmountWatch[
                                                'amount']) ||
                                        limitWithdraw24h <= 0) {
                                      showDialog(
                                        barrierColor: AppColors.placeHolderGrey,
                                        context: context,
                                        builder: (context) => ModalWindowWallet(
                                          titleSize: 30,
                                          title: '',
                                          content: RequestExceeds(
                                            withdrawWith2FA: withdrawal,
                                            platformType: PlatformTypeState.web,
                                          ),
                                        ),
                                      );
                                    } else {
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
                                  }
                                : null,
                            text: tr('wallet.submit'),
                            height: 60.h,
                            color: Theme.of(context).primaryColorLight,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

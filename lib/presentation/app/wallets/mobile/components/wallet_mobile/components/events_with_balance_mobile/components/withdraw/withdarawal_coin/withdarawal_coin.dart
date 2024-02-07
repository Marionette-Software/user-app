import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/actions/wallet_actions.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/application/withdrawal/withdraw_payment_interface_state_provider.dart';
import 'package:user_app/application/withdrawal/fee_withdraw_state_provider.dart';
import 'package:user_app/application/withdrawal/net_withdrawal_amount_state_notifier_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/wallet/withdraw_payment_interface.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/withdraw/components/fee_info.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/withdraw/components/row_alailable_balance.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/withdraw/components/withdraw_amount_input.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/withdraw/withdarawal_coin/components/withdrawal_limit_request.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/two_fa/mobile/permission_two_fa.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class WithdrawCoinMobile extends HookConsumerWidget {
  const WithdrawCoinMobile({
    required this.withTradingBalance,
    required this.listWalletWithdraw,
    super.key,
  });

  final bool withTradingBalance;
  final List<WithdrawPaymentInterface> listWalletWithdraw;

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

    final paymentInterfaceRead =
        ref.read(withdrawPaymentInterfaceNotifierProvider.notifier);
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

    List<DropdownMenuItem<WithdrawPaymentInterface>> addDividersAfterItems() {
      final List<DropdownMenuItem<WithdrawPaymentInterface>> menuItems = [];
      for (final WithdrawPaymentInterface item in listWalletWithdraw) {
        menuItems.addAll(
          [
            DropdownMenuItem<WithdrawPaymentInterface>(
              value: item,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Row(
                  children: [
                    UserAppImage(
                      clipBehavior: Clip.hardEdge,
                      path: item.paymentInterface.logoUrl,
                      width: 20.w,
                      height: 20..h,
                      isNetwork: true,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      '${item.paymentInterface.title} ${item.paymentInterface.subtitle}',
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
            ),
            // If it's last item, we will not add Divider after it.
            if (item != listWalletWithdraw.last)
              DropdownMenuItem<WithdrawPaymentInterface>(
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
      for (int i = 0; i < (listWalletWithdraw.length * 2) - 1; i++) {
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
            padding: EdgeInsets.only(top: 15..h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 25.w,
                  ),
                  child: BackButtonMobile(
                    onTap: () => context.pop(),
                  ),
                ),
                Text(
                  'Send ${walletData.id.toUpperCase()}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 15.sp,
                        letterSpacing: -0.75.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.center,
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
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<WithdrawPaymentInterface>(
                      isDense: true,
                      isExpanded: true,
                      value: paymentInterfaceWatch,
                      iconStyleData: const IconStyleData(
                        iconSize: 0.1,
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
                      buttonStyleData: ButtonStyleData(
                        width: double.infinity,
                        height: 45..h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r),
                          color: isLightTheme(context)
                              ? AppColors.whiteColor
                              : AppColors.mainBackgroundDarkColor,
                          border: Border.all(
                            width: 5.w,
                            color: isLightTheme(context)
                                ? AppColors.mainBackgroundLightColor
                                : AppColors.whiteColor.withOpacity(0.05),
                          ),
                        ),
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        customHeights: getCustomItemsHeights(),
                        padding: const EdgeInsets.all(0),
                      ),
                      items: addDividersAfterItems(),
                      onChanged: (value) {
                        paymentInterfaceRead.updateInterface(value!);
                        amountController.text =
                            0.toStringAsFixed(walletData.precision);
                        walletAddressController.clear();
                        updateNetAmount.updateNetAmount(
                          double.parse('0')
                              .toStringAsFixed(walletData.precision),
                        );

                        updateWithdrawalFee.updateFee(
                          value.minWithdrawFee
                              .toStringAsFixed(walletData.precision),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25..h,
                  ),
                  Column(
                    children: [
                      TextField(
                        controller: walletAddressController,
                        keyboardType: TextInputType.text,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 20.sp,
                                  color: Theme.of(context).primaryColor,
                                  letterSpacing: -0.5,
                                  fontWeight: FontWeight.w600,
                                ),
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
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
                          hintText: 'Type Address  '.hardcoded,
                          hintStyle:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 15.sp,
                                    color: isLightTheme(context)
                                        ? AppColors.aboutHeaderLight
                                        : AppColors.whiteColor.withOpacity(0.5),
                                    letterSpacing: -0.5.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                          contentPadding: EdgeInsets.only(
                            right: 12.w,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        onChanged: (value) {
                          walletAddress.value = value;
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
                      SizedBox(
                        height: 15..h,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4..h,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.w,
                            color: MainColorsApp.redColor,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              tr('wallet.important'),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: 13.sp,
                                    color: MainColorsApp.redColor,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.65,
                                  ),
                            ),
                            SizedBox(
                              height: 3..h,
                            ),
                            Text(
                              '${tr('wallet.enter_only')} ${'${walletData.id.toUpperCase()} ${paymentInterfaceWatch.paymentInterface.title!} ${tr('wallet.network')} (${paymentInterfaceWatch.paymentInterface.subtitle!})'} ${tr('wallet.for_withdrawal')}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 13.sp,
                                    color: MainColorsApp.redColor,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.65,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25..h,
                      ),
                      WithdrawAmountInputMobile(
                        withTradingBalance: withTradingBalance,
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
                                updateWithdrawalFee.updateFee(
                                    (amount * withdrawalFeeFactor)
                                        .toStringAsFixed(walletData.precision));

                                updateNetAmount.updateNetAmount(
                                  (amount - amount * withdrawalFeeFactor)
                                      .toStringAsFixed(walletData.precision),
                                );
                              } else if (amount > walletBalance) {
                                updateNetAmount.updateNetAmount(
                                  (amount -
                                          paymentInterfaceWatch.maxWithdrawFee)
                                      .toStringAsFixed(walletData.precision),
                                );

                                updateWithdrawalFee.updateFee(
                                    paymentInterfaceWatch.maxWithdrawFee
                                        .toStringAsFixed(walletData.precision));
                              } else if (amount * withdrawalFeeFactor >
                                  paymentInterfaceWatch.maxWithdrawFee) {
                                updateNetAmount.updateNetAmount(
                                  (amount -
                                          paymentInterfaceWatch.maxWithdrawFee)
                                      .toStringAsFixed(walletData.precision),
                                );

                                updateWithdrawalFee.updateFee(
                                    paymentInterfaceWatch.maxWithdrawFee
                                        .toStringAsFixed(walletData.precision));
                              } else {
                                updateWithdrawalFee.updateFee(
                                    paymentInterfaceWatch.minWithdrawFee
                                        .toStringAsFixed(walletData.precision));
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
                      FeeInfoMobile(
                        amountController: amountController,
                        withLimitWithdraw: true,
                      ),
                      SizedBox(height: 25..h),
                      loaderState.value == LoadState.loading
                          ? const CircularProgressIndicator()
                          : MainButton(
                              borderRadius: 25,
                              fontSize: 15,
                              disableColor:
                                  MainColorsApp.accentColor.withOpacity(0.5),
                              onTap:
                                  validateWithdrawalInput(walletAddress.value)
                                      ? () async {
                                          if (limitWithdraw24h <
                                                  double.parse(
                                                      updateNetAmountWatch[
                                                          'amount']) ||
                                              limitWithdraw24h <= 0) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    WithdrawalLimitRequestMobile(
                                                  withdrawWith2FA: withdrawal,
                                                ),
                                              ),
                                            );
                                          } else {
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
                                        }
                                      : null,
                              text: tr('wallet.submit'),
                              height: 45..h,
                              color: Theme.of(context).primaryColorLight,
                            ),
                    ],
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

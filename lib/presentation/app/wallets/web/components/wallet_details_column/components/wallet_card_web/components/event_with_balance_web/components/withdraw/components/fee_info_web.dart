import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/application/withdrawal/fee_withdraw_state_provider.dart';
import 'package:user_app/application/withdrawal/net_withdrawal_amount_state_notifier_provider.dart';
import 'package:user_app/application/withdrawal/withdraw_payment_interface_state_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class FeeInfoWeb extends HookConsumerWidget {
  const FeeInfoWeb({
    super.key,
    required this.amountController,
    required this.withLimitWithdraw,
  });

  final TextEditingController amountController;
  final bool withLimitWithdraw;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final getWithdrawFeeState =
        ref.read(feeWithdrawalNotifierProvider.notifier);
    final paymentInterfaceWatch =
        ref.watch(withdrawPaymentInterfaceNotifierProvider);
    final getNetAmount = ref.watch(netWithdrawalAmountNotifierProvider);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Tooltip(
              message: 'Minimum and Maximum amount for each transaction',
              child: Text(
                tr('wallet.min_max_withdrawal_fee'),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.9.sp,
                    ),
              ),
            ),
            Text(
              '${numberFormatWithPrecision(walletData.precision).format(paymentInterfaceWatch.minWithdrawAmount + paymentInterfaceWatch.minWithdrawFee)} - ${numberFormatWithPrecision(walletData.precision).format(paymentInterfaceWatch.maxWithdrawAmount)} ${walletData.id.toUpperCase()}',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.9.sp,
                  ),
            ),
          ],
        ),
        withLimitWithdraw
            ? Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 11.h,
                    ),
                    child: Divider(
                      height: 1.h,
                      color: isLightTheme(context)
                          ? AppColors.mainBackgroundLightColor
                          : AppColors.whiteColor.withOpacity(0.05),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Tooltip(
                        message:
                            'Withdrawal limit allowed for 24 hours'.hardcoded,
                        child: Text(
                          tr('wallet.24_hours_net_limit'),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.9.sp,
                              ),
                        ),
                      ),
                      Text(
                        '${(paymentInterfaceWatch.maxWithdrawAmount24h - paymentInterfaceWatch.withdrawAmount24h).isNegative ? 0.toStringAsFixed(walletData.precision) : numberFormatWithPrecision(walletData.precision).format(paymentInterfaceWatch.maxWithdrawAmount24h - paymentInterfaceWatch.withdrawAmount24h)} ${walletData.id.toUpperCase()}',
                        style:
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.9.sp,
                                ),
                      ),
                    ],
                  ),
                ],
              )
            : const SizedBox(),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 11.h,
          ),
          child: Divider(
            height: 1.h,
            color: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : AppColors.whiteColor.withOpacity(0.05),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Tooltip(
              message: 'Platform commission'.hardcoded,
              child: Text(
                tr('wallet.withdrawal_fee'),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.9.sp,
                    ),
              ),
            ),
            Text(
              '${numberFormatWithPrecision(walletData.precision).format(double.parse(getWithdrawFeeState.state['fee']))} ${walletData.id.toUpperCase()}',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.9.sp,
                  ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 11.h,
          ),
          child: Divider(
            height: 1.h,
            color: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : AppColors.whiteColor.withOpacity(0.05),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Tooltip(
              message:
                  'The amount you will receive as a result of your request for a withdrawal'
                      .hardcoded,
              child: Text(
                tr('wallet.net_withdrawal_amount'),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.9.sp,
                    ),
              ),
            ),
            Text(
              '${numberFormatWithPrecision(walletData.precision).format(double.parse(getNetAmount['amount']))} ${walletData.id.toUpperCase()}',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.9.sp,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}

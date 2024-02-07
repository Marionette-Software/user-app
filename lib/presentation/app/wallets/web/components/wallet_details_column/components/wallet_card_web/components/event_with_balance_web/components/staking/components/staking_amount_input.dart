import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/currency_staking_futere_provider.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/text_input_formater.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/truncate_decimals.dart';

class StakingAmountInputWeb extends HookConsumerWidget {
  const StakingAmountInputWeb({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.withTradingBalance,
    required this.isValidAmount,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String) onChanged;
  final bool withTradingBalance;
  final ValueNotifier<bool> isValidAmount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final stakingCurrencyWatch =
        ref.watch(stakingCurrencyDataStateNotifierProvider);

    final userBalance = ref
        .watch(userBalancesStateNotifierProvider)
        .firstWhere((e) => e.id == walletData.id);

    double walletBalance = withTradingBalance
        ? userBalance.balance!
        : (userBalance.balance! + userBalance.advancedTradingBalance!);

    return Focus(
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: UserAppImage(
              clipBehavior: Clip.hardEdge,
              path: walletData.iconUrl,
              width: 50.w,
              height: 50.h,
              isNetwork: true,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            walletData.id.toUpperCase(),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  letterSpacing: -1.sp,
                ),
          ),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.number,
              onFieldSubmitted: (str) {},
              controller: controller,
              inputFormatters: [
                RegExInputFormatter.withRegex(
                  '^\$|^(0|([1-9.][0-9.]{0,7}))(\\.[0-9]{0,7})?\$',
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
                fontSize: 40.sp,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
                letterSpacing: -2.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w, bottom: 3.h),
            child: Tooltip(
              message: 'Stake all available balance',
              verticalOffset: -60.h,
              child: InkWell(
                onTap: () {
                  controller.text = walletBalance
                      .truncateToDecimalPlaces(walletData.precision)
                      .toStringAsFixed(walletData.precision);

                  if (walletBalance <
                      stakingCurrencyWatch.min_staking_amount!) {
                    (stakingCurrencyWatch.locked_balance! +
                                    stakingCurrencyWatch.active_balance! >
                                0) &&
                            double.parse(controller.text) > 0
                        ? isValidAmount.value = true
                        : isValidAmount.value = false;
                  } else {
                    isValidAmount.value = true;
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
          ),
        ],
      ),
    );
  }
}

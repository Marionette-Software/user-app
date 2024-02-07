import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/exchange/exchange_state_provider.dart';
import 'package:user_app/application/swap/submit_button_state_provider.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/presentation/components/custom_drop_down_web.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/text_input_formater.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ReceiveFieldWeb extends HookConsumerWidget {
  const ReceiveFieldWeb({
    super.key,
    required this.controller,
    required this.fromController,
    required this.onChanged,
    required this.dropdownOnChanged,
    required this.items,
    required this.dropdownValue,
    required this.walletBalanceTo,
    required this.withTradingBalance,
    this.isEnabled = true,
  });

  final TextEditingController controller;
  final TextEditingController fromController;
  final Function(String) onChanged;
  final Function(Object?) dropdownOnChanged;
  final List<Currency> items;
  final String dropdownValue;
  final bool isEnabled;
  final double walletBalanceTo;
  final bool withTradingBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exchangeDataWatch = ref.watch(exchangeStateNotifierProvider);
    final submitButtonSwapWatch = ref.watch(submitButtonSwapStateProvider);
    final userBalances = ref.watch(userBalancesStateNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('wallet.receive'),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: isLightTheme(context)
                    ? Theme.of(context).primaryColor.withOpacity(0.5)
                    : AppColors.whiteColor.withOpacity(0.5),
                fontWeight: FontWeight.w600,
                fontSize: 25.sp,
                letterSpacing: -1.25.sp,
              ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: 550.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: items.length == 1
                    ? null
                    : () {
                        showGeneralDialog(
                          barrierLabel: "Label",
                          barrierDismissible: true,
                          barrierColor: AppColors.blackColor.withOpacity(0),
                          transitionDuration: const Duration(milliseconds: 200),
                          context: context,
                          pageBuilder: (context, anim1, anim2) {
                            return CustomDropDownWeb(
                              positionY: 350,
                              listCurrency: items,
                              dropdownOnChanged: dropdownOnChanged,
                              withTradingBalance: withTradingBalance,
                              userBalances: userBalances,
                              selectedItemId:
                                  exchangeDataWatch.selectedToCurrency.id,
                            );
                          },
                        );
                      },
                child: Row(
                  children: [
                    UserAppImage(
                      clipBehavior: Clip.hardEdge,
                      path: exchangeDataWatch.selectedToCurrency.iconUrl,
                      width: 50.w,
                      height: 50.h,
                      isNetwork: true,
                    ),
                    SizedBox(width: 15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          exchangeDataWatch.selectedToCurrency.id,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.sp,
                                    letterSpacing: -1.sp,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    items.length == 1
                        ? const SizedBox()
                        : Icon(
                            Icons.keyboard_arrow_down,
                            size: 25.w,
                            color: isLightTheme(context)
                                ? AppColors.darkColorText
                                : AppColors.whiteColor,
                          )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: TextFormField(
                  enabled: isEnabled,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: submitButtonSwapWatch
                        ? Theme.of(context).primaryColor.withOpacity(0.5)
                        : MainColorsApp.redColor,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                    letterSpacing: -2.sp,
                  ),
                  onChanged: onChanged,
                  enableSuggestions: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter amount';
                    }
                    return null;
                  },
                  inputFormatters: [
                    RegExInputFormatter.withRegex(
                      '^\$|^(0|([1-9.][0-9.]{0,7}))(\\.[0-9]{0,7})?\$',
                    ),
                  ],
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                  ),
                  controller: controller,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: 550.w,
          height: 5.h,
          color: isLightTheme(context)
              ? MainColorsApp.cardColor
              : AppColors.whiteColor.withOpacity(0.05),
        ),
      ],
    );
  }
}

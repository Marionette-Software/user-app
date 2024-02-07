import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/exchange/exchange_state_provider.dart';
import 'package:user_app/application/swap/submit_button_state_provider.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/components/custom_drop_down_mobile.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/text_input_formater.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ReceiveFieldSwapMobile extends HookConsumerWidget {
  const ReceiveFieldSwapMobile({
    super.key,
    required this.controller,
    required this.fromController,
    required this.onChanged,
    required this.dropdownOnChanged,
    required this.listCurrency,
    required this.dropdownValue,
    required this.walletBalanceTo,
    required this.withTradingBalance,
    this.isEnabled = true,
  });

  final TextEditingController controller;
  final TextEditingController fromController;
  final Function(String) onChanged;
  final Function(String?) dropdownOnChanged;
  final List<Currency> listCurrency;
  final String dropdownValue;
  final bool isEnabled;
  final double walletBalanceTo;
  final bool withTradingBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exchangeDataWatch = ref.watch(exchangeStateNotifierProvider);
    final submitButtonSwapWatch = ref.watch(submitButtonSwapStateProvider);
    final userBalances = ref.watch(userBalancesStateNotifierProvider);

    final widgetKey = GlobalKey();

    return Column(
      key: widgetKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Receive'.hardcoded,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: isLightTheme(context)
                    ? AppColors.aboutHeaderLight
                    : AppColors.whiteColor.withOpacity(0.5),
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                letterSpacing: -1.sp,
              ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: listCurrency.length == 1
                  ? null
                  : () {
                      RenderBox renderBox = widgetKey.currentContext!
                          .findRenderObject() as RenderBox;
                      Offset position = renderBox.localToGlobal(Offset.zero);

                      showGeneralDialog(
                        barrierLabel: "Label",
                        barrierDismissible: true,
                        barrierColor: AppColors.blackColor.withOpacity(0),
                        transitionDuration: const Duration(milliseconds: 200),
                        context: context,
                        pageBuilder: (context, anim1, anim2) {
                          return CustomDropDownMobile(
                            listCurrency: listCurrency,
                            position: position.dy,
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
                    width: 30.w,
                    height: 30..h,
                    isNetwork: true,
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        exchangeDataWatch.selectedToCurrency.id,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              letterSpacing: -0.75.sp,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  listCurrency.length == 1
                      ? const SizedBox()
                      : Icon(
                          Icons.keyboard_arrow_down,
                          size: 25.w,
                          color: isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : AppColors.whiteColor.withOpacity(0.5),
                        )
                ],
              ),
            ),
            Expanded(
              child: TextFormField(
                enabled: isEnabled,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: submitButtonSwapWatch
                      ? Theme.of(context).primaryColor.withOpacity(0.5)
                      : MainColorsApp.redColor,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                  letterSpacing: -1.25.sp,
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
                decoration: InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  filled: false,
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 11.w, bottom: 0, top: 0),
                  isCollapsed: false,
                ),
                controller: controller,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

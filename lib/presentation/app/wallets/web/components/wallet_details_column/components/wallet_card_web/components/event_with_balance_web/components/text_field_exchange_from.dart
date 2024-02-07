import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/exchange/exchange_state_provider.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/presentation/app/components/drop_down_item.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/text_input_formater.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class TextFieldExchangeFrom extends HookConsumerWidget {
  const TextFieldExchangeFrom({
    super.key,
    required this.title,
    required this.controller,
    required this.fromController,
    required this.onChanged,
    required this.dropdownOnChanged,
    required this.items,
    required this.dropdownValue,
    this.isEnabled = true,
  });

  final String title;
  final TextEditingController controller;
  final TextEditingController fromController;
  final Function(String) onChanged;
  final Function(Object?) dropdownOnChanged;
  final List<Currency> items;
  final String dropdownValue;
  final bool isEnabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exchangeDataWatch = ref.watch(exchangeStateNotifierProvider);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: isLightTheme(context)
              ? Colors.transparent
              : AppColors.whiteColor.withOpacity(0.25),
          width: 1,
        ),
        color: isLightTheme(context)
            ? cardColor
            : Theme.of(context).inputDecorationTheme.fillColor,
      ),
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 15.h,
        bottom: 10.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  enabled: isEnabled,
                  style: TextStyle(
                    color: isLightTheme(context)
                        ? Theme.of(context).primaryColorLight
                        : AppColors.whiteColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
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
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    labelText: title,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hoverColor: isLightTheme(context)
                        ? cardColor
                        : Theme.of(context).inputDecorationTheme.fillColor,
                    fillColor: isLightTheme(context)
                        ? cardColor
                        : Theme.of(context).inputDecorationTheme.fillColor,
                    labelStyle: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(
                          fontSize: 20.sp,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 20.sp,
                        ),
                    contentPadding: EdgeInsets.only(
                      bottom: 8.h,
                    ),
                    isDense: true,
                  ),
                  controller: controller,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  width: 2.w,
                  height: 34.h,
                  color: isLightTheme(context)
                      ? AppColors.placeHolderGrey
                      : AppColors.whiteColor.withOpacity(0.25),
                ),
                Expanded(
                  child: SizedBox(
                    width: 300.w,
                    height: 40.h,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            6,
                          ),
                          color: isLightTheme(context)
                              ? cardColor
                              : Theme.of(context)
                                  .inputDecorationTheme
                                  .fillColor,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            dropdownColor: isLightTheme(context)
                                ? cardColor
                                : Theme.of(context)
                                    .inputDecorationTheme
                                    .fillColor,
                            itemHeight: 100.h,
                            items: items.toSet().map((currency) {
                              return DropdownMenuItem<String>(
                                value: currency.id,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4.h,
                                  ),
                                  child: DropdownItem(
                                    iconUrl: currency.iconUrl,
                                    id: currency.id.toUpperCase(),
                                    name: currency.name,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: dropdownOnChanged,
                            hint: DropdownItem(
                              iconUrl: exchangeDataWatch
                                  .selectedFromCurrency.iconUrl,
                              id: exchangeDataWatch.selectedFromCurrency.id
                                  .toUpperCase(),
                              nameEnabled: false,
                              alignment: MainAxisAlignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

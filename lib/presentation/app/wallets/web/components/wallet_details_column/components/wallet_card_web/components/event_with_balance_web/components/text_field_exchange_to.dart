import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/presentation/app/components/drop_down_item.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/text_input_formater.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class TextFieldExchangeTo extends StatelessWidget {
  const TextFieldExchangeTo({
    super.key,
    required this.listCurrency,
    required this.title,
    required this.controller,
    required this.toValueController,
    required this.dropdownValue,
    this.isEnabled = true,
    required this.onChanged,
    this.focusInput = true,
    required this.precision,
  });

  final List<Currency> listCurrency;
  final String title;
  final TextEditingController controller;
  final TextEditingController toValueController;
  final dynamic dropdownValue;
  final bool isEnabled;
  final Function(String) onChanged;
  final bool focusInput;
  final int precision;

  @override
  Widget build(BuildContext context) {
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
        right: 22.5.w,
        top: 15.h,
        bottom: 10.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: SizedBox(
              width: 250.w,
              child: Column(
                children: [
                  TextFormField(
                    autofocus: focusInput,
                    enabled: isEnabled,
                    controller: controller,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                    keyboardType: TextInputType.number,
                    enableSuggestions: false,
                    inputFormatters: [
                      RegExInputFormatter.withRegex(
                        '^\$|^(0|([1-9.][0-9.]{0,}))(\\.[0-9]{0,})?\$',
                      ),
                      NumberTextInputFormatter(
                        decimalRange: precision,
                      ),
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hoverColor: isLightTheme(context)
                          ? cardColor
                          : Theme.of(context).inputDecorationTheme.fillColor,
                      fillColor: isLightTheme(context)
                          ? cardColor
                          : Theme.of(context).inputDecorationTheme.fillColor,
                      labelStyle: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        fontFamily: 'Inter',
                      ),
                      hintStyle:
                          Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontSize: 18.sp,
                              ),
                      labelText: title,
                      contentPadding: EdgeInsets.only(
                        bottom: 8.h,
                      ),
                      isDense: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter amount';
                      }
                      return null;
                    },
                    onChanged: onChanged,
                  ),
                ],
              ),
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
                    width: 160.w,
                    height: 40.h,
                    child: DropdownItem(
                      iconUrl: listCurrency[0].iconUrl,
                      id: listCurrency[0].id.toUpperCase(),
                      nameEnabled: false,
                      alignment: MainAxisAlignment.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

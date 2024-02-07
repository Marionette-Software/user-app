import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_currency.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/components/drop_down_item.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/text_input_formater.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ExchangeField extends HookConsumerWidget {
  const ExchangeField({
    super.key,
    required this.title,
    required this.controller,
    required this.oppositeController,
    required this.onChanged,
    required this.dropdownOnChanged,
    required this.items,
    required this.platformType,
    required this.precision,
    this.isEnabled = true,
  });

  final String title;
  final TextEditingController controller;
  final TextEditingController oppositeController;
  final Function(String) onChanged;
  final Function(Object?) dropdownOnChanged;
  final List<NonCustodialCurrency> items;
  final bool isEnabled;
  final PlatformTypeState platformType;
  final int precision;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exchangeDataWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          getSizeFromPlatformType(
            platformType: platformType,
            webValue: 10,
            tabletValue: 10,
            mobileValue: 5,
          ),
        ),
        color: isLightTheme(context)
            ? MainColorsApp.primaryOp10Color
            : AppColors.whiteColor.withOpacity(0.05),
        border: Border.all(
          color: isLightTheme(context)
              ? Colors.transparent
              : Theme.of(context).primaryColor.withOpacity(0.25),
        ),
      ),
      padding: EdgeInsets.only(
        left: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 20.w,
          tabletValue: 15.w,
          mobileValue: 11.w,
        ),
        right: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 20.w,
          tabletValue: 15.w,
          mobileValue: 11.w,
        ),
        top: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 15.h,
          tabletValue: 9.h,
          mobileValue: 8.h,
        ),
        bottom: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 10.h,
          tabletValue: 9.h,
          mobileValue: 8.h,
        ),
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
                    color: Theme.of(context).primaryColor,
                    fontSize: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 30,
                      tabletValue: 24,
                      mobileValue: 20,
                    ),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                  onChanged: onChanged,
                  enableSuggestions: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return tr('non_custodial_exchange.please_enter_amount');
                    }
                    return null;
                  },
                  inputFormatters: [
                    RegExInputFormatter.withRegex(
                      '^\$|^(0|([1-9.][0-9.]{0,7}))(\\.[0-9]{0,7})?\$',
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
                    labelText: title,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hoverColor: isLightTheme(context)
                        ? MainColorsApp.primaryOp10Color
                        : Colors.transparent,
                    fillColor: isLightTheme(context)
                        ? MainColorsApp.primaryOp10Color
                        : Colors.transparent,
                    labelStyle: TextStyle(
                      fontSize: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 18,
                        tabletValue: 18,
                        mobileValue: 10,
                      ),
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      fontFamily: 'Inter',
                    ),
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 30,
                            tabletValue: 24,
                            mobileValue: 20,
                          ),
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
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 34.h,
                    tabletValue: 25.5.h,
                    mobileValue: 22.h,
                  ),
                  color: Theme.of(context).primaryColor.withOpacity(0.25),
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
                              ? MainColorsApp.primaryOp10Color
                              : Colors.transparent,
                        ),
                        child: items.length == 1
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  UserAppImage(
                                    clipBehavior: Clip.hardEdge,
                                    path: items[0].iconUrl,
                                    width: getSizeFromPlatformType(
                                      platformType: platformType,
                                      webValue: 40.w,
                                      tabletValue: 40.w,
                                      mobileValue: 25.w,
                                    ),
                                    height: getSizeFromPlatformType(
                                      platformType: platformType,
                                      webValue: 40.h,
                                      tabletValue: 40.h,
                                      mobileValue: 25.h,
                                    ),
                                    isNetwork: true,
                                  ),
                                  SizedBox(width: 10.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: getSizeFromPlatformType(
                                          platformType: platformType,
                                          webValue: 27.h,
                                          tabletValue: 24.h,
                                          mobileValue: 15.h,
                                        ),
                                        child: AutoSizeText(
                                          items[0].id.toUpperCase(),
                                          minFontSize: 4,
                                          maxFontSize: getSizeFromPlatformType(
                                            platformType: platformType,
                                            webValue: 25,
                                            tabletValue: 20,
                                            mobileValue: 13,
                                          ),
                                          style: TextStyle(
                                            fontSize: getSizeFromPlatformType(
                                              platformType: platformType,
                                              webValue: 25,
                                              tabletValue: 20,
                                              mobileValue: 13,
                                            ),
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20.w),
                                ],
                              )
                            : DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  itemHeight: getSizeFromPlatformType(
                                    platformType: platformType,
                                    webValue: 100,
                                    tabletValue: 90,
                                    mobileValue: 70,
                                  ).h,
                                  dropdownColor: isLightTheme(context)
                                      ? cardColor
                                      : Theme.of(context)
                                          .inputDecorationTheme
                                          .fillColor,
                                  items: items.toSet().map(
                                    (currency) {
                                      return DropdownMenuItem<String>(
                                        value: currency.id,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 4.h,
                                          ),
                                          child: DropdownItem(
                                            platformType: platformType,
                                            iconUrl: currency.iconUrl,
                                            id: currency.id.toUpperCase(),
                                            name: currency.name,
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: dropdownOnChanged,
                                  hint: DropdownItem(
                                    platformType: platformType,
                                    iconUrl: exchangeDataWatch
                                        .selectedFromCurrency.iconUrl,
                                    id: exchangeDataWatch
                                        .selectedFromCurrency.id
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

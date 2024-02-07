import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/wallet/user_balance.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/capitalize.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class CustomDropDownMobile extends HookConsumerWidget {
  const CustomDropDownMobile({
    required this.listCurrency,
    required this.dropdownOnChanged,
    required this.withTradingBalance,
    required this.selectedItemId,
    required this.userBalances,
    required this.position,
    super.key,
  });

  final List<Currency> listCurrency;
  final Function(String?) dropdownOnChanged;
  final bool withTradingBalance;
  final double position;
  final String selectedItemId;
  final List<UserBalance> userBalances;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchValue = useState('');
    final ScrollController scrollController = ScrollController();

    getSearchedCurrency() {
      if (searchValue.value.isNotEmpty) {
        return listCurrency
            .where((element) =>
                capitalize(element.name)
                    .contains(capitalize(searchValue.value)) ||
                element.id
                    .toUpperCase()
                    .contains(searchValue.value.toUpperCase()) ||
                element.id
                    .toLowerCase()
                    .contains(searchValue.value.toLowerCase()))
            .toList();
      } else {
        return listCurrency;
      }
    }

    return Padding(
      padding: EdgeInsets.only(
          top: (position..h) + 25
            ..h),
      child: Align(
        alignment: Alignment.topCenter,
        child: Card(
          color: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(left: 10.w, right: 10.w),
            height: getSearchedCurrency().isEmpty
                ? (120..h)
                : getSearchedCurrency().length >= 6
                    ? (375..h)
                    : ((60..h) + getSearchedCurrency().length * 62
                      ..h),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isLightTheme(context)
                  ? AppColors.separatorLightTheme
                  : AppColors.mainBackgroundDarkColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: (value) {
                    searchValue.value = value;
                  },
                  decoration: InputDecoration(
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    hintText: tr('trade.search'),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 15.w, right: 15.w),
                      child: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        size: 20.w,
                      ),
                    ),
                    isCollapsed: true,
                    contentPadding: EdgeInsets.zero,
                    fillColor: Colors.transparent,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(
                          fontSize: 15.sp,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.75.sp,
                        ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
                Container(
                  width: double.infinity,
                  height: 2..h,
                  color: isLightTheme(context)
                      ? AppColors.whiteColor
                      : AppColors.whiteColor.withOpacity(0.05),
                ),
                getSearchedCurrency().isEmpty
                    ? Padding(
                        padding: EdgeInsets.only(top: 20..h),
                        child: Center(
                          child: Text(
                            'No matches'.hardcoded,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: isLightTheme(context)
                                      ? AppColors.aboutHeaderLight
                                      : AppColors.whiteColor.withOpacity(0.5),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp,
                                  letterSpacing: -0.75.sp,
                                ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: Scrollbar(
                          controller: scrollController,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: ListView.separated(
                              controller: scrollController,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: getSearchedCurrency().length,
                              separatorBuilder: (context, index) => Container(
                                width: double.infinity,
                                height: 2..h,
                                color: isLightTheme(context)
                                    ? AppColors.whiteColor
                                    : AppColors.whiteColor.withOpacity(0.05),
                              ),
                              itemBuilder: (context, i) {
                                var item = getSearchedCurrency()[i];

                                final balanceItem = userBalances.firstWhere(
                                  (element) => element.id == item.id,
                                );

                                double walletBalanceItem = withTradingBalance
                                    ? balanceItem.balance!
                                    : (balanceItem.balance! +
                                        balanceItem.advancedTradingBalance!);

                                return InkWell(
                                  onTap: () {
                                    dropdownOnChanged(item.id);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: item.id == selectedItemId
                                          ? isLightTheme(context)
                                              ? AppColors.whiteColor
                                                  .withOpacity(0.5)
                                              : AppColors.whiteColor
                                                  .withOpacity(0.25)
                                          : Colors.transparent,
                                      border: item.id == selectedItemId
                                          ? Border(
                                              left: BorderSide(
                                                color:
                                                    MainColorsApp.accentColor,
                                                width: 4.w,
                                              ),
                                            )
                                          : Border(
                                              left: BorderSide(
                                                color: Colors.transparent,
                                                width: 4.w,
                                              ),
                                            ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 15.w,
                                        right: 15.w,
                                        bottom: 15..h,
                                        top: 15..h,
                                      ),
                                      child: Row(
                                        children: [
                                          UserAppImage(
                                            clipBehavior: Clip.hardEdge,
                                            path: item.iconUrl,
                                            width: 34.w,
                                            height: 34..h,
                                            isNetwork: true,
                                          ),
                                          SizedBox(width: 10.w),
                                          Text(
                                            item.id,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.sp,
                                                  letterSpacing: -0.75.sp,
                                                ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            numberFormatWithPrecision(
                                                    item.precision)
                                                .format(walletBalanceItem),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  color: isLightTheme(context)
                                                      ? AppColors
                                                          .aboutHeaderLight
                                                      : AppColors.whiteColor
                                                          .withOpacity(0.5),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.sp,
                                                  letterSpacing: -0.75.sp,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

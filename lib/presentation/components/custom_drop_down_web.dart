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

class CustomDropDownWeb extends StatefulHookConsumerWidget {
  const CustomDropDownWeb({
    required this.listCurrency,
    required this.dropdownOnChanged,
    required this.withTradingBalance,
    required this.selectedItemId,
    required this.userBalances,
    required this.positionY,
    super.key,
  });

  final List<Currency> listCurrency;
  final Function(Object?) dropdownOnChanged;
  final bool withTradingBalance;
  final String selectedItemId;
  final List<UserBalance> userBalances;
  final double positionY;

  @override
  ConsumerState<CustomDropDownWeb> createState() => _CustomDropDownWebState();
}

class _CustomDropDownWebState extends ConsumerState<CustomDropDownWeb> {
  @override
  Widget build(BuildContext context) {
    final searchValue = useState('');

    getSearchedCurrency() {
      if (searchValue.value.isNotEmpty) {
        return widget.listCurrency
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
        return widget.listCurrency;
      }
    }

    return Padding(
      padding: EdgeInsets.only(top: widget.positionY.h, right: 350.w),
      child: Align(
        alignment: Alignment.topCenter,
        child: Card(
          color: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 230.w,
              minWidth: 230.w,
              maxHeight: getSearchedCurrency().isEmpty
                  ? 150.h
                  : getSearchedCurrency().length >= 6
                      ? 445.h
                      : (90.h + getSearchedCurrency().length * 60.h),
            ),
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
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      size: 25.w,
                    ),
                    fillColor: Colors.transparent,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.zero,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(
                          fontSize: 20.sp,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          letterSpacing: -1.sp,
                        ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1.sp,
                      ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 4.h,
                    color: isLightTheme(context)
                        ? AppColors.whiteColor
                        : AppColors.whiteColor.withOpacity(0.05),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Expanded(
                  child: getSearchedCurrency().isEmpty
                      ? Center(
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
                                  fontSize: 20.sp,
                                  letterSpacing: -1.sp,
                                ),
                          ),
                        )
                      : SingleChildScrollView(
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: getSearchedCurrency().length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(),
                            itemBuilder: (context, i) {
                              var item = getSearchedCurrency()[i];

                              final balanceItem =
                                  widget.userBalances.firstWhere(
                                (element) => element.id == item.id,
                              );

                              double walletBalanceItem =
                                  widget.withTradingBalance
                                      ? balanceItem.balance!
                                      : (balanceItem.balance! +
                                          balanceItem.advancedTradingBalance!);

                              return CustomDropDownItemWeb(
                                dropdownOnChanged: widget.dropdownOnChanged,
                                selectedItemId: widget.selectedItemId,
                                walletBalanceItem: walletBalanceItem,
                                item: item,
                              );
                            },
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

class CustomDropDownItemWeb extends StatefulWidget {
  const CustomDropDownItemWeb({
    required this.selectedItemId,
    required this.dropdownOnChanged,
    required this.walletBalanceItem,
    required this.item,
    super.key,
  });

  final Currency item;
  final Function(Object?) dropdownOnChanged;
  final double walletBalanceItem;
  final String selectedItemId;

  @override
  State<CustomDropDownItemWeb> createState() => _CustomDropDownItemWebState();
}

class _CustomDropDownItemWebState extends State<CustomDropDownItemWeb> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.dropdownOnChanged(widget.item.id);
      },
      onHover: (value) {
        setState(() {
          isHover = !isHover;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isHover
              ? isLightTheme(context)
                  ? AppColors.whiteColor.withOpacity(0.5)
                  : AppColors.whiteColor.withOpacity(0.25)
              : widget.item.id == widget.selectedItemId
                  ? isLightTheme(context)
                      ? AppColors.whiteColor.withOpacity(0.5)
                      : AppColors.whiteColor.withOpacity(0.25)
                  : Colors.transparent,
          border: widget.item.id == widget.selectedItemId
              ? Border(
                  left: BorderSide(
                    color: MainColorsApp.accentColor,
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
            left: 10.w,
            bottom: 5.h,
            top: 5.h,
          ),
          child: Row(
            children: [
              UserAppImage(
                clipBehavior: Clip.hardEdge,
                path: widget.item.iconUrl,
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
                    widget.item.id,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          letterSpacing: -1.sp,
                        ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    numberFormatWithPrecision(widget.item.precision)
                        .format(widget.walletBalanceItem),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : AppColors.whiteColor.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          letterSpacing: -1.sp,
                        ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

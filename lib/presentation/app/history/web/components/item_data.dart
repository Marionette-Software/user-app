import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.data.gql.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ItemHistoryDataComponent extends StatelessWidget {
  const ItemHistoryDataComponent({
    super.key,
    required this.operationType,
    required this.operationDate,
    required this.operationAmount,
    required this.operationCurrency,
    required this.isSelected,
    required this.item,
    this.sideFotTrade,
  });

  final String operationType;
  final String operationDate;
  final String operationAmount;
  final String operationCurrency;
  final bool isSelected;
  final GGetUserHistoryData_history_result item;
  final String? sideFotTrade;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isLightTheme(context)
                ? (isSelected
                    ? Theme.of(context).primaryColorLight
                    : AppColors.whiteColor)
                : (isSelected
                    ? Theme.of(context).primaryColorLight
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.25),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 21.w,
              vertical: 20.h,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 180.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      operationType == 'Exchange'
                          ? Row(
                              children: [
                                Text(
                                  operationType,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        fontSize: 20.sp,
                                        color: isSelected
                                            ? AppColors.whiteColor
                                            : Theme.of(context).primaryColor,
                                      ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                              ],
                            )
                          : operationType == 'Exchange' &&
                                  item.status == 'Exchange_Success'
                              ? Row(
                                  children: [
                                    Text(
                                      operationType,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                            fontSize: 20.sp,
                                            color: isSelected
                                                ? AppColors.whiteColor
                                                : Theme.of(context)
                                                    .primaryColor,
                                          ),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Container(
                                      width: 43.w,
                                      height: 20.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: MainColorsApp.redColor,
                                        borderRadius: BorderRadius.circular(
                                          10.h,
                                        ),
                                      ),
                                      child: Text(
                                        tr('history.sell'),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                              fontSize: 15.sp,
                                              color: AppColors.whiteColor,
                                            ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                )
                              : operationType == 'Exchange' &&
                                      item.status == 'Exchange_Canceled'
                                  ? Row(
                                      children: [
                                        Text(
                                          operationType,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .copyWith(
                                                fontSize: 20.sp,
                                                color: isSelected
                                                    ? AppColors.whiteColor
                                                    : Theme.of(context)
                                                        .primaryColor,
                                              ),
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          width: 80.w,
                                          height: 20.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: MainColorsApp.redColor,
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          child: Text(
                                            tr('history.canceled'),
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge!
                                                .copyWith(
                                                  fontSize: 15.sp,
                                                  color: AppColors.whiteColor,
                                                ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ],
                                    )
                                  : operationType == tr('wallet.trade')
                                      ? Row(
                                          children: [
                                            Text(
                                              operationType,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge!
                                                  .copyWith(
                                                    fontSize: 20.sp,
                                                    color: isSelected
                                                        ? AppColors.whiteColor
                                                        : Theme.of(context)
                                                            .primaryColor,
                                                  ),
                                              textAlign: TextAlign.start,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Container(
                                              width: 43.w,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: isSelected
                                                    ? AppColors.whiteColor
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10.r,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(2.0.w),
                                                child: Text(
                                                  sideFotTrade!,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge!
                                                      .copyWith(
                                                        fontSize: 15.sp,
                                                        color: sideFotTrade! ==
                                                                'Sell'
                                                            ? MainColorsApp
                                                                .redColor
                                                            : MainColorsApp
                                                                .greenColor,
                                                      ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : operationType == 'Deposit'
                                          ? Row(
                                              children: [
                                                Text(
                                                  operationType,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge!
                                                      .copyWith(
                                                        fontSize: 20.sp,
                                                        color: isSelected
                                                            ? AppColors
                                                                .whiteColor
                                                            : Theme.of(context)
                                                                .primaryColor,
                                                      ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
                                            )
                                          : Text(
                                              operationType,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge!
                                                  .copyWith(
                                                    fontSize: 20.sp,
                                                    color: isSelected
                                                        ? AppColors.whiteColor
                                                        : Theme.of(context)
                                                            .primaryColor,
                                                  ),
                                              textAlign: TextAlign.start,
                                            ),
                      Text(
                        operationDate,
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: 15.sp,
                                  color: isSelected
                                      ? AppColors.whiteColor
                                      : Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                ),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                operationType != 'Exchange'
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr('history.currency'),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 15.sp,
                                  color: isSelected
                                      ? AppColors.whiteColor
                                      : Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Text(
                            tr('history.amount'),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 15.sp,
                                  color: isSelected
                                      ? AppColors.whiteColor
                                      : Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Text(
                            tr('history.sell'),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 15.sp,
                                  color: isSelected
                                      ? AppColors.whiteColor
                                      : Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Text(
                            tr('history.buy'),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 15.sp,
                                  color: isSelected
                                      ? AppColors.whiteColor
                                      : Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                SizedBox(width: 10.w),
                const Spacer(),
                operationType != 'Exchange'
                    ? Column(
                        children: [
                          SizedBox(
                            width: 180.w,
                            child: Text(
                              operationCurrency,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontSize: 20.sp,
                                    color: isSelected
                                        ? AppColors.whiteColor
                                        : Theme.of(context).primaryColor,
                                  ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          operationType == 'Exchange'
                              ? Row(
                                  children: [
                                    SizedBox(
                                      width: 180.w,
                                      child: Text(
                                        item.result_currency != null &&
                                                item.result_amount != null
                                            ? abbreviateNumber(
                                                number: double.parse(
                                                    item.result_amount!),
                                                precision: item.result_currency!
                                                    .precision!,
                                              )
                                            : '0',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                              fontSize: 20.sp,
                                              color: isSelected
                                                  ? AppColors.whiteColor
                                                  : Theme.of(context)
                                                      .primaryColor,
                                            ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  width: 180.w,
                                  child: Text(
                                    operationAmount,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                          fontSize: 20.sp,
                                          color: isSelected
                                              ? AppColors.whiteColor
                                              : Theme.of(context).primaryColor,
                                        ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                transferHistory,
                                height: 31.h,
                                width: 21.w,
                                colorFilter: ColorFilter.mode(
                                  isSelected
                                      ? AppColors.whiteColor
                                      : Theme.of(context).primaryColor,
                                  BlendMode.srcATop,
                                ),
                              ),
                              SizedBox(
                                width: 11.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 180.w,
                                    child: Text(
                                      '${item.initiator_amount != null && item.initiator_amount != null ? abbreviateNumber(number: double.parse(item.initiator_amount!), precision: item.initiator_currency!.precision!) : '0'} ${item.initiator_currency!.id!.toUpperCase()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                            fontSize: 20.sp,
                                            color: isSelected
                                                ? AppColors.whiteColor
                                                : Theme.of(context)
                                                    .primaryColor,
                                          ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  SizedBox(
                                    width: 180.w,
                                    child: Text(
                                      '${item.result_currency != null && item.result_amount != null ? abbreviateNumber(number: double.parse(item.result_amount!), precision: item.result_currency!.precision!) : '0'} ${item.result_currency!.id!.toUpperCase()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                            fontSize: 20.sp,
                                            color: isSelected
                                                ? AppColors.whiteColor
                                                : Theme.of(context)
                                                    .primaryColor,
                                          ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

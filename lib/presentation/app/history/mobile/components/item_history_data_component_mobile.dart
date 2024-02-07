import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.data.gql.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ItemHistoryDataComponentMobile extends StatelessWidget {
  const ItemHistoryDataComponentMobile({
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
    return Container(
      width: double.infinity,
      height: 70..h,
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          bottom: 15..h,
          top: 15..h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  operationType == tr('history.trade')
                      ? Row(
                          children: [
                            Text(
                              operationType,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    letterSpacing: -0.75.sp,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: !isLightTheme(context)
                                        ? AppColors.whiteColor
                                        : AppColors.darkColorText,
                                  ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              width: 35.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: sideFotTrade == 'Sell'
                                    ? Theme.of(context).colorScheme.error
                                    : MainColorsApp.greenColor,
                                borderRadius: BorderRadius.circular(10.h),
                              ),
                              child: Text(
                                sideFotTrade!,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      letterSpacing: -0.5.sp,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.whiteColor,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )
                      : operationType == 'Exchange'
                          ? Row(
                              children: [
                                Text(
                                  operationType,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        letterSpacing: -0.75.sp,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: !isLightTheme(context)
                                            ? AppColors.whiteColor
                                            : AppColors.darkColorText,
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
                                          .titleSmall!
                                          .copyWith(
                                            letterSpacing: -0.75.sp,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
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
                                      height: 20..h,
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
                                            .titleSmall!
                                            .copyWith(
                                              letterSpacing: -0.5.sp,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500,
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
                                              .titleSmall!
                                              .copyWith(
                                                letterSpacing: -0.75.sp,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                                color: !isLightTheme(context)
                                                    ? AppColors.whiteColor
                                                    : AppColors.darkColorText,
                                              ),
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          height: 20..h,
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
                                                .titleSmall!
                                                .copyWith(
                                                  letterSpacing: -0.5.sp,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.whiteColor,
                                                ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ],
                                    )
                                  : operationType == 'Deposit' &&
                                          item.status == 'Collection_Errored'
                                      ? Row(
                                          children: [
                                            Text(
                                              operationType,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                    letterSpacing: -0.75.sp,
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        !isLightTheme(context)
                                                            ? AppColors
                                                                .whiteColor
                                                            : AppColors
                                                                .darkColorText,
                                                  ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                        )
                                      : Text(
                                          operationType,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                letterSpacing: -0.75.sp,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                                color: !isLightTheme(context)
                                                    ? AppColors.whiteColor
                                                    : AppColors.darkColorText,
                                              ),
                                          textAlign: TextAlign.start,
                                        ),
                  SizedBox(
                    height: 5..h,
                  ),
                  Text(
                    operationDate,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.5.sp,
                          color: isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : Colors.white.withOpacity(0.5),
                        ),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
            if (operationType == tr('history.swap'))
              SizedBox(
                width: 12.w,
                child: SvgPicture.asset(
                  swapDark,
                  colorFilter: ColorFilter.mode(
                    isLightTheme(context)
                        ? AppColors.aboutHeaderLight
                        : AppColors.whiteColor.withOpacity(0.5),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            SizedBox(
              width: 8.w,
            ),
            operationType != 'Exchange'
                ? Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        operationType == 'Exchange'
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.result_currency != null &&
                                            item.result_amount != null
                                        ? abbreviateNumber(
                                            number: double.parse(
                                                item.result_amount!),
                                            precision: item
                                                .result_currency!.precision!,
                                          )
                                        : '0',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          fontSize: 15.sp,
                                          letterSpacing: -0.75,
                                          fontWeight: FontWeight.w500,
                                          color: isLightTheme(context)
                                              ? AppColors.whiteColor
                                              : Theme.of(context).primaryColor,
                                        ),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              )
                            : Text(
                                operationAmount,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.75.sp,
                                      color: isLightTheme(context)
                                          ? AppColors.darkColorText
                                          : AppColors.whiteColor,
                                    ),
                                textAlign: TextAlign.start,
                              ),
                        SizedBox(
                          height: 5..h,
                        ),
                        Text(
                          operationCurrency,
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    letterSpacing: -0.75.sp,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: isLightTheme(context)
                                        ? AppColors.aboutHeaderLight
                                        : Colors.white.withOpacity(0.5),
                                  ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${item.initiator_amount != null && item.initiator_amount != null ? abbreviateNumber(number: double.parse(item.initiator_amount!), precision: item.initiator_currency!.precision!) : '0'} ${item.initiator_currency!.id!.toUpperCase()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontSize: 15.sp,
                                      letterSpacing: -0.75.sp,
                                      fontWeight: FontWeight.w500,
                                      color: isSelected
                                          ? AppColors.whiteColor
                                          : Theme.of(context).primaryColor,
                                    ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                height: 4..h,
                              ),
                              Text(
                                '${item.result_currency != null && item.result_amount != null ? abbreviateNumber(number: double.parse(item.result_amount!), precision: item.result_currency!.precision!) : '0'} ${item.result_currency!.id!.toUpperCase()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.75.sp,
                                      color: isSelected
                                          ? AppColors.whiteColor
                                          : Theme.of(context).primaryColor,
                                    ),
                                textAlign: TextAlign.start,
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
    );
  }
}

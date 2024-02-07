import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/trade/user_orders/user_order.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/capitalize.dart';
import 'package:user_app/presentation/helpers/formatters/format_date.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';

class OpenOrdersItemWeb extends HookConsumerWidget {
  const OpenOrdersItemWeb({
    super.key,
    required this.item,
    required this.onTap,
  });

  final UserOrderItem item;
  final Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
        left: 25.w,
        right: 15.w,
        top: 12.5.h,
        bottom: 12.5.h,
      ),
      child: Container(
        width: 1404.w,
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            width: 1.w,
            color: Theme.of(context).primaryColor.withOpacity(0.25),
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: 62.w,
            ),
            child: Table(
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: SizedBox(
                        width: 120.w,
                        child: Text(
                          formatShortTwoRowsDate(item.date),
                          maxLines: 2,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -1.sp,
                                  ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: SizedBox(
                        width: 110.w,
                        child: Text(
                          '${item.market.split('-')[0].toUpperCase()}/${item.market.split('-')[1].toUpperCase()}',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -1.sp,
                                  ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: SizedBox(
                        width: 34.w,
                        child: Text(
                          capitalize(item.side),
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -1.sp,
                                    color: item.side == 'sell'
                                        ? Theme.of(context).colorScheme.error
                                        : MainColorsApp.greenColor,
                                  ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: SizedBox(
                        width: 42.w,
                        child: Text(
                          capitalize(item.type),
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -1.sp,
                                  ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: SizedBox(
                        width: 109.w,
                        child: Text(
                          numberFormatWithPrecision(item.marketItem.tradingPricePrecision!).format(item.price),
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -1.sp,
                                  ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: SizedBox(
                        width: 119.w,
                        child: Text(
                          abbreviateNumber(
                            number: item.amount,
                            precision: item.marketItem.tradingAmountPrecision!,
                          ),
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -1.sp,
                                  ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: SizedBox(
                        width: 109.w,
                        child: Text(
                          abbreviateNumber(
                            number: item.price * item.amount,
                            precision: item.marketItem.quoteCurrencyPrecision!,
                          ),
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -1.sp,
                                  ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        '${((100 * item.total) / item.amount).toStringAsFixed(2)}%',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -1.sp,
                            ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Tooltip(
                            message: 'Cancel order'.hardcoded,
                            verticalOffset: -60.h,
                            child: InkWell(
                              onTap: onTap,
                              child: SvgPicture.asset(
                                closeOrderIcon,
                                width: 25.w,
                                height: 25.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/trade/user_orders/user_order.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/capitalize.dart';
import 'package:user_app/presentation/helpers/formatters/format_date.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';

class MarketOpenOrderItemWeb extends HookConsumerWidget {
  const MarketOpenOrderItemWeb({
    super.key,
    required this.item,
    required this.onTap,
  });

  final UserOrderItem item;
  final Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);

    return Padding(
      padding: EdgeInsets.only(
        right: 25.w,
        left: 25.w,
      ),
      child: Container(
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            width: 1.w,
            color: AppColors.mainBackgroundLightColor,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 17.w,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 76.w,
                child: Text(
                  formatShortDate(item.date),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
              SizedBox(
                width: 132.w,
                child: Text(
                  textAlign: TextAlign.start,
                  '${item.market.split('-')[0].toUpperCase()}/${item.market.split('-')[1].toUpperCase()}',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
              SizedBox(
                width: 40.w,
                child: Text(
                  capitalize(item.side),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                        color: item.side == 'sell'
                            ? Theme.of(context).colorScheme.error
                            : MainColorsApp.greenColor,
                      ),
                ),
              ),
              SizedBox(
                width: 40.w,
                child: Text(
                  capitalize(item.type),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
              SizedBox(
                width: 105.w,
                child: Text(
                  numberFormatWithPrecision(
                          marketDataWatch.trading_price_precision)
                      .format(item.price),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
              SizedBox(
                width: 105.w,
                child: Text(
                  abbreviateNumber(
                    number: item.amount,
                    precision: marketDataWatch.trading_amount_precision,
                  ),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
              SizedBox(
                width: 105.w,
                child: Text(
                  abbreviateNumber(
                    number: item.price * item.amount,
                    precision: marketDataWatch.quote_currency.precision,
                  ),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
              SizedBox(
                width: 75.w,
                child: Text(
                  '${((100 * item.total) / item.amount).toStringAsFixed(2)}%',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
              Tooltip(
                message: 'Cancel'.hardcoded,
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
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
      ),
    );
  }
}

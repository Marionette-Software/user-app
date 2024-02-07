import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:slide_action/slide_action.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/tranding_tab_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/trade/order_type.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/order_inputs/amount_input.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/order_inputs/market_price_container.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/order_inputs/price_input.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/order_inputs/total_input.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/persents_selector/components/order_selector_item.dart';
import 'package:user_app/presentation/auth/authentication.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class UnauthorizedTradeBuySellMobileScreen extends HookConsumerWidget {
  const UnauthorizedTradeBuySellMobileScreen({
    this.tradingTabWatch,
    required this.priceController,
    required this.amountController,
    required this.totalController,
    super.key,
  });

  final int? tradingTabWatch;
  final TextEditingController priceController;
  final TextEditingController amountController;
  final TextEditingController totalController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketOrLimitProviderWatch = ref.watch(marketOrLimitProvider);
    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);

    final active = useState(false);
    final tradingTabWatch = ref.watch(tradingTabProvider);

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          children: [
            Column(
              children: [
                const SizedBox.shrink(),
                SizedBox(
                  height: 48..h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tr('trade.available'),
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 15.sp,
                                    color: isLightTheme(context)
                                        ? AppColors.aboutHeaderLight
                                        : AppColors.whiteColor.withOpacity(0.5),
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        const Spacer(),
                        Text(
                          '${0.toStringAsFixed(marketDataWatch.base_currency.precision)} ${marketDataWatch.base_currency.id.toUpperCase()}',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 15.sp,
                                    color: isLightTheme(context)
                                        ? AppColors.aboutHeaderLight
                                        : AppColors.whiteColor.withOpacity(0.5),
                                    fontWeight: FontWeight.w500,
                                  ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: marketOrLimitProviderWatch == OrderType.limit
                      ? PriceInput(
                          platformType: PlatformTypeState.mobile,
                          priceController: priceController,
                          totalController: totalController,
                          amountController: amountController,
                        )
                      : const MarketPriceContainer(
                          platformType: PlatformTypeState.mobile,
                        ),
                ),
                Container(
                  height: 5..h,
                  width: double.infinity,
                  color: isLightTheme(context)
                      ? AppColors.mainBackgroundLightColor
                      : Colors.white.withOpacity(0.05),
                  margin: EdgeInsets.only(
                    left: 30.w,
                    right: 30.w,
                    top: 8..h,
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 22..h,
        ),
        Column(
          children: [
            SizedBox(
              height: 48..h,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 30.w,
                  right: 30.w,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OrderSelectorItem(
                        platformType: PlatformTypeState.mobile,
                        onTap: () {},
                        active: false,
                        title: '25%',
                      ),
                      OrderSelectorItem(
                        platformType: PlatformTypeState.mobile,
                        onTap: () {},
                        active: false,
                        title: '50%',
                      ),
                      OrderSelectorItem(
                        platformType: PlatformTypeState.mobile,
                        onTap: () {},
                        active: false,
                        title: '75%',
                      ),
                      OrderSelectorItem(
                        platformType: PlatformTypeState.mobile,
                        onTap: () {},
                        active: false,
                        title: '100%',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15..h,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                right: 30.w,
              ),
              child: AmountInput(
                platformType: PlatformTypeState.mobile,
                priceController: priceController,
                totalController: totalController,
                amountController: amountController,
                active: active,
              ),
            ),
            Container(
              height: 5..h,
              width: double.infinity,
              color: isLightTheme(context)
                  ? AppColors.mainBackgroundLightColor
                  : Colors.white.withOpacity(0.05),
              margin: EdgeInsets.only(
                left: 30.w,
                right: 30.w,
                top: 8..h,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 31..h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 30.w),
          child: TotalInput(
            platformType: PlatformTypeState.mobile,
            currencyId: marketDataWatch.quote_currency.id,
            totalController: totalController,
            priceController: priceController,
            amountController: amountController,
          ),
        ),
        Container(
          height: 5..h,
          width: double.infinity,
          color: isLightTheme(context)
              ? AppColors.mainBackgroundLightColor
              : Colors.white.withOpacity(0.05),
          margin: EdgeInsets.only(
            left: 30.w,
            right: 30.w,
            top: 8..h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 28..h,
            left: 30.w,
            right: 30.w,
          ),
          child: SlideAction(
            trackHeight: 50..h,
            trackBuilder: (context, state) {
              return Container(
                margin: EdgeInsets.only(top: 3..h, bottom: 3..h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: (tradingTabWatch == 2
                      ? MainColorsApp.redColor.withOpacity(0.5)
                      : MainColorsApp.greenColor.withOpacity(0.5)),
                ),
                child: Center(
                  child: Text(
                    tradingTabWatch == 1
                        ? "Swipe to buy ${marketDataWatch.base_currency.id}"
                        : "Swipe to sell ${marketDataWatch.base_currency.id}",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.75.sp,
                          color: Colors.white,
                        ),
                  ),
                ),
              );
            },
            thumbBuilder: (context, state) {
              return Container(
                height: 50..h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: (tradingTabWatch == 2
                      ? MainColorsApp.redColor
                      : MainColorsApp.greenColor),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    height: 22..h,
                    width: 22.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              );
            },
            action: () {
              context.go(Authentication.routeName);
            },
          ),
        ),
      ],
    );
  }
}

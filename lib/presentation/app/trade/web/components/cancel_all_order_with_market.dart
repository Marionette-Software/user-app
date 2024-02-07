// ignore_for_file: use_build_context_synchronously
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/user_orders/user_order_future_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/infrastructure/trade/trade_service.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class CancelAllOrderWithMarket extends HookConsumerWidget {
  const CancelAllOrderWithMarket({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeMarketWatch = ref.watch(selectMarketsNotifierProvider);
    final marketOrdersRead = ref.read(marketOrdersNotifierProvider.notifier);

    final loaderState = useState(LoadState.notLoading);

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 600.w,
        child: Padding(
          padding: EdgeInsets.only(
            top: 35.h,
            bottom: 50.h,
            left: 25.w,
            right: 25.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Confirmation'.hardcoded,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1.5.sp,
                    ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                'Do you want cancel all open orders\non ${activeMarketWatch.id.replaceAll('-', '/').toUpperCase()} market?'
                    .hardcoded,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -1.sp,
                      color: isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.5),
                    ),
              ),
              SizedBox(
                height: 25.h,
              ),
              loaderState.value == LoadState.loading
                  ? const CircularProgressIndicator()
                  : InkWell(
                      onTap: () async {
                        loaderState.value = LoadState.loading;
                        ITradeService service = TradeService();
                        var res =
                            await service.cancelAllOrder(activeMarketWatch.id);

                        if (res is GraphQlError) {
                          final snackBar = SnackBar(
                            elevation: 0,
                            clipBehavior: Clip.none,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              titleFontSize: 30.sp,
                              messageFontSize: 20.sp,
                              title: tr('snack_bar_message.errors.error'),
                              message: res.message,
                              contentType: ContentType.failure,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                          context.pop();
                        } else {
                          marketOrdersRead.updateMarketOrdersData([]);
                          final snackBar = SnackBar(
                            elevation: 0,
                            clipBehavior: Clip.none,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              titleFontSize: 30.sp,
                              messageFontSize: 20.sp,
                              title: tr('snack_bar_message.success.success'),
                              message: 'Success canceled all orders'.hardcoded,
                              contentType: ContentType.success,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                          context.pop();
                        }
                      },
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        width: double.infinity,
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: MainColorsApp.accentColor,
                        ),
                        child: Center(
                          child: Text(
                            'Yes, cancel all'.hardcoded,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -1.sp,
                                  color: AppColors.whiteColor,
                                ),
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 25.h,
              ),
              loaderState.value == LoadState.loading
                  ? const SizedBox()
                  : InkWell(
                      onTap: () {
                        context.pop();
                      },
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        width: double.infinity,
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            width: 1.w,
                            color: MainColorsApp.accentColor,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'No, go back'.hardcoded,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -1.sp,
                                  color: MainColorsApp.accentColor,
                                ),
                          ),
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

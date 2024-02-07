import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:user_app/application/trade/actions/open_orders_actions.dart';
import 'package:user_app/application/trade/user_orders/user_order_future_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/trade/order_req.dart';
import 'package:user_app/presentation/app/components/empty_container.dart';
import 'package:user_app/presentation/app/user_orders/user_orders.dart';
import 'package:user_app/presentation/app/user_orders/web/components/open_user_orders/componets/header_table_order_open.dart';
import 'package:user_app/presentation/app/user_orders/web/components/open_user_orders/componets/open_orders_item.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class OpenOrdersWeb extends StatefulHookConsumerWidget {
  const OpenOrdersWeb({super.key});

  @override
  ConsumerState<OpenOrdersWeb> createState() => _OpenOrdersWebWebState();
}

class _OpenOrdersWebWebState extends ConsumerState<OpenOrdersWeb> {
  NumberPaginatorController controller = NumberPaginatorController();
  TextEditingController pageInputController = TextEditingController();

  int pageValue = 1;
  int limit = 5;
  bool outsideOfBounds = false;
  bool loading = false;
  int totalOrders = 0;
  List<String> dropDownItems = ['5', '10', '15', '20', '25'];

  @override
  void initState() {
    super.initState();
    pageInputController.addListener(() {
      if (pageInputController.text.isNotEmpty) {
        if (int.parse(pageInputController.text) > 0 &&
            int.parse(pageInputController.text) <= totalOrders) {
          if (outsideOfBounds) {
            setState(() => outsideOfBounds = false);
          }
          controller.navigateToPage(int.parse(pageInputController.text) - 1);
        } else {
          if (!outsideOfBounds) {
            setState(() => outsideOfBounds = true);
          }
        }
      }
    });
    context.afterBuild(() {
      ref.watch(ordersTotalNotifierProvider.notifier).setDivider(limit);
    });
  }

  @override
  Widget build(BuildContext context) {
    final refreshValue = useState(1);
    final userOrders = ref.watch(
      orderFutureProvider(
        OrderReqData(
          market: '',
          status: 'open',
          refresh: '${refreshValue.value}',
          page: pageValue,
          limit: limit,
        ),
      ),
    );

    final userOrdersRead = ref.read(ordersNotifierProvider.notifier);
    final userOrdersWatch = ref.watch(ordersNotifierProvider);

    totalOrders = ref.watch(ordersTotalNotifierProvider);

    return Column(
      children: [
        const HeaderTableOrderOpenWeb(),
        userOrders.when(
          data: (data) {
            context.afterBuild(() {
              setState(() => loading = false);
            });
            if (userOrdersWatch.isEmpty) {
              return SizedBox(
                height: 520.h,
                child: Center(
                  child: EmptyContainerWeb(
                    title: tr('trade.no_trade_info'),
                  ),
                ),
              );
            } else {
              return Column(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: SizedBox(
                        height: 520.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: userOrdersWatch.length,
                          itemBuilder: (context, i) {
                            var item = userOrdersWatch[i];
                            return OpenOrdersItemWeb(
                              item: item,
                              onTap: () async {
                                OpenOrdersGeneral openOrders =
                                    OpenOrdersGeneral();
                                openOrders.cancelOrder(id: item.id).then(
                                  (res) {
                                    if (res) {
                                      userOrdersWatch.removeWhere(
                                        (element) => element.id == item.id,
                                      );

                                      userOrdersRead.updateUserOrdersData(
                                          userOrdersWatch);

                                      if (!context.mounted) return;

                                      final snackBar = SnackBar(
                                        elevation: 0,
                                        clipBehavior: Clip.none,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                          titleFontSize: 30.sp,
                                          messageFontSize: 20.sp,
                                          title: tr(
                                              'snack_bar_message.success.success'),
                                          message: tr(
                                              'snack_bar_message.success.success_delete_order'),
                                          contentType: ContentType.success,
                                        ),
                                      );

                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(snackBar);
                                      context.go(UserOrders.routeName);
                                    } else if (res is GraphQlError) {
                                      if (!context.mounted) return;

                                      final snackBar = SnackBar(
                                        elevation: 0,
                                        clipBehavior: Clip.none,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                          titleFontSize: 30.sp,
                                          messageFontSize: 20.sp,
                                          title: tr(
                                              'snack_bar_message.errors.error'),
                                          message: res.message,
                                          contentType: ContentType.failure,
                                        ),
                                      );

                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(snackBar);
                                    }
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
          error: (error, _) => UserAppError(
            errorMessage: error.toString(),
          ),
          loading: () {
            context.afterBuild(() {
              setState(() => loading = true);
            });
            return SizedBox(height: 520.h, child: const MainLoader());
          },
        ),
        if (totalOrders > 0)
          Padding(
            padding: EdgeInsets.only(top: 45.h),
            child: IgnorePointer(
              ignoring: loading,
              child: Opacity(
                opacity: loading ? 0.5 : 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        width: 569.w,
                        height: 50.h,
                        child: NumberPaginator(
                          numberPages: totalOrders,
                          controller: controller,
                          onPageChange: (int index) {
                            setState(() {
                              pageValue = index + 1;
                              // pageInputController.text = pageValue.toString();
                            });
                          },
                          config: NumberPaginatorUIConfig(
                            height: 50.h,
                            buttonShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.r),
                              ),
                            ),
                            buttonUnselectedForegroundColor:
                                isLightTheme(context)
                                    ? AppColors.darkColorText
                                    : AppColors.whiteColor,
                            buttonSelectedBackgroundColor:
                                MainColorsApp.accentColor,
                            buttonSelectedForegroundColor: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 81.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Go to",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -1.sp,
                                ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          SizedBox(
                            width: 45.w,
                            height: 45.h,
                            child: TextField(
                              controller: pageInputController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -1.sp,
                                    color: outsideOfBounds
                                        ? isLightTheme(context)
                                            ? AppColors.darkColorText
                                                .withOpacity(0.5)
                                            : AppColors.whiteColor
                                                .withOpacity(0.5)
                                        : isLightTheme(context)
                                            ? AppColors.darkColorText
                                            : AppColors.whiteColor,
                                  ),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                fillColor: isLightTheme(context)
                                    ? AppColors.mainBackgroundLightColor
                                    : AppColors.whiteColor.withOpacity(0.05),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            "page",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -1.sp,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 81.w,
                      ),
                      Container(
                        width: 149.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: isLightTheme(context)
                              ? AppColors.mainBackgroundLightColor
                              : AppColors.whiteColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            elevation: 0,
                            value: limit.toString(),
                            isExpanded: true,
                            focusColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(10.r),
                            dropdownColor: isLightTheme(context)
                                ? AppColors.mainBackgroundLightColor
                                : Theme.of(context)
                                    .inputDecorationTheme
                                    .fillColor,
                            icon: Padding(
                              padding: EdgeInsets.only(right: 18.w),
                              child: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Theme.of(context).primaryColor,
                                size: 25.w,
                              ),
                            ),
                            items: dropDownItems.toSet().map((item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  "$item / page",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        fontSize: 20.sp,
                                        letterSpacing: -1.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              );
                            }).toList(),
                            selectedItemBuilder: (BuildContext context) {
                              return dropDownItems
                                  .toSet()
                                  .map<Widget>((String item) {
                                return Center(
                                  child: Text(
                                    "$item / page",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontSize: 20.sp,
                                          letterSpacing: -1.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                );
                              }).toList();
                            },
                            onChanged: (value) {
                              var newLimit = int.parse(value!);
                              if (newLimit != limit) {
                                limit = newLimit;
                                ref
                                    .watch(ordersTotalNotifierProvider.notifier)
                                    .setDivider(limit);
                                pageValue = 1;
                                pageInputController.clear();
                                refreshValue.value = refreshValue.value + 1;
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

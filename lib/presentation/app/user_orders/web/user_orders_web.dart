import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/order_state_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/trade/order_state.dart';
import 'package:user_app/presentation/app/components/header_web/header_web.dart';
import 'package:user_app/presentation/app/user_orders/web/components/orders_user_history/user_orders_history_web.dart';
import 'package:user_app/presentation/app/user_orders/web/components/open_user_orders/open_orders.dart';
import 'package:user_app/presentation/auth/web/components/footer_components/footer.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class UserOrderWeb extends HookConsumerWidget {
  const UserOrderWeb({
    Key? key,
    this.platformType = PlatformTypeState.web,
  }) : super(key: key);

  final PlatformTypeState platformType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userOrderStateWatch = ref.watch(userOrderStateProvider);
    final userOrderStateRead = ref.read(userOrderStateProvider.notifier);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          60.h,
        ),
        child: const HeaderWeb(),
      ),
      body: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: isLightTheme(context)
                ? const DecorationImage(
                    image: AssetImage(bgInner),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 50.h,
                    left: 103.w,
                    right: 103.w,
                  ),
                  child: Container(
                    width: 1454.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          isLightTheme(context)
                              ? AppColors.whiteColor
                              : AppColors.whiteColor.withOpacity(0.1),
                          isLightTheme(context)
                              ? AppColors.whiteColor
                              : AppColors.whiteColor.withOpacity(0),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: platformType == PlatformTypeState.web
                                ? 87.w
                                : 0,
                            top: 45.h,
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  userOrderStateRead.state =
                                      UserOrderState.userOpenOrders;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: userOrderStateWatch ==
                                            UserOrderState.userOpenOrders
                                        ? Border(
                                            bottom: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColorLight,
                                              width: 3.h,
                                            ),
                                          )
                                        : const Border(),
                                  ),
                                  padding: EdgeInsets.only(bottom: 4.h),
                                  child: Text(
                                    tr('trade.open_orders'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -1.sp,
                                          color: userOrderStateWatch ==
                                                  UserOrderState.userOpenOrders
                                              ? Theme.of(context)
                                                  .primaryColorLight
                                              : Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(
                                                    isLightTheme(context)
                                                        ? 0.5
                                                        : 1,
                                                  ),
                                        ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 36.w,
                              ),
                              InkWell(
                                onTap: () {
                                  userOrderStateRead.state =
                                      UserOrderState.userOrdersHistory;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: userOrderStateWatch ==
                                            UserOrderState.userOrdersHistory
                                        ? Border(
                                            bottom: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColorLight,
                                              width: 3.h,
                                            ),
                                          )
                                        : const Border(),
                                  ),
                                  padding: EdgeInsets.only(bottom: 4.h),
                                  child: Text(
                                    tr('trade.orders_history'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -1.sp,
                                          color: userOrderStateWatch ==
                                                  UserOrderState
                                                      .userOrdersHistory
                                              ? Theme.of(context)
                                                  .primaryColorLight
                                              : Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(
                                                    isLightTheme(context)
                                                        ? 0.5
                                                        : 1,
                                                  ),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 50.h),
                          child: userOrderStateWatch ==
                                  UserOrderState.userOpenOrders
                              ? const OpenOrdersWeb()
                              : const UserOrdersHistoryWeb(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 57.h,
                ),
                const FooterWeb(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

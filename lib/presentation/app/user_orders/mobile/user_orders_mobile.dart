import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/presentation/app/user_orders/mobile/components/orders_switche.dart';
import 'package:user_app/presentation/app/user_orders/mobile/components/orders_user_history/orders_user_history.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'components/open_user_order/open_user_orders_mobile.dart';

class UserProfileOrdersMobile extends StatefulHookConsumerWidget {
  const UserProfileOrdersMobile({super.key});

  @override
  ConsumerState<UserProfileOrdersMobile> createState() =>
      _UserProfileOrdersMobileState();
}

class _UserProfileOrdersMobileState
    extends ConsumerState<UserProfileOrdersMobile> {
  int page = 0;
  String orders = tr('profile.open_orders');
  String history = tr('profile.orders_history');

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundDarkColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          50..h,
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 15..h, left: 25.w, right: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BackButtonMobile(
                  onTap: () {
                    context.pop();
                  },
                ),
                Text(
                  tr('profile.orders'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 15.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75,
                      ),
                  textAlign: TextAlign.center,
                ),
                IgnorePointer(
                  child: Opacity(
                    opacity: 0,
                    child: MobileGenericButton(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      onTap: () {},
                      child: Text(
                        tr('history.reset_btn'),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 13.sp,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.65.sp,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(
          top: 10..h,
        ),
        decoration: BoxDecoration(
          color: isLightTheme(context)
              ? AppColors.whiteColor
              : walletBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20..h,
            ),
            OrdersSwitchMobile(
              options: [orders, history],
              changeType: (index) {
                setState(() {
                  page = index;
                });
              },
            ),
            SizedBox(
              height: 5..h,
            ),
            Expanded(
              child: Container(
                child: page == 0
                    ? const OpenUserOrdersMobile()
                    : const UserOrdersHistoryMobile(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

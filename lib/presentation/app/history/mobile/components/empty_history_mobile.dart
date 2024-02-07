import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/filter/filter_operations_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/navigation_bar/bottom_navigation_index.dart';
import 'package:user_app/presentation/app/profile/mobile/components/referrals_user/referrals_user_mobile.dart';
import 'package:user_app/presentation/app/trade/trade.dart';
import 'package:user_app/presentation/app/wallets/wallets.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class EmptyHistoryComponentMobile extends HookConsumerWidget {
  const EmptyHistoryComponentMobile({
    required this.withNavBar,
    super.key,
  });

  final bool withNavBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterOperationsWatch = ref.watch(filterOperationsStateProvider);

    var box =
        Hive.box<BottomNavigationIndexData>(Constants.bottomNavigationIndex);

    Widget getEmptyType() {
      if (filterOperationsWatch.id == 'custodial_deposit|deposit') {
        return EmptyHistoryComponentColumMobile(
          onTap: () {
            box.putAt(0, BottomNavigationIndexData(selectedIndex: 0));
            context.go(Wallets.routeName);
          },
          title: 'No deposit operations yet',
          subTitle: 'Deposit now',
        );
      } else if (filterOperationsWatch.id == 'custodial_withdrawal') {
        return EmptyHistoryComponentColumMobile(
          onTap: () {
            box.putAt(0, BottomNavigationIndexData(selectedIndex: 0));
            context.go(Wallets.routeName);
          },
          title: 'No withdrawal operations yet',
          subTitle: 'Withdraw now',
        );
      } else if (filterOperationsWatch.id == 'exchange') {
        return EmptyHistoryComponentColumMobile(
          onTap: () {
            box.putAt(0, BottomNavigationIndexData(selectedIndex: 0));
            context.go(Wallets.routeName);
          },
          title: 'No swap operations yet',
          subTitle: 'Swap now',
        );
      } else if (filterOperationsWatch.id == 'trading') {
        return EmptyHistoryComponentColumMobile(
          onTap: () {
            box.putAt(0, BottomNavigationIndexData(selectedIndex: 1));
            context.go(Trade.routeName);
          },
          title: 'No trade operations yet',
          subTitle: 'Trade now',
        );
      } else if (filterOperationsWatch.id == 'staking_rewards') {
        return EmptyHistoryComponentColumMobile(
          onTap: () {
            box.putAt(0, BottomNavigationIndexData(selectedIndex: 0));
            context.go(Wallets.routeName);
          },
          title: 'No staking operations yet',
          subTitle: 'Stake now',
        );
      } else if (filterOperationsWatch.id == 'deposit_reward|trade_reward') {
        return EmptyHistoryComponentColumMobile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => const ReferralsUserMobile(),
              ),
            );
          },
          title: 'No referral operations yet',
          subTitle: 'Invite friends',
        );
      } else {
        return const EmptyHistoryComponentColumMobile(
          onTap: null,
          title: 'No transaction history',
          subTitle:
              'Deposit, swap, buy, sell, trade or transfer\nand make history!',
        );
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10..w,
        vertical: 10..h,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: isLightTheme(context)
                  ? AppColors.whiteColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30..h,
                  ),
                  SvgPicture.asset(
                    emptyIcon,
                    width: 36.w,
                    height: 50..h,
                    colorFilter: ColorFilter.mode(
                      isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.25),
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(
                    height: 35..h,
                  ),
                  getEmptyType()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyHistoryComponentColumMobile extends StatelessWidget {
  const EmptyHistoryComponentColumMobile({
    required this.title,
    required this.subTitle,
    this.onTap,
    super.key,
  });

  final String title;
  final String subTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: -1.sp,
              ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 35..h,
        ),
        onTap == null
            ? Text(
                subTitle,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.75.sp,
                    ),
                textAlign: TextAlign.center,
              )
            : InkWell(
                borderRadius: BorderRadius.circular(25.r),
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                    color: MainColorsApp.accentColor,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  width: double.infinity,
                  height: 45..h,
                  child: Center(
                    child: Text(
                      subTitle,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.75.sp,
                                color: AppColors.whiteColor,
                              ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}

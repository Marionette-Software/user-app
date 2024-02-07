import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/filter/filter_operations_provider.dart';
import 'package:user_app/presentation/app/profile/web/components/referral_user.dart/referral_user_web.dart';
import 'package:user_app/presentation/app/trade/trade.dart';
import 'package:user_app/presentation/app/wallets/wallets.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class EmptyHistoryComponent extends HookConsumerWidget {
  const EmptyHistoryComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterOperationsWatch = ref.watch(filterOperationsStateProvider);

    Widget getEmptyType() {
      if (filterOperationsWatch.id == 'custodial_deposit|deposit') {
        return EmptyHistoryComponentColum(
          onTap: () {
            context.go(Wallets.routeName);
          },
          title: 'No deposit operations yet',
          subTitle: 'Deposit now',
        );
      } else if (filterOperationsWatch.id == 'custodial_withdrawal') {
        return EmptyHistoryComponentColum(
          onTap: () {
            context.go(Wallets.routeName);
          },
          title: 'No withdrawal operations yet',
          subTitle: 'Withdraw now',
        );
      } else if (filterOperationsWatch.id == 'exchange') {
        return EmptyHistoryComponentColum(
          onTap: () {
            context.go(Wallets.routeName);
          },
          title: 'No swap operations yet',
          subTitle: 'Swap now',
        );
      } else if (filterOperationsWatch.id == 'trading') {
        return EmptyHistoryComponentColum(
          onTap: () {
            context.go(Trade.routeName);
          },
          title: 'No trade operations yet',
          subTitle: 'Trade now',
        );
      } else if (filterOperationsWatch.id == 'staking_rewards') {
        return EmptyHistoryComponentColum(
          onTap: () {
            context.go(Wallets.routeName);
          },
          title: 'No staking operations yet',
          subTitle: 'Stake now',
        );
      } else if (filterOperationsWatch.id == 'deposit_reward|trade_reward') {
        return EmptyHistoryComponentColum(
          onTap: () {
            context.go(ReferralUserWeb.routeName);
          },
          title: 'No referral operations yet',
          subTitle: 'Invite friends',
        );
      } else {
        return const EmptyHistoryComponentColum(
          onTap: null,
          title: 'No transaction history',
          subTitle:
              'Deposit, swap, buy, sell, trade or transfer\nand make history!',
        );
      }
    }

    return Container(
      alignment: Alignment.center,
      width: 600.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 93.h),
          SvgPicture.asset(
            emptyIcon,
            colorFilter: ColorFilter.mode(
              isLightTheme(context)
                  ? AppColors.aboutHeaderLight
                  : AppColors.whiteColor.withOpacity(0.25),
              BlendMode.srcIn,
            ),
          ),
          SizedBox(
            height: 41.h,
          ),
          getEmptyType()
        ],
      ),
    );
  }
}

class EmptyHistoryComponentColum extends StatelessWidget {
  const EmptyHistoryComponentColum({
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
          height: 50.h,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(25.r),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              subTitle,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1.sp,
                    color: onTap == null
                        ? isLightTheme(context)
                            ? AppColors.darkColorText
                            : AppColors.whiteColor
                        : MainColorsApp.accentColor,
                    decoration: onTap == null ? null : TextDecoration.underline,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

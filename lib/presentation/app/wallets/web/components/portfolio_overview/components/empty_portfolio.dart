import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/app/wallets/web/components/portfolio_overview/components/empty_portfolio_item.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class EmptyPortfolio extends HookConsumerWidget {
  const EmptyPortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletDataStateNotifierProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: 283.w,
                height: 283.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  emptyPieChart,
                  colorFilter: ColorFilter.mode(
                    getWalletColor(
                      walletState.lightBgColor1,
                      walletState.darkBgColor1,
                      isLightTheme(context),
                    ).withOpacity(0.25),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$0.00',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -1.5.sp,
                          fontStyle: FontStyle.normal,
                        ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    tr('wallet.total_value'),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -1.sp,
                          fontStyle: FontStyle.normal,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 27.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Make a deposit or buy\nto unlock portfolio',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 20.sp,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1.sp,
                    fontStyle: FontStyle.normal,
                  ),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              width: 250.w,
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(
                  height: 25.h,
                ),
                itemCount: 5,
                itemBuilder: (context, i) {
                  return const EmptyPortfolioItem(
                    withEmptyPortfolio: true,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

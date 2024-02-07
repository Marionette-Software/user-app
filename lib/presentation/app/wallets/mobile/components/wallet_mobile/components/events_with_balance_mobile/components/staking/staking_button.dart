import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/staking/staking_form.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';

class StakeButtonMobile extends HookConsumerWidget {
  const StakeButtonMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StakingFormMobile(),
          ),
        );
      },
      child: Container(
        width: 74.w,
        height: 42..h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            width: 1.w,
            color: AppColors.whiteColor,
          ),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                stakeWalletIcon,
                height: 16..h,
                width: 16.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.whiteColor,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'Stake'.hardcoded,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor,
                      fontSize: 13.sp,
                      letterSpacing: -0.65.sp,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

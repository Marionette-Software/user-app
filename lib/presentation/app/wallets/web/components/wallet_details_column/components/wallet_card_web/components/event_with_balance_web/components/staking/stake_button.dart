import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/staking/staking_form.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class StakeButtonWeb extends HookConsumerWidget {
  const StakeButtonWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletDataStateNotifierProvider);

    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: () {
        showDialog(
          barrierColor: AppColors.placeHolderGrey,
          context: context,
          builder: (context) => const ModalWindowWallet(
            titleSize: 30,
            title: '',
            alertDialogSide: false,
            content: StakingFormWeb(),
          ),
        );
      },
      child: Container(
        width: 119.w,
        height: 54.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            width: 2.w,
            color: getWalletColor(
              walletState.lightBgColor1,
              walletState.darkBgColor1,
              isLightTheme(context),
            ),
          ),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                stakeWalletIcon,
                height: 27.h,
                width: 27.w,
                colorFilter: ColorFilter.mode(
                  isLightTheme(context)
                      ? getWalletColor(
                          walletState.lightBgColor1,
                          walletState.darkBgColor1,
                          isLightTheme(context),
                        )
                      : AppColors.whiteColor,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Stake'.hardcoded,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: isLightTheme(context)
                          ? getWalletColor(
                              walletState.lightBgColor1,
                              walletState.darkBgColor1,
                              isLightTheme(context),
                            )
                          : AppColors.whiteColor,
                      fontSize: 20.sp,
                      letterSpacing: -1.sp,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

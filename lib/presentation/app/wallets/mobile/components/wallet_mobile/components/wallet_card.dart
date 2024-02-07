import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/staking/staking_button.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/events_with_balance_mobile.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/locked_balance_mobile.dart';
import 'package:user_app/presentation/components/main_show_modal_bottom_sheet.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/sum_with_balance.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class WalletCardMobile extends HookConsumerWidget {
  const WalletCardMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(walletDataStateNotifierProvider);

    final userBalance = ref
        .watch(userBalancesStateNotifierProvider)
        .firstWhere((e) => e.id == wallet.id);

    var globalConfigBox = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = globalConfigBox.getAt(0)!;

    return Center(
      child: Stack(
        children: [
          Positioned(
            right: -40.w,
            top: -70
              ..h,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(20 / 360),
              child: Opacity(
                opacity: 0.25,
                child: UserAppImage(
                  path: wallet.iconUrl,
                  width: 189.w,
                  height: 189..h,
                  isNetwork: true,
                  clipBehavior: Clip.hardEdge,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: EdgeInsets.only(
                top: 12..h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                               context.pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 15.h,
                                color: isLightTheme(context)
                                    ? AppColors.whiteColor
                                    : Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Tooltip(
                              message:
                                  wallet.name.length > 33 ? wallet.name : '',
                              child: SizedBox(
                                width: 200.w,
                                height: 50..h,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    wallet.name,
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: 25.sp,
                                          height: 0.85,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -1.25.sp,
                                          color: MainColorsApp.lightTextColor,
                                        ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15..h,
                        ),
                        Text(
                          'Balance'.hardcoded,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    letterSpacing: -0.75.sp,
                                  ),
                        ),
                        SizedBox(
                          height: 3..h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              getCoinSum(
                                wallet: wallet,
                                withAbbreviateSum: false,
                                userBalance: userBalance,
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: MainColorsApp.lightTextColor,
                                    fontSize: 25.sp,
                                    letterSpacing: -1.25.sp,
                                  ),
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 3..h),
                              child: Text(
                                getUsdSumForWallet(
                                  wallet: wallet,
                                  withAbbreviateSum: false,
                                  userBalance: userBalance,
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: MainColorsApp.lightTextColor,
                                      fontSize: 15.sp,
                                      letterSpacing: -0.75.sp,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4..h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${tr('wallet.available')} ${numberFormatWithPrecision(wallet.precision).format(userBalance.advancedTradingBalance! + userBalance.balance!)} ${wallet.id.toUpperCase()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp,
                                    letterSpacing: -0.65.sp,
                                  ),
                            ),
                            SizedBox(
                              height: 4..h,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${wallet.staking_enabled && globalData.enabledStaking ? 'Locked / Staking:'.hardcoded : 'Locked:'} ${numberFormatWithPrecision(wallet.precision).format(userBalance.advancedTradingLockedBalance! + userBalance.lockedBalance!)} ${wallet.id.toUpperCase()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13.sp,
                                        letterSpacing: -0.65.sp,
                                      ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    mainShowModalBottomSheet(
                                      context: context,
                                      longShowModalBottom: false,
                                      content: Container(
                                        color: Colors.transparent,
                                        child:
                                            const LockedBalanceContainerMobile(),
                                      ),
                                    );
                                  },
                                  child: ColorFiltered(
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.whiteColor,
                                      BlendMode.srcIn,
                                    ),
                                    child: SvgPicture.asset(
                                      walletInfoPath,
                                      width: 18.w,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        wallet.staking_enabled && globalData.enabledStaking
                            ? const StakeButtonMobile()
                            : const SizedBox()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15..h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 5..h,
                    color: AppColors.whiteColor.withOpacity(0.05),
                  ),
                  SizedBox(
                    height: 15..h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: EventsWithBalanceMobile(
                      withTradingBalance: globalData.withTradingBalance,
                    ),
                  ),
                  SizedBox(
                    height: 20..h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

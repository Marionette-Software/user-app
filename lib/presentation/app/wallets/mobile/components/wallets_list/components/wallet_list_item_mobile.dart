import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/wallet/user_wallet.dart';
import 'package:user_app/infrastructure/wallet/wallet_service.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/sum_with_balance.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class WalletListItemMobile extends StatefulHookConsumerWidget {
  const WalletListItemMobile({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  final UserWallet item;
  final Function() onTap;

  @override
  ConsumerState<WalletListItemMobile> createState() =>
      _WalletListItemMobileState();
}

class _WalletListItemMobileState extends ConsumerState<WalletListItemMobile> {
  bool hoveredFavorite = false;

  @override
  Widget build(BuildContext context) {
    bool itemFavoriteState = widget.item.isFavorite;

    var globalConfigBox = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = globalConfigBox.getAt(0)!;

    final isFavoriteRead =
        ref.watch(walletsListDataStateNotifierProvider.notifier);

    IWalletService service = WalletService();

    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          top: 15..h,
          bottom: 15..h,
          right: 15.w,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () async {
                    await service.setFavoriteWallet(
                        currencyId: widget.item.id);

                    setState(() {
                      itemFavoriteState = !itemFavoriteState;
                    });

                    isFavoriteRead.setFavoriteWallet(
                        widget.item.id, itemFavoriteState);
                  },
                  child: SvgPicture.asset(
                    width: 16.w,
                    height: 16..h,
                    itemFavoriteState
                        ? starFavoriteWallet
                        : unselectedStarFavoriteWallet,
                    colorFilter: ColorFilter.mode(
                      hoveredFavorite
                          ? isLightTheme(context)
                              ? AppColors.aboutHeaderLight.withOpacity(0.5)
                              : AppColors.whiteColor.withOpacity(0.5)
                          : isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : itemFavoriteState
                                  ? AppColors.whiteColor
                                  : AppColors.whiteColor.withOpacity(0.25),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                widget.item.staking_enabled && globalData.enabledStaking
                    ? Padding(
                        padding: EdgeInsets.only(top: 9..h),
                        child: SvgPicture.asset(
                          stakeWalletIcon,
                          width: 16.w,
                          height: 16..h,
                          colorFilter: ColorFilter.mode(
                            isLightTheme(context)
                                ? AppColors.borderSideColor.withOpacity(0.25)
                                : AppColors.whiteColor.withOpacity(0.25),
                            BlendMode.srcIn,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            SizedBox(
              width: 15.w,
            ),
            UserAppImage(
              clipBehavior: Clip.hardEdge,
              path: widget.item.iconUrl,
              isNetwork: true,
              width: 37.5.w,
              height: 37.5..h,
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.item.name.split(' ').length >= 3
                      ? widget.item.name.split(' ').getRange(0, 2).join(' ')
                      : widget.item.name,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.item.name.split(' ').length >= 3
                          ? '${widget.item.name.split(' ').getRange(2, widget.item.name.split(' ').length).join(' ')} '
                          : '',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.75.sp,
                          ),
                    ),
                    Text(
                      widget.item.id.toUpperCase(),
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 13.sp,
                            color: isLightTheme(context)
                                ? MainColorsApp.primaryOp50Color
                                : AppColors.whiteColor.withOpacity(0.5),
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.65.sp,
                          ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Consumer(
              builder: (_, ref, __) {
                final userBalance = ref
                    .watch(userBalancesStateNotifierProvider)
                    .firstWhere((e) => e.id == widget.item.id);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getCoinSum(
                        wallet: widget.item,
                        withAbbreviateSum: true,
                        userBalance: userBalance,
                      ),
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.75,
                          ),
                    ),
                    Text(
                      getUsdSumForWallet(
                        wallet: widget.item,
                        withAbbreviateSum: true,
                        userBalance: userBalance,
                      ),
                      style:
                          Theme.of(context).textTheme.labelMedium!.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.65,
                                color: isLightTheme(context)
                                    ? MainColorsApp.primaryOp50Color
                                    : AppColors.whiteColor.withOpacity(0.5),
                              ),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

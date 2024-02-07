import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/wallet/user_wallet.dart';
import 'package:user_app/infrastructure/wallet/wallet_service.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/sum_with_balance.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class WalletsListItem extends StatefulHookConsumerWidget {
  const WalletsListItem({
    Key? key,
    required this.onTap,
    required this.item,
  }) : super(key: key);

  final Function() onTap;
  final UserWallet item;

  @override
  ConsumerState<WalletsListItem> createState() => _WalletsListItemState();
}

class _WalletsListItemState extends ConsumerState<WalletsListItem> {
  bool hoveredFavorite = false;

  @override
  Widget build(BuildContext context) {
    final walletState = ref.watch(walletDataStateNotifierProvider);
    final userBalance = ref.watch(userBalancesStateNotifierProvider);

    final isFavoriteRead =
        ref.watch(walletsListDataStateNotifierProvider.notifier);

    var globalConfigBox = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = globalConfigBox.getAt(0)!;

    IWalletService service = WalletService();

    return InkWell(
      onTap: widget.onTap,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        width: 430.w,
        height: 80.h,
        decoration: BoxDecoration(
          color: widget.item.id == walletState.id
              ? getWalletColor(
                  walletState.lightBgColor1,
                  walletState.darkBgColor1,
                  isLightTheme(context),
                )
              : Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                    message: widget.item.isFavorite
                        ? 'Remove from favorites'.hardcoded
                        : 'Add to favorites'.hardcoded,
                    child: InkWell(
                      onHover: (value) {
                        setState(() {
                          hoveredFavorite = !hoveredFavorite;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                      onTap: () async {
                        await service.setFavoriteWallet(
                            currencyId: widget.item.id);

                        isFavoriteRead.setFavoriteWallet(
                          widget.item.id,
                          !widget.item.isFavorite,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SvgPicture.asset(
                          widget.item.isFavorite
                              ? starFavoriteWallet
                              : unselectedStarFavoriteWallet,
                          width: 15.w,
                          height: 15.h,
                          colorFilter: ColorFilter.mode(
                            hoveredFavorite
                                ? isLightTheme(context)
                                    ? AppColors.aboutHeaderLight
                                        .withOpacity(0.5)
                                    : AppColors.whiteColor.withOpacity(0.5)
                                : isLightTheme(context)
                                    ? widget.item.id == walletState.id
                                        ? AppColors.whiteColor
                                        : AppColors.aboutHeaderLight
                                    : widget.item.isFavorite
                                        ? AppColors.whiteColor
                                        : widget.item.id == walletState.id
                                            ? AppColors.whiteColor
                                            : AppColors.whiteColor
                                                .withOpacity(0.25),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                  widget.item.staking_enabled && globalData.enabledStaking
                      ? Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: SvgPicture.asset(
                            stakeWalletIcon,
                            width: 15.w,
                            height: 15.h,
                            colorFilter: ColorFilter.mode(
                              isLightTheme(context)
                                  ? widget.item.id == walletState.id
                                      ? AppColors.whiteColor
                                      : AppColors.aboutHeaderLight
                                  : AppColors.whiteColor,
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
                path: widget.item.iconUrl,
                width: 50.w,
                height: 50.h,
                isNetwork: true,
                clipBehavior: Clip.hardEdge,
              ),
              SizedBox(
                width: 15.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.item.name.split(' ').length >= 3
                        ? widget.item.name.split(' ').getRange(0, 2).join(' ')
                        : widget.item.name,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: walletState.id == widget.item.id
                              ? AppColors.whiteColorText
                              : Theme.of(context).primaryColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1.sp,
                        ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.item.name.split(' ').length >= 3
                            ? '${widget.item.name.split(' ').getRange(2, widget.item.name.split(' ').length).join(' ')} '
                            : '',
                        maxLines: 1,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 20.sp,
                                  color: walletState.id == widget.item.id
                                      ? AppColors.whiteColorText
                                      : Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -1.sp,
                                ),
                      ),
                      Text(
                        widget.item.id.toUpperCase(),
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 18.sp,
                              color: walletState.id == widget.item.id
                                  ? AppColors.whiteColorText
                                  : Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.9.sp,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      getCoinSum(
                        wallet: widget.item,
                        withAbbreviateSum: true,
                        userBalance: userBalance.firstWhere(
                            (element) => element.id == widget.item.id),
                      ),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 20.sp,
                            color: walletState.id == widget.item.id
                                ? AppColors.whiteColor
                                : Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -1.sp,
                          ),
                    ),
                  ),
                  Text(
                    getUsdSumForWallet(
                      wallet: widget.item,
                      withAbbreviateSum: true,
                      userBalance: userBalance.firstWhere(
                          (element) => element.id == widget.item.id),
                    ),
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 18.sp,
                          color: walletState.id == widget.item.id
                              ? AppColors.whiteColor
                              : Theme.of(context).primaryColor.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.9.sp,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

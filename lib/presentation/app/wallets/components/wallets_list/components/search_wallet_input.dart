import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SearchWalletInput extends StatefulWidget {
  const SearchWalletInput({
    required this.hidZeroBalance,
    required this.searchControllerValue,
    required this.getWalletsList,
    required this.stakingFilter,
    required this.isFavorite,
    super.key,
  });

  final ValueNotifier<String> searchControllerValue;
  final Function getWalletsList;
  final ValueNotifier<bool> hidZeroBalance;
  final ValueNotifier<bool> stakingFilter;
  final ValueNotifier<bool> isFavorite;

  @override
  State<SearchWalletInput> createState() => _SearchWalletInputState();
}

class _SearchWalletInputState extends State<SearchWalletInput> {
  bool hoveredFavorite = false;
  bool hoveredStaking = false;
  bool hoveredZeroBalance = false;

  @override
  Widget build(BuildContext context) {
    var globalConfigBox = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = globalConfigBox.getAt(0)!;

    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: Row(
        children: [
          Tooltip(
            message: 'Favorite currencies'.hardcoded,
            child: InkWell(
              onHover: (value) {
                setState(() {
                  hoveredFavorite = !hoveredFavorite;
                });
              },
              borderRadius: BorderRadius.circular(100),
              onTap: () {
                widget.isFavorite.value = !widget.isFavorite.value;
                widget.hidZeroBalance.value = false;
                widget.stakingFilter.value = false;

                widget.getWalletsList();
              },
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: SvgPicture.asset(
                  widget.isFavorite.value
                      ? starFavoriteWallet
                      : unselectedStarFavoriteWallet,
                  width: 15.w,
                  height: 15.h,
                  colorFilter: ColorFilter.mode(
                    hoveredFavorite
                        ? isLightTheme(context)
                            ? AppColors.aboutHeaderLight.withOpacity(0.25)
                            : AppColors.whiteColor.withOpacity(0.5)
                        : widget.isFavorite.value
                            ? isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : AppColors.whiteColor
                            : isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : AppColors.whiteColor.withOpacity(0.25),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          globalData.enabledStaking
              ? Tooltip(
                message: 'Currencies available for staking'.hardcoded,
                child: InkWell(
                    onHover: (value) {
                      setState(() {
                        hoveredStaking = !hoveredStaking;
                      });
                    },
                    onTap: () {
                      widget.stakingFilter.value = !widget.stakingFilter.value;
                      widget.isFavorite.value = false;
                      widget.hidZeroBalance.value = false;
              
                      widget.getWalletsList();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: SvgPicture.asset(
                        stakeWalletIcon,
                        width: 15.w,
                        height: 15.h,
                        colorFilter: ColorFilter.mode(
                          hoveredStaking
                              ? isLightTheme(context)
                                  ? AppColors.aboutHeaderLight.withOpacity(0.25)
                                  : AppColors.whiteColor.withOpacity(0.5)
                              : widget.stakingFilter.value
                                  ? isLightTheme(context)
                                      ? AppColors.aboutHeaderLight
                                      : AppColors.whiteColor
                                  : isLightTheme(context)
                                      ? AppColors.aboutHeaderLight
                                          .withOpacity(0.5)
                                      : AppColors.whiteColor.withOpacity(0.25),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
              )
              : const SizedBox(),
          SizedBox(
            width: 15.w,
          ),
          Tooltip(
            message: 'Hide zero balances'.hardcoded,
            child: InkWell(
              onHover: (value) {
                setState(() {
                  hoveredZeroBalance = !hoveredZeroBalance;
                });
              },
              onTap: () {
                widget.hidZeroBalance.value = !widget.hidZeroBalance.value;
                widget.stakingFilter.value = false;
                widget.isFavorite.value = false;
          
                widget.getWalletsList();
              },
              child: SvgPicture.asset(
                hideZeroBalanceMobileIcon,
                width: 15.w,
                height: 15.h,
                colorFilter: ColorFilter.mode(
                  hoveredZeroBalance
                      ? isLightTheme(context)
                          ? AppColors.aboutHeaderLight.withOpacity(0.25)
                          : AppColors.whiteColor.withOpacity(0.5)
                      : widget.hidZeroBalance.value
                          ? isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : AppColors.whiteColor
                          : isLightTheme(context)
                              ? AppColors.aboutHeaderLight.withOpacity(0.5)
                              : AppColors.whiteColor.withOpacity(0.25),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                onChanged: (value) {
                  widget.hidZeroBalance.value = false;
                  widget.stakingFilter.value = false;
                  widget.isFavorite.value = false;

                  widget.searchControllerValue.value = value;
                },
                decoration: InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  hintText: tr('trade.search'),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    size: 20.w,
                  ),
                  fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                  contentPadding: EdgeInsets.only(
                    top: 8.h,
                    bottom: 8.h,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 20.sp,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1.sp,
                      ),
                ),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -1.sp,
                    ),
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
        ],
      ),
    );
  }
}

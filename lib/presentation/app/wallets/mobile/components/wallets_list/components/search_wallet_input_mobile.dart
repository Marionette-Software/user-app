import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SearchWalletInputMobile extends StatefulWidget {
  const SearchWalletInputMobile({
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
  State<SearchWalletInputMobile> createState() =>
      _SearchWalletInputMobileState();
}

class _SearchWalletInputMobileState extends State<SearchWalletInputMobile> {
  bool hoveredFavorite = false;
  bool hoveredStaking = false;
  bool hoveredZeroBalance = false;

  @override
  Widget build(BuildContext context) {
    var globalConfigBox = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = globalConfigBox.getAt(0)!;

    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15..h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onHover: (value) {
              setState(() {
                hoveredFavorite = !hoveredFavorite;
              });
            },
            onTap: () {
              widget.isFavorite.value = !widget.isFavorite.value;
              widget.hidZeroBalance.value = false;
              widget.stakingFilter.value = false;

              widget.getWalletsList();
            },
            child: SvgPicture.asset(
              widget.isFavorite.value
                  ? starFavoriteWallet
                  : unselectedStarFavoriteWallet,
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
              width: 16.w,
              height: 16..h,
            ),
          ),
          globalData.enabledStaking
              ? Padding(
                  padding: EdgeInsets.only(left: 20.w),
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
                    child: SvgPicture.asset(
                      stakeWalletIcon,
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
                      width: 16.w,
                      height: 16..h,
                    ),
                  ),
                )
              : const SizedBox(),
          SizedBox(
            width: 20.w,
          ),
          InkWell(
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
              width: 16.w,
              height: 16..h,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Container(
              height: 30..h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
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
                  prefixIcon: SizedBox(
                    width: 16.w,
                    height: 18..h,
                    child: Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      size: 20.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MainColorsApp.accentColor,
                      width: 1.0.w,
                    ),
                    borderRadius: BorderRadius.circular(
                      25.r,
                    ),
                  ),
                  fillColor: isLightTheme(context)
                      ? cardColor
                      : AppColors.whiteColor.withOpacity(0.05),
                  contentPadding: EdgeInsets.only(
                    top: 6..h,
                    bottom: 6..h,
                    left: 8.w,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 13.sp,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.65.sp,
                      ),
                ),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.65.sp,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

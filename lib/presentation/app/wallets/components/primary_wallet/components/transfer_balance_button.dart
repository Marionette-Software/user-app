import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/wallets/components/primary_wallet/components/move/mobile/move_mobile.dart';
import 'package:user_app/presentation/app/wallets/components/primary_wallet/components/move/web/move_web.dart';
import 'package:user_app/presentation/components/main_show_modal_bottom_sheet.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class TransferBalanceButton extends StatelessWidget {
  const TransferBalanceButton({
    Key? key,
    required this.platformType,
  }) : super(key: key);

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: (platformType == PlatformTypeState.mobile ? 1 : 2).h,
          width: (platformType == PlatformTypeState.web
                  ? 162.62
                  : (platformType == PlatformTypeState.tablet ? 121.57 : 56.44))
              .w,
          color: isLightTheme(context)
              ? AppColors.blackColor.withOpacity(0.25)
              : AppColors.whiteColor.withOpacity(0.25),
        ),
        InkWell(
          onTap: () {
            if (platformType == PlatformTypeState.mobile) {
              mainShowModalBottomSheet(
                context: context,
                longShowModalBottom: true,
                content: Container(
                  height: 400.0.h,
                  color: Colors.transparent,
                  child: const MoveMobile(),
                ),
              );
            } else {
              showDialog(
                barrierColor: AppColors.placeHolderGrey,
                context: context,
                builder: (context) => ModalWindowWallet(
                    titleSize: 30,
                    title: tr('wallet.transfer_balance'),
                    content: const MoveWeb()),
              );
            }
          },
          child: Container(
            width: (platformType == PlatformTypeState.web
                    ? 264.5
                    : (platformType == PlatformTypeState.tablet
                        ? 178.75
                        : 157.11))
                .w,
            height: (platformType == PlatformTypeState.web
                    ? 50
                    : (platformType == PlatformTypeState.tablet ? 35 : 30))
                .h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  isLightTheme(context)
                      ? transferBtnLightPath
                      : transferBtnPath,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: (platformType == PlatformTypeState.web
                          ? 22.59
                          : (platformType == PlatformTypeState.tablet
                              ? 15.19
                              : 12.21))
                      .w,
                  height: (platformType == PlatformTypeState.web
                          ? 26.81
                          : (platformType == PlatformTypeState.tablet
                              ? 18.04
                              : 14.5))
                      .h,
                  child: SvgPicture.asset(
                    moveArrowsPath,
                    colorFilter: ColorFilter.mode(
                      isLightTheme(context)
                          ? Theme.of(context).primaryColor
                          : AppColors.whiteColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                SizedBox(
                  width: (platformType == PlatformTypeState.web
                          ? 10
                          : (platformType == PlatformTypeState.tablet
                              ? 6.73
                              : 3.79))
                      .w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: SizedBox(
                    height: platformType == PlatformTypeState.web
                        ? 25
                        : (platformType == PlatformTypeState.tablet ? 19 : 16)
                            .h,
                    width: (platformType == PlatformTypeState.web
                            ? 170
                            : (platformType == PlatformTypeState.tablet
                                ? 109
                                : 96))
                        .w,
                    child: AutoSizeText(
                      tr('wallet.transfer_balance'),
                      minFontSize: 5,
                      maxFontSize: 20,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: platformType == PlatformTypeState.web
                                ? 20
                                : (platformType == PlatformTypeState.tablet
                                    ? 15
                                    : 13),
                            fontWeight: platformType == PlatformTypeState.web
                                ? FontWeight.w700
                                : FontWeight.normal,
                            color: isLightTheme(context)
                                ? AppColors.blackColor
                                : AppColors.whiteColor,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: (platformType == PlatformTypeState.mobile ? 1 : 2).h,
          width: (platformType == PlatformTypeState.web
                  ? 162.62
                  : (platformType == PlatformTypeState.tablet ? 121.57 : 56.44))
              .w,
          color: isLightTheme(context)
              ? AppColors.blackColor.withOpacity(0.25)
              : AppColors.whiteColor.withOpacity(0.25),
        ),
      ],
    );
  }
}

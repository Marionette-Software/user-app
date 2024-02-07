import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/domain/wallet/user_wallet.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/fiat_deposit/fiat_deposit.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/capitalize.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class FiatDepositMobile extends StatelessWidget {
  const FiatDepositMobile({
    required this.fiatWalletDetails,
    required this.walletData,
    super.key,
  });

  final Map<String, dynamic> fiatWalletDetails;
  final UserWallet walletData;

  @override
  Widget build(BuildContext context) {
    List<FiatWalletItem> listFiatWalletDetails = [];

    fiatWalletDetails.forEach(
      (key, value) {
        listFiatWalletDetails.add(
          FiatWalletItem(key: key, value: value),
        );
      },
    );

    Widget horizontalLine() {
      return Padding(
        padding: EdgeInsets.only(
          bottom: 15.h,
          top: 15.h,
        ),
        child: Container(
          width: 430.w,
          height: 2.h,
          color: isLightTheme(context)
              ? AppColors.mainBackgroundLightColor
              : AppColors.whiteColor.withOpacity(0.05),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: getWalletColor(
          walletData.lightBgColor1,
          walletData.darkBgColor1,
          isLightTheme(context),
        ),
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50..h),
          child: Padding(
            padding: EdgeInsets.only(
              top: 15..h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: BackButtonMobile(
                    onTap: () => context.pop(),
                  ),
                ),
                Text(
                  'Receive ${walletData.id.toUpperCase()}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 15.sp,
                        letterSpacing: -0.75.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  width: 70.w,
                  height: 25..h,
                )
              ],
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 10..h,
          ),
          decoration: BoxDecoration(
            color: isLightTheme(context)
                ? AppColors.whiteColor
                : walletBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 20..h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Instructions for ${walletData.id.toUpperCase()} Deposit',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: isLightTheme(context)
                            ? AppColors.darkColorText
                            : AppColors.whiteColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -1.sp,
                      ),
                ),
                SizedBox(
                  height: 20..h,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: listFiatWalletDetails.length,
                  separatorBuilder: (context, index) => horizontalLine(),
                  itemBuilder: (context, i) {
                    FiatWalletItem item = listFiatWalletDetails[i];
                    return Padding(
                      padding: EdgeInsets.only(left: 15.w, right: 15.w),
                      child: Row(
                        children: [
                          Text(
                            capitalize(item.key),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: isLightTheme(context)
                                      ? AppColors.aboutHeaderLight
                                      : AppColors.whiteColor.withOpacity(0.5),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.75.sp,
                                ),
                          ),
                          const Spacer(),
                          Text(
                            item.value,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.75.sp,
                                ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                            onTap: () {
                              Clipboard.setData(
                                ClipboardData(
                                  text: item.value,
                                ),
                              );

                              final snackBar = SnackBar(
                                elevation: 0,
                                clipBehavior: Clip.none,
                                behavior: SnackBarBehavior.floating,
                                padding: EdgeInsets.only(
                                  bottom:
                                      // ignore: use_build_context_synchronously
                                      MediaQuery.viewInsetsOf(context).bottom +
                                          30
                                        ..h,
                                ),
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  titleFontSize: 20.sp,
                                  messageFontSize: 15.sp,
                                  title:
                                      tr('snack_bar_message.success.success'),
                                  message:
                                      '${tr('snack_bar_message.success.copied')} ${capitalize(item.key)}',
                                  contentType: ContentType.success,
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                            },
                            child: Icon(
                              Icons.copy,
                              color: Theme.of(context).primaryColorLight,
                              size: 20.w,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

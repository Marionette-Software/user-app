import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/history/history_wallet_future_provider.dart';
import 'package:user_app/application/history/history_wallet_notifire_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/app/history/history.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/wallet_history/components/empty_history_list_mobile.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/wallet_history/components/history_item_mobile.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class WalletHistoryMobile extends HookConsumerWidget {
  const WalletHistoryMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final walletHistoryWatch =
        ref.watch(walletHistoryDataStateNotifierProvider);
    final getWalletHistory = ref.watch(walletHistoryGetFutureProvider);

    return Container(
      width: 360.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: isLightTheme(context)
            ? Border.all(
                width: 1,
                color: AppColors.mainBackgroundLightColor,
              )
            : null,
        color: isLightTheme(context)
            ? AppColors.whiteColor
            : AppColors.whiteColor.withOpacity(0.05),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 15..h,
          bottom: 15..h,
        ),
        child: Column(
          children: [
            Container(
              child: getWalletHistory.when(
                data: (data) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Text(
                          'Recent History'.hardcoded,
                          textAlign: TextAlign.start,
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.75.sp,
                                    fontStyle: FontStyle.normal,
                                  ),
                        ),
                      ),
                      SizedBox(
                        height: 15..h,
                      ),
                      data.data!.history!.result!.isEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 25..h,
                                    left: 15.w,
                                  ),
                                  child: Text(
                                    'Deposit, Buy, Sell, Swap and make history'.hardcoded
                                        .hardcoded
                                        .hardcoded
                                        .hardcoded,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: isLightTheme(context)
                                              ? AppColors.aboutHeaderLight
                                              : AppColors.whiteColor
                                                  .withOpacity(0.5),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: -0.65.sp,
                                        ),
                                  ),
                                ),
                                const EmptyHistoryListMobile()
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) =>
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              height: 8..h,
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 1.h,
                                              color: isLightTheme(context)
                                                  ? AppColors
                                                      .mainBackgroundLightColor
                                                  : AppColors.whiteColor
                                                      .withOpacity(0.05),
                                            ),
                                            SizedBox(
                                              height: 8..h,
                                            ),
                                          ],
                                        ),
                                    itemCount: walletHistoryWatch.length,
                                    itemBuilder: (context, i) {
                                      DateTime dateTime = DateTime.now();
                                      var newDate = DateTime.parse(
                                              walletHistoryWatch[i]!.createdAt!)
                                          .add(dateTime.timeZoneOffset);
                                      return HistoryItemMobile(
                                        date: DateFormat(
                                          "EEE, d MMM yyyy HH:mm:ss",
                                        ).format(newDate),
                                        item: walletHistoryWatch[i]!,
                                        walletId: walletData.id,
                                      );
                                    }),
                                SizedBox(
                                  height: 15..h,
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(25.r),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const History(),
                                      ),
                                    );
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 306.w,
                                      height: 45..h,
                                      decoration: BoxDecoration(
                                        color: getWalletColor(
                                          walletData.lightBgColor1,
                                          walletData.darkBgColor1,
                                          isLightTheme(context),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Full History'.hardcoded,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(
                                                color: AppColors.whiteColor,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: -0.75.sp,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                    ],
                  );
                },
                error: (error, _) => () {
                  return UserAppError(
                    errorMessage: error.toString(),
                  );
                }(),
                loading: () => const SizedBox(
                  child: MainLoaderMobile(
                    loaderSize: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

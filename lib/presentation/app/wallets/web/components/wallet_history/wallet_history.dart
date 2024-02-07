import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/history/history_wallet_future_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_history/components/empty_history_list.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_history/components/full_history_button.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_history/components/history_item.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_history/components/space_history_item.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class WalletHistoryWeb extends HookConsumerWidget {
  const WalletHistoryWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);

    final getWalletHistory = ref.watch(
      walletHistoryGetFutureProvider,
    );

    Widget separateLine() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 9.h,
          ),
          Container(
            width: 576.w,
            height: 2.h,
            color: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : AppColors.whiteColor.withOpacity(0.05),
          ),
          SizedBox(
            height: 8.h,
          ),
        ],
      );
    }

    return MainDecorationContainerWeb(
      content: getWalletHistory.when(
        data: (data) {
          final walletHistory = data.data!.history!.result;

          return Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: walletHistory!.isEmpty ? 28.h : 25.h,
                  left: 25.w,
                  right: 25.w,
                  bottom: walletHistory.isEmpty ? 38.h : 25.h,
                ),
                width: 670.w,
                height: 400.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Recent History',
                          textAlign: TextAlign.start,
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -1.5.sp,
                                    fontStyle: FontStyle.normal,
                                  ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        walletHistory.isEmpty
                            ? SizedBox(
                                width: 370.w,
                                child: Text(
                                  'Deposit, Buy, Sell, Swap and make history!',
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        fontSize: 20.sp,
                                        color: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .color!
                                            .withOpacity(0.5),
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -1.sp,
                                        fontStyle: FontStyle.normal,
                                      ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    walletHistory.isEmpty
                        ? const Column(
                            children: [
                              EmptyHistoryListWeb(),
                            ],
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                separateLine(),
                            itemCount: 4,
                            itemBuilder: (context, i) {
                              if (i >= walletHistory.length) {
                                return const SpaceHistoryItemWeb();
                              } else {
                                DateTime dateTime = DateTime.now();
                                var newDate =
                                    DateTime.parse(walletHistory[i]!.createdAt!)
                                        .add(dateTime.timeZoneOffset);
                                return HistoryItemWeb(
                                  date: DateFormat(
                                    "EEE, d MMM yyyy HH:mm:ss",
                                  ).format(newDate),
                                  item: walletHistory[i]!,
                                  walletId: walletData.id,
                                );
                              }
                            },
                          ),
                    walletHistory.isNotEmpty
                        ? Padding(
                            padding: EdgeInsets.only(top: 18.h),
                            child: FullHistoryButton(
                              color: getWalletColor(
                                walletData.lightBgColor1,
                                walletData.darkBgColor1,
                                isLightTheme(context),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          );
        },
        error: (error, _) => () {
          return UserAppError(
            errorMessage: error.toString(),
          );
        }(),
        loading: () => SizedBox(
          height: 400.h,
          width: 670.w,
          child: const MainLoader(),
        ),
      ),
    );
  }
}

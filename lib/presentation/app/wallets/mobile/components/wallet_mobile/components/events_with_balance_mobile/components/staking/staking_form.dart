import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ferry/typed_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/currency_staking_futere_provider.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/domain/wallet/staking_currency.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_staking_currency.data.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_staking_currency.var.gql.dart';
import 'package:user_app/infrastructure/wallet/wallet_service.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/staking/componenst/active_staking.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/staking/componenst/close_staking_form.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/staking/componenst/staking_amount_input.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/staking/componenst/staking_icon_container.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/staking/componenst/staking_next_reward_details.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/staking/componenst/staking_pending_details.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/staking/componenst/staking_reward_details.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/staking/componenst/unstaking_details.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class StakingFormMobile extends StatefulHookConsumerWidget {
  const StakingFormMobile({
    super.key,
  });

  @override
  ConsumerState<StakingFormMobile> createState() => _StakingFormMobileState();
}

class _StakingFormMobileState extends ConsumerState<StakingFormMobile> {
  @override
  Widget build(BuildContext context) {
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final stakingCurrencyWatch =
        ref.watch(stakingCurrencyDataStateNotifierProvider);
    final stakingCurrencyRead =
        ref.read(stakingCurrencyDataStateNotifierProvider.notifier);

    final amountController = useTextEditingController(
      text: (0.0).toStringAsFixed(walletData.precision),
    );

    final refreshValue = useState(1);
    final loaderState = useState(LoadState.notLoading);
    final isValidAmount = useState(false);

    final getCurrencyStakingFuture = ref.watch(
      getCurrencyStakingFutureProvider(
        RefreshRequest(refresh: '$refreshValue'),
      ),
    );

    final userBalance = ref
        .watch(userBalancesStateNotifierProvider)
        .firstWhere((e) => e.id == walletData.id);

    var globalConfigBox = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = globalConfigBox.getAt(0)!;

    IWalletService service = WalletService();

    double walletBalance = globalData.withTradingBalance
        ? userBalance.balance!
        : (userBalance.balance! + userBalance.advancedTradingBalance!);

    void updateStakingCurrency() async {
      OperationResponse<GGetStakingCurrencyData, GGetStakingCurrencyVars>
          getCurrencyStakingResponse =
          await service.getStakingCurrency(currencyId: walletData.id);

      StakingCurrency stakingCurrencyData = StakingCurrency(
        id: getCurrencyStakingResponse.data!.stakingCurrency!.id!,
        staking_period:
            getCurrencyStakingResponse.data!.stakingCurrency!.staking_period,
        staking_apr:
            getCurrencyStakingResponse.data!.stakingCurrency!.staking_apr,
        min_staking_amount: getCurrencyStakingResponse
            .data!.stakingCurrency!.min_staking_amount,
        last_staking_calc:
            getCurrencyStakingResponse.data!.stakingCurrency!.last_staking_calc,
        next_staking_calc:
            getCurrencyStakingResponse.data!.stakingCurrency!.next_staking_calc,
        next_reward_amount: getCurrencyStakingResponse
            .data!.stakingCurrency!.next_reward_amount,
        locked_balance:
            getCurrencyStakingResponse.data!.stakingCurrency!.locked_balance,
        active_balance:
            getCurrencyStakingResponse.data!.stakingCurrency!.active_balance,
        isUnstakingProcess: getCurrencyStakingResponse
            .data!.stakingCurrency!.isUnstakingProcess,
      );

      stakingCurrencyRead.updateStakingCurrencyData(stakingCurrencyData);
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
                  stakingCurrencyWatch.isUnstakingProcess!
                      ? 'Staking Details'
                      : stakingCurrencyWatch.locked_balance! +
                                  stakingCurrencyWatch.active_balance! >
                              0
                          ? 'Top-up Staking'
                          : 'Enter Staking'.hardcoded,
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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20..h,
                left: 15.w,
                right: 15.w,
                bottom: MediaQuery.viewInsetsOf(context).bottom + 50
                  ..h,
              ),
              child: getCurrencyStakingFuture.when(
                data: (_) {
                  return stakingCurrencyWatch.isUnstakingProcess!
                      ? UnstackingDetailsMobile(
                          nextStakingCalc:
                              stakingCurrencyWatch.next_staking_calc!.toInt(),
                        )
                      : Column(
                          children: [
                            StakingAmountInputMobile(
                              isValidAmount: isValidAmount,
                              controller: amountController,
                              onChanged: (value) {
                                value = value == '.'
                                    ? '0.'
                                    : value.isEmpty
                                        ? '0'
                                        : value;

                                if (double.parse(value) > walletBalance) {
                                  isValidAmount.value = false;
                                } else if (double.parse(value) <
                                    stakingCurrencyWatch.min_staking_amount!) {
                                  (stakingCurrencyWatch.locked_balance! +
                                                  stakingCurrencyWatch
                                                      .active_balance! >
                                              0 &&
                                          double.parse(value) > 0)
                                      ? isValidAmount.value = true
                                      : isValidAmount.value = false;
                                } else if (value.isEmpty) {
                                  isValidAmount.value = false;
                                } else if (double.parse(value) <= 0) {
                                  isValidAmount.value = false;
                                } else {
                                  isValidAmount.value = true;
                                }
                              },
                              withTradingBalance: false,
                            ),
                            Container(
                              width: double.infinity,
                              height: 5..h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: isLightTheme(context)
                                    ? AppColors.mainBackgroundLightColor
                                    : AppColors.whiteColor.withOpacity(0.25),
                              ),
                            ),
                            SizedBox(
                              height: 5..h,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${tr('wallet.available')} ${numberFormatWithPrecision(walletData.precision).format(walletBalance)} ${walletData.id.toUpperCase()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.75.sp,
                                      color: isLightTheme(context)
                                          ? AppColors.aboutHeaderLight
                                          : Colors.white.withOpacity(0.5),
                                    ),
                              ),
                            ),
                            SizedBox(
                              height: 25..h,
                            ),
                            (stakingCurrencyWatch.locked_balance! +
                                        stakingCurrencyWatch.active_balance! <=
                                    0)
                                ? Padding(
                                    padding: EdgeInsets.only(bottom: 25..h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Minimum staking:',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.75.sp,
                                                color: isLightTheme(context)
                                                    ? AppColors.aboutHeaderLight
                                                    : Colors.white
                                                        .withOpacity(0.5),
                                              ),
                                        ),
                                        Text(
                                          '${stakingCurrencyWatch.min_staking_amount!.toStringAsFixed(walletData.precision)} ${walletData.id.toUpperCase()}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.75.sp,
                                                color: isLightTheme(context)
                                                    ? AppColors.aboutHeaderLight
                                                    : Colors.white
                                                        .withOpacity(0.5),
                                              ),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(
                                    height: 5..h,
                                  ),
                            loaderState.value == LoadState.loading
                                ? const CircularProgressIndicator()
                                : MainButton(
                                    onTap: isValidAmount.value
                                        ? () async {
                                            loaderState.value =
                                                LoadState.loading;

                                            var responseCreateStake =
                                                await service.createStake(
                                              currencyId: walletData.id,
                                              amount: double.parse(
                                                  amountController.text),
                                            );

                                            if (responseCreateStake is String) {
                                              updateStakingCurrency();

                                              amountController.text = 0
                                                  .toStringAsFixed(
                                                      walletData.precision);
                                              isValidAmount.value = false;

                                              final snackBar = SnackBar(
                                                elevation: 0,
                                                clipBehavior: Clip.none,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                padding: EdgeInsets.only(
                                                  bottom:
                                                      // ignore: use_build_context_synchronously
                                                      MediaQuery.viewInsetsOf(
                                                                  context)
                                                              .bottom +
                                                          30
                                                        ..h,
                                                ),
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: AwesomeSnackbarContent(
                                                  titleFontSize: 20.sp,
                                                  messageFontSize: 15.sp,
                                                  title: tr(
                                                      'snack_bar_message.success.success'),
                                                  message:
                                                      'Your staking request is successful'
                                                          .hardcoded,
                                                  contentType:
                                                      ContentType.success,
                                                ),
                                              );

                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(snackBar);
                                            } else {
                                              final snackBar = SnackBar(
                                                elevation: 0,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                clipBehavior: Clip.none,
                                                padding: EdgeInsets.only(
                                                  bottom:
                                                      // ignore: use_build_context_synchronously
                                                      MediaQuery.viewInsetsOf(
                                                                  context)
                                                              .bottom +
                                                          30
                                                        ..h,
                                                ),
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: AwesomeSnackbarContent(
                                                  titleFontSize: 20.sp,
                                                  messageFontSize: 15.sp,
                                                  title: tr(
                                                      'snack_bar_message.errors.error'),
                                                  message:
                                                      'Your staking request was not processed, please try again'
                                                          .hardcoded,
                                                  contentType:
                                                      ContentType.failure,
                                                ),
                                              );

                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(snackBar);
                                            }

                                            loaderState.value =
                                                LoadState.notLoading;
                                          }
                                        : null,
                                    text: 'Submit'.hardcoded,
                                    height: 45..h,
                                    color: MainColorsApp.accentColor,
                                    disableColor: isLightTheme(context)
                                        ? AppColors.mainBackgroundLightColor
                                        : AppColors.whiteColor
                                            .withOpacity(0.05),
                                    fontSize: 15,
                                    borderRadius: 25,
                                  ),
                            const StakingIconContainerMobile(),
                            ActiveStakingRowMobile(
                              activeStaking:
                                  '${numberFormatWithPrecision(walletData.precision).format(stakingCurrencyWatch.active_balance)} ${walletData.id.toUpperCase()}',
                            ),
                            SizedBox(
                              height: 15..h,
                            ),
                            const StakingRewardDetailsMobile(),
                            stakingCurrencyWatch.locked_balance! > 0
                                ? Padding(
                                    padding: EdgeInsets.only(top: 15..h),
                                    child: StakingPendingDetailsMobile(
                                      updateStakingCurrency:
                                          updateStakingCurrency,
                                      nextStakingCalc: stakingCurrencyWatch
                                          .next_staking_calc!
                                          .toInt(),
                                    ),
                                  )
                                : const SizedBox(),
                            stakingCurrencyWatch.next_reward_amount! > 0
                                ? Padding(
                                    padding: EdgeInsets.only(top: 15..h),
                                    child: StakingNextRewardDetailsMobile(
                                      updateStakingCurrency:
                                          updateStakingCurrency,
                                      nextStakingCalc: stakingCurrencyWatch
                                          .next_staking_calc!
                                          .toInt(),
                                    ),
                                  )
                                : const SizedBox(),
                            stakingCurrencyWatch.active_balance! +
                                        stakingCurrencyWatch.locked_balance! >
                                    0
                                ? Padding(
                                    padding: EdgeInsets.only(top: 25..h),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(10.r),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CloseStakingFromMobile(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 45..h,
                                        decoration: BoxDecoration(
                                          color: isLightTheme(context)
                                              ? AppColors
                                                  .mainBackgroundLightColor
                                              : AppColors.whiteColor
                                                  .withOpacity(0.05),
                                          borderRadius:
                                              BorderRadius.circular(25.r),
                                          border: Border.all(
                                            width: 2.w,
                                            color: MainColorsApp.accentColor,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Unstake'.hardcoded,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: -0.75.sp,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        );
                },
                error: (error, _) {
                  return UserAppError(
                    errorMessage: error.toString(),
                  );
                },
                loading: () => Padding(
                  padding: EdgeInsets.only(top: 30..h),
                  child: const MainLoaderMobile(
                    loaderSize: 100,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

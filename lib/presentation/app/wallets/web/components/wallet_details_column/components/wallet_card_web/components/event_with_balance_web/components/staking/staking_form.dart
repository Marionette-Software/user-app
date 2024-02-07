import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
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
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/staking/components/active_staking.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/staking/components/close_staking_form.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/staking/components/staking_amount_input.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/staking/components/staking_icon_container.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/staking/components/staking_next_reward_details.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/staking/components/staking_panding_details.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/staking/components/staking_reward_details.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/staking/components/unstaking_details.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class StakingFormWeb extends HookConsumerWidget {
  const StakingFormWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 600.w,
        child: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
            bottom: 50.h,
            left: 25.w,
            right: 25.w,
          ),
          child: getCurrencyStakingFuture.when(
            data: (_) {
              return stakingCurrencyWatch.isUnstakingProcess!
                  ? UnstackingDetailsWeb(
                      nextStakingCalc:
                          stakingCurrencyWatch.next_staking_calc!.toInt(),
                    )
                  : Column(
                      children: [
                        Text(
                          stakingCurrencyWatch.locked_balance! +
                                      stakingCurrencyWatch.active_balance! >
                                  0
                              ? 'Top-up Staking'
                              : 'Enter Staking'.hardcoded,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: isLightTheme(context)
                                        ? AppColors.darkColorText
                                        : AppColors.whiteColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30.sp,
                                    letterSpacing: -1.5.sp,
                                  ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        StakingAmountInputWeb(
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
                          height: 5.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: isLightTheme(context)
                                ? AppColors.mainBackgroundLightColor
                                : AppColors.whiteColor.withOpacity(0.25),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${tr('wallet.available')} ${numberFormatWithPrecision(walletData.precision).format(walletBalance)} ${walletData.id.toUpperCase()}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.9.sp,
                                  color: isLightTheme(context)
                                      ? AppColors.aboutHeaderLight
                                      : Colors.white.withOpacity(0.5),
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        (stakingCurrencyWatch.locked_balance! +
                                    stakingCurrencyWatch.active_balance! <=
                                0)
                            ? Padding(
                                padding: EdgeInsets.only(bottom: 24.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Minimum staking:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.9.sp,
                                            color: isLightTheme(context)
                                                ? AppColors.aboutHeaderLight
                                                : Colors.white.withOpacity(0.5),
                                          ),
                                    ),
                                    Text(
                                      '${stakingCurrencyWatch.min_staking_amount!.toStringAsFixed(walletData.precision)} ${walletData.id.toUpperCase()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.9.sp,
                                            color: isLightTheme(context)
                                                ? AppColors.aboutHeaderLight
                                                : Colors.white.withOpacity(0.5),
                                          ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(
                                height: 10.h,
                              ),
                        loaderState.value == LoadState.loading
                            ? const CircularProgressIndicator()
                            : MainButton(
                                onTap: isValidAmount.value
                                    ? () async {
                                        loaderState.value = LoadState.loading;

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
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.transparent,
                                            content: AwesomeSnackbarContent(
                                              titleFontSize: 30.sp,
                                              messageFontSize: 20.sp,
                                              title: tr(
                                                  'snack_bar_message.success.success'),
                                              message:
                                                  'Your staking request is successful'
                                                      .hardcoded,
                                              contentType: ContentType.success,
                                            ),
                                          );

                                          ScaffoldMessenger.of(context)
                                            ..hideCurrentSnackBar()
                                            ..showSnackBar(snackBar);
                                        } else {
                                          final snackBar = SnackBar(
                                            elevation: 0,
                                            clipBehavior: Clip.none,
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.transparent,
                                            content: AwesomeSnackbarContent(
                                              titleFontSize: 30.sp,
                                              messageFontSize: 20.sp,
                                              title: tr(
                                                  'snack_bar_message.errors.error'),
                                              message:
                                                  'Your staking request was not processed, please try again'
                                                      .hardcoded,
                                              contentType: ContentType.failure,
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
                                height: 60.h,
                                color: MainColorsApp.accentColor,
                                disableColor: isLightTheme(context)
                                    ? AppColors.mainBackgroundLightColor
                                    : AppColors.whiteColor.withOpacity(0.05),
                                fontSize: 20,
                                borderRadius: 10,
                              ),
                        StakingIconContainerWeb(),
                        ActiveStakingRowWeb(
                          activeStaking:
                              '${numberFormatWithPrecision(walletData.precision).format(stakingCurrencyWatch.active_balance)} ${walletData.id.toUpperCase()}',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const StakingRewardDetailsWeb(),
                        stakingCurrencyWatch.locked_balance! > 0
                            ? Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: StakingPendingDetailsWeb(
                                  updateStakingCurrency: updateStakingCurrency,
                                  nextStakingCalc: stakingCurrencyWatch
                                      .next_staking_calc!
                                      .toInt(),
                                ),
                              )
                            : const SizedBox(),
                        stakingCurrencyWatch.next_reward_amount! > 0
                            ? Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: StakingNextRewardDetailsWeb(
                                  updateStakingCurrency: updateStakingCurrency,
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
                                padding: EdgeInsets.only(top: 30.h),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10.r),
                                  onTap: () {
                                    context.pop();
                                    showDialog(
                                      barrierColor: AppColors.placeHolderGrey,
                                      context: context,
                                      builder: (context) =>
                                          const ModalWindowWallet(
                                        titleSize: 30,
                                        title: '',
                                        alertDialogSide: false,
                                        content: CloseStakingFormWeb(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                      color: isLightTheme(context)
                                          ? AppColors.mainBackgroundLightColor
                                          : AppColors.mainBackgroundDarkColor,
                                      borderRadius: BorderRadius.circular(10.r),
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
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: -1.sp,
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
            loading: () => const MainLoader(),
          ),
        ),
      ),
    );
  }
}

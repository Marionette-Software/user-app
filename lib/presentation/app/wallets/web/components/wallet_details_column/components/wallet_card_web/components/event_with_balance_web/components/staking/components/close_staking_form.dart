import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/infrastructure/wallet/wallet_service.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/staking/components/close_staking_amount_input.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class CloseStakingFormWeb extends HookConsumerWidget {
  const CloseStakingFormWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loaderState = useState(LoadState.notLoading);
    final walletData = ref.watch(walletDataStateNotifierProvider);

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
          child: Column(
            children: [
              Text(
                'Close Staking',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
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
              const CloseStakingAmountInputWeb(),
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
                height: 30.h,
              ),
              loaderState.value == LoadState.loading
                  ? const CircularProgressIndicator()
                  : MainButton(
                      disableColor: MainColorsApp.accentColor.withOpacity(0.5),
                      onTap: () async {
                        loaderState.value = LoadState.loading;
                        IWalletService service = WalletService();

                        var responseCancelStake = await service.cancelStake(
                            currencyId: walletData.id);

                        if (responseCancelStake is String) {
                          final snackBar = SnackBar(
                            elevation: 0,
                            clipBehavior: Clip.none,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              titleFontSize: 30.sp,
                              messageFontSize: 20.sp,
                              title: tr('snack_bar_message.success.success'),
                              message: 'Your unstaking request is successful'
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
                              title: tr('snack_bar_message.errors.error'),
                              message:
                                  'Your unstaking request was not processed, please try again'
                                      .hardcoded,
                              contentType: ContentType.failure,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        }

                        context.pop();

                        loaderState.value = LoadState.notLoading;
                      },
                      text: 'Submit'.hardcoded,
                      height: 60.h,
                      color: MainColorsApp.accentColor,
                      fontSize: 20,
                      borderRadius: 10,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

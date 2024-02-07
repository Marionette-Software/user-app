// ignore_for_file: use_build_context_synchronously

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
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/staking/componenst/close_staking_amount_input.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class CloseStakingFromMobile extends StatefulHookConsumerWidget {
  const CloseStakingFromMobile({
    super.key,
  });

  @override
  ConsumerState<CloseStakingFromMobile> createState() =>
      _CloseStakingFromMobileState();
}

class _CloseStakingFromMobileState
    extends ConsumerState<CloseStakingFromMobile> {
  @override
  Widget build(BuildContext context) {
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final loaderState = useState(LoadState.notLoading);

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
                  'Close Staking',
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
            padding: EdgeInsets.only(top: 30..h, left: 15.w, right: 15.w),
            child: Column(
              children: [
                const CloseStakingAmountInputMobile(),
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
                  height: 30..h,
                ),
                loaderState.value == LoadState.loading
                    ? const CircularProgressIndicator()
                    : MainButton(
                        disableColor:
                            MainColorsApp.accentColor.withOpacity(0.5),
                        onTap: () async {
                          loaderState.value = LoadState.loading;
                          IWalletService service = WalletService();

                          var responseCancelStake = await service.cancelStake(
                              currencyId: walletData.id);

                          if (responseCancelStake is String) {
                            final snackBar = SnackBar(
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              clipBehavior: Clip.none,
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.viewInsetsOf(context).bottom + 30
                                      ..h,
                              ),
                              content: AwesomeSnackbarContent(
                                titleFontSize: 20.sp,
                                messageFontSize: 15.sp,
                                title: tr('snack_bar_message.success.success'),
                                message: 'Your unstaking request is successful'
                                    .hardcoded,
                                contentType: ContentType.success,
                              ),
                            );

                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                            context.pop();
                            context.pop();
                          } else {
                            final snackBar = SnackBar(
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              clipBehavior: Clip.none,
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.viewInsetsOf(context).bottom + 30
                                      ..h,
                              ),
                              content: AwesomeSnackbarContent(
                                titleFontSize: 20.sp,
                                messageFontSize: 15.sp,
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

                          loaderState.value = LoadState.notLoading;
                        },
                        text: 'Submit'.hardcoded,
                        height: 45..h,
                        color: MainColorsApp.accentColor,
                        fontSize: 15,
                        borderRadius: 25,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

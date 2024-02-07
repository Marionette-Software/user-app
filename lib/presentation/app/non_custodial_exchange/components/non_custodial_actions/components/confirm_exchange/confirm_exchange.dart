import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_notifier.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_provider.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_progress_state.dart';
import 'package:user_app/infrastructure/non_custodial_exchange/non_custodial_exchange_service.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/confirm_exchange/components/result_row.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class ConfirmExchangeWeb extends HookConsumerWidget {
  const ConfirmExchangeWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyStateWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);

    final progressRead = ref.read(nonCustodialStateProvider.notifier);
    final progress = ref.read(nonCustodialProgressStateProvider.notifier);

    INonCustodialExchangeService service = NonCustodialExchangeService();

    return Container(
      width: 600.w,
      height: 325.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.w,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            isLightTheme(context)
                ? AppColors.whiteColor
                : AppColors.whiteColor.withOpacity(0.1),
            isLightTheme(context)
                ? AppColors.whiteColor
                : AppColors.whiteColor.withOpacity(0.05),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 26.h,
        ),
        child: Column(
          children: [
            ResultRowWeb(
              iconUrl: currencyStateWatch.selectedFromCurrency.iconUrl,
              title:
                  '${tr('non_custodial_exchange.request')} ${currencyStateWatch.selectedFromCurrency.id.toUpperCase()} ${tr('non_custodial_exchange.from')}:',
              address: currencyStateWatch.wcAddress,
            ),
            SizedBox(
              height: 25.h,
            ),
            ResultRowWeb(
              iconUrl: currencyStateWatch.selectedToCurrency.iconUrl,
              title:
                  '${tr('non_custodial_exchange.receive')} ${currencyStateWatch.selectedToCurrency.id.toUpperCase()} ${tr('non_custodial_exchange.to').toLowerCase()}:',
              address: currencyStateWatch.wcAddress,
            ),
            SizedBox(
              height: 25.h,
            ),
            SizedBox(
              height: 60.h,
              child: MainButton(
                onTap: () async {
                  progressRead.state = NonCustodialState.wCLoader;
                  progress.state++;
                  final createBeneficiaryResult = await service.createRecipient(
                    paymentInterfaceId: 'eth-mainnet-pi',
                    currencyId: currencyStateWatch.selectedToCurrency.id,
                    data: "{\"address\":\"${currencyStateWatch.wcAddress}\"}",
                    description: 'wallet connect',
                  );
                  if (createBeneficiaryResult is GraphQlError) {
                    final snackBar = SnackBar(
                      elevation: 0,
                      clipBehavior: Clip.none,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        titleFontSize: 30.sp,
                        messageFontSize: 20.sp,
                        title: tr('snack_bar_message.errors.error'),
                        message: createBeneficiaryResult.message,
                        contentType: ContentType.failure,
                      ),
                    );

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  } else {
                    final initNonCustodialExchangeResult =
                        await service.initNonCustodialExchange(
                      '1inch',
                      'eth-mainnet-pi',
                      currencyStateWatch.selectedFromCurrency.id,
                      currencyStateWatch.valueFrom,
                      0.01,
                      createBeneficiaryResult,
                    );
                    if (initNonCustodialExchangeResult is GraphQlError) {
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
                              tr('snack_bar_message.errors.not_enough_balance'),
                          contentType: ContentType.failure,
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);

                      progressRead.state = NonCustodialState.error;
                    }
                  }
                },
                text: tr('non_custodial_exchange.submit'),
                height: 60.h,
                color: Theme.of(context).primaryColorLight,
              ),
            )
          ],
        ),
      ),
    );
  }
}

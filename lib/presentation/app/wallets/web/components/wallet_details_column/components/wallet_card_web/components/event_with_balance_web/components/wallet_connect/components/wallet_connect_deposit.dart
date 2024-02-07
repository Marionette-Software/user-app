import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/get_deposit_wallet_connect_state_provider.dart';
import 'package:user_app/application/wallets/select_deposit_network_state_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/wallet/wallet_payment_interface.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_currency_chains_by_id.data.gql.dart';
import 'package:user_app/infrastructure/wallet/wallet_service.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/wallet_connect/components/components/choose_payment_interface_wallet_connect.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/wallet_connect/components/components/deposit_input.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/wallet_connect/components/components/scan_code_to_connect.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class WalletConnectDeposit extends HookConsumerWidget {
  const WalletConnectDeposit({
    super.key,
    required this.depositChains,
    required this.depositPaymentInterface,
  });
  final List<GGetCurrencyChainsDataData_currencyChains?> depositChains;
  final List<WalletPaymentInterface> depositPaymentInterface;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletStateWatch = ref.watch(walletDataStateNotifierProvider);
    final depositWalletWatch = ref.watch(getDepositWalletConnectStateProvider);

    final selectedPaymentInterfaceWatch =
        ref.watch(selectDepositNetworkStateProvider);
    var minValue = depositChains.isNotEmpty
        ? depositChains[selectedPaymentInterfaceWatch]!
            .currencyPaymentInterfaces!
            .first!
            .minDirectDepositAmount!
        : 0;

    var indexSelectedPaymentInterface = useState(0);
    var loaderStatus = useState(true);

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 600.w,
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${tr('wallet_connect.deposit')} ${walletStateWatch.name} (${walletStateWatch.id})',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: isLightTheme(context)
                            ? AppColors.darkColorText
                            : AppColors.whiteColor,
                        fontSize: 30.sp,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            DepositInput(
              coin: walletStateWatch.id,
              image: walletStateWatch.iconUrl,
              precision: walletStateWatch.precision,
              depositChains: depositChains,
              indexSelectedPaymentInterface: indexSelectedPaymentInterface,
            ),
            SizedBox(
              height: 25.h,
            ),
            ChoosePaymentInterfaceWalletConnect(
              depositChains: depositChains,
              loaderStatus: loaderStatus,
              indexSelectedPaymentInterface: indexSelectedPaymentInterface,
              withWalletConnect: true,
            ),
            depositChains.length == 1
                ? SizedBox(
                    height: 25.h,
                  )
                : Padding(
                    padding: EdgeInsets.only(left: 45.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            depositChains[indexSelectedPaymentInterface.value]!
                                .title!,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 15.sp,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
                                ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                        ],
                      ),
                    ),
                  ),
            SizedBox(
              width: 550.w,
              child: MainButton(
                disableColor: MainColorsApp.accentColor.withOpacity(0.5),
                onTap: () {
                  if (depositWalletWatch.isNotEmpty &&
                      double.parse(depositWalletWatch) != 0 &&
                      double.parse(depositWalletWatch) >= minValue) {
                    WalletService service = WalletService();

                    service
                        .getUrlWalletConnectById(
                          currencyPaymentInterface: depositChains[
                                  indexSelectedPaymentInterface.value]!
                              .currencyPaymentInterfaces!
                              .first!
                              .id!,
                        )
                        .then(
                          (value) => {
                            context.pop(),
                            showDialog(
                              barrierColor: AppColors.placeHolderGrey,
                              context: context,
                              builder: (context) => ModalWindowWallet(
                                titleSize: 30,
                                title: '',
                                backgroundColor: Colors.transparent,
                                content: ScanCodeToConnect(
                                  url: value.toString(),
                                  network: depositChains[
                                          indexSelectedPaymentInterface.value]!
                                      .title!,
                                  paymentInterfaceId: depositChains[
                                          indexSelectedPaymentInterface.value]!
                                      .currencyPaymentInterfaces!
                                      .first!
                                      .id!,
                                  currencyId: walletStateWatch.id,
                                ),
                              ),
                            ),
                          },
                        );
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
                        message: tr('wallet_connect.enter_amount'),
                        contentType: ContentType.failure,
                      ),
                    );

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  }
                },
                text: tr('wallet_connect.next'),
                height: 60.h,
                color: depositWalletWatch.isNotEmpty &&
                        double.parse(depositWalletWatch) != 0 &&
                        double.parse(depositWalletWatch) >= minValue
                    ? Theme.of(context).primaryColorLight
                    : Theme.of(context).primaryColorLight.withOpacity(0.6),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}

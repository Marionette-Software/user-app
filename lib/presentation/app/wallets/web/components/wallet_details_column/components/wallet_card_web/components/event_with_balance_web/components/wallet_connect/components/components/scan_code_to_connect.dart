import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:user_app/application/user_data/global_data_future_provider.dart';
import 'package:user_app/application/wallets/get_deposit_wallet_connect_state_provider.dart';
import 'package:user_app/application/wallets/get_status_payment_interface_state_provider.dart';
import 'package:user_app/application/wallets/receive_data_wc_state_provider.dart';
import 'package:user_app/application/wallets/waite_wallet_connect_state_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_wallet_connect_data_subcription.data.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_wallet_connect_data_subcription.req.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_wallet_connect_data_subcription.var.gql.dart';
import 'package:user_app/infrastructure/wallet/wallet_service.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/wallet_connect/components/components/waite_screen.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ScanCodeToConnect extends HookConsumerWidget {
  const ScanCodeToConnect({
    super.key,
    required this.url,
    required this.network,
    required this.paymentInterfaceId,
    required this.currencyId,
  });

  final String url;
  final String network;
  final String paymentInterfaceId;
  final String currencyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final globalData = ref.watch(configDataFutureProvider);
    final depositWalletWatch = ref.watch(getDepositWalletConnectStateProvider);
    final waiteUserWatch = ref.watch(waiteWalletConnectStateProvider);
    final waiteUserRead = ref.read(waiteWalletConnectStateProvider.notifier);
    final receiveDataWCRead = ref.read(receiveDataWCStateProvider.notifier);
    final receiveDataWCWatch = ref.watch(receiveDataWCStateProvider);
    final getStatusPaymentInterfaceRead =
        ref.read(getStatusPaymentInterfaceStateProvider.notifier);

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 600.w,
        height: 680.h,
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            waiteUserWatch == false
                ? Column(
                    children: [
                      SizedBox(
                        height: 72.h,
                        width: 305.w,
                        child: Text(
                          tr('wallet_connect.scan_code_to_connect'),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontSize: 30.sp,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 349.w,
                            height: 350.h,
                            child: SvgPicture.asset(scanBorder),
                          ),
                          QrImageView(
                            data: url,
                            gapless: true,
                            size: 306.w,
                            foregroundColor: isLightTheme(context)
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).primaryColorLight,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      InkWell(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: url)).then((_) {
                            final snackBar = SnackBar(
                              elevation: 0,
                              clipBehavior: Clip.none,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                titleFontSize: 30.sp,
                                messageFontSize: 20.sp,
                                title: tr('snack_bar_message.success.success'),
                                message: tr('wallet_connect.code_copied'),
                                contentType: ContentType.success,
                              ),
                            );

                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          });
                        },
                        child: Container(
                          width: 222.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              tr('wallet_connect.copy_address'),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tr('wallet_connect.selected_network') + network,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                ),
                          ),
                        ],
                      ),
                    ],
                  )
                : const WaiteComponent(),
            globalData.when(
              data: (data) {
                GlobalConfigData gData = data[Constants.globalConfig];
                UserConfigData uData = data[Constants.userConfig];
                return Operation(
                  client: subscriptionClient(gData.url),
                  operationRequest: GconnectToWalletReq(
                    (b) => b..vars.token = uData.token,
                  ),
                  builder: (
                    BuildContext context,
                    OperationResponse<GconnectToWalletData,
                            GconnectToWalletVars>?
                        response,
                    Object? error,
                  ) {
                    if (response!.data != null) {
                      Future(() {
                        waiteUserRead.state = true;
                      });
                      if (response.data!.walletToConnect!.paymentInterface ==
                          null) {
                        getStatusPaymentInterfaceRead.state = false;
                      } else {
                        getStatusPaymentInterfaceRead.state = true;
                        if (receiveDataWCWatch == true) {
                          WalletService service = WalletService();

                          service
                              .sendDepositRequestWalletConnect(
                                  currencyPaymentInterfaceId:
                                      paymentInterfaceId,
                                  address:
                                      response.data!.walletToConnect!.address!,
                                  amount: double.parse(depositWalletWatch))
                              .then((value) {
                            if (value == 'in_progress') {
                              final snackBar = SnackBar(
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  titleFontSize: 30.sp,
                                  messageFontSize: 20.sp,
                                  title:
                                      tr('snack_bar_message.success.success'),
                                  message:
                                      tr('wallet_connect.deposit_submitted'),
                                  contentType: ContentType.success,
                                ),
                              );
                              receiveDataWCRead.state = false;
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                              context.pop();
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
                                      tr('wallet_connect.rejected_transaction'),
                                  contentType: ContentType.failure,
                                ),
                              );
                              receiveDataWCRead.state = false;
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                              context.pop();
                            }
                          }).onError((error, stackTrace) {});
                        }
                      }
                    }
                    return const SizedBox();
                  },
                );
              },
              error: (error, stacktrace) {
                return const Text('error');
              },
              loading: () => const SizedBox(),
            ),
            SizedBox(
              height: 25.h,
            ),
          ],
        ),
      ),
    );
  }
}

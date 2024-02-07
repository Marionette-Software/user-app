import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/actions/wallet_actions.dart';
import 'package:user_app/application/wallets/generate_deposit_address_srare_notifier_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/wallet/wallet_payment_interface.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/generate_deposti_address.data.gql.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/choose_deposit_pi_web.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/deposit_web/copmponents/container_with_address.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/deposit_web/copmponents/deposit_important.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/deposit_web/copmponents/deposit_qr_code.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/deposit_web/copmponents/min_deposit_amount.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class DepositWeb extends HookConsumerWidget {
  const DepositWeb({
    required this.depositPaymentInterface,
    super.key,
  });

  final List<WalletPaymentInterface> depositPaymentInterface;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generateDepositAddressRead =
        ref.read(generateDepositAddressStateNotifierProvider.notifier);

    WalletActionsGeneral walletActionsGeneral = WalletActionsGeneral();

    var loaderStatus = useState(true);
    var indexSelectedPaymentInterface = useState(0);
    final walletStateWatch = ref.watch(walletDataStateNotifierProvider);

    final showQrCode = useState(false);

    selectPaymentInterface() async {
      var generateDepositAddress =
          await walletActionsGeneral.generateDepositAddress(
        currencyId: depositPaymentInterface.first.currency.id,
        paymentInterfaceId: depositPaymentInterface.first.paymentInterface.id,
      );
      if (generateDepositAddress
          is GGenerateDepositAddressData_generateWallet) {
        generateDepositAddressRead
            .updateGenerateDepositAddress(generateDepositAddress);
      } else {
        generateDepositAddressRead.updateGenerateDepositAddress(
          GGenerateDepositAddressData_generateWallet(),
        );
      }
      loaderStatus.value = false;
    }

    useEffect(() {
      selectPaymentInterface();
      return null;
    }, []);

    final generateDepositAddressWatch =
        ref.watch(generateDepositAddressStateNotifierProvider);

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 600.w,
        child: Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            bottom: 35.h,
          ),
          child: Column(
            children: [
              Text(
                '${tr('wallet_connect.deposit')} ${walletStateWatch.name} (${walletStateWatch.id})',
                maxLines: 1,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: isLightTheme(context)
                          ? AppColors.darkColorText
                          : AppColors.whiteColor,
                      fontSize: 30.sp,
                    ),
              ),
              SizedBox(
                height: 22.h,
              ),
              ChooseDepositPaymentInterfaceWeb(
                paymentInterfacesList: depositPaymentInterface,
                loaderStatus: loaderStatus,
                indexSelectedPaymentInterface: indexSelectedPaymentInterface,
                withWalletConnect: false,
              ),
              SizedBox(
                height: 22.h,
              ),
              loaderStatus.value
                  ? const MainLoader()
                  : generateDepositAddressWatch.deposit != null
                      ? Column(
                          children: [
                            const MinDepositAmount(),
                            Padding(
                              padding: EdgeInsets.only(top: 29.h),
                              child: const DepositImportant(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 25.h, bottom: 25.h),
                              child: Container(
                                width: 360.w,
                                height: 45.h,
                                decoration: BoxDecoration(
                                  color: isLightTheme(context)
                                      ? AppColors.separatorLightTheme
                                      : AppColors.whiteColor.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(25.r),
                                ),
                                child: Row(children: [
                                  InkWell(
                                    onTap: () {
                                      showQrCode.value = true;
                                    },
                                    borderRadius: BorderRadius.circular(25.r),
                                    child: Container(
                                      width: 180.w,
                                      height: 45.h,
                                      decoration: BoxDecoration(
                                        color: showQrCode.value
                                            ? MainColorsApp.accentColor
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(25.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Scan QR-code'.hardcoded,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                fontSize: 20.sp,
                                                color: !showQrCode.value
                                                    ? isLightTheme(context)
                                                        ? AppColors
                                                            .aboutHeaderLight
                                                        : AppColors.whiteColor
                                                    : AppColors.whiteColor,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -1.sp,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showQrCode.value = false;
                                    },
                                    borderRadius: BorderRadius.circular(25.r),
                                    child: Container(
                                      width: 180.w,
                                      height: 45.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25.r),
                                        color: showQrCode.value
                                            ? Colors.transparent
                                            : MainColorsApp.accentColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Copy address'.hardcoded,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                fontSize: 20.sp,
                                                color: showQrCode.value
                                                    ? isLightTheme(context)
                                                        ? AppColors
                                                            .aboutHeaderLight
                                                        : AppColors.whiteColor
                                                    : AppColors.whiteColor,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -1.sp,
                                              ),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                            showQrCode.value
                                ? const DepositQrCodeWeb()
                                : const ContainerWithAddress()
                          ],
                        )
                      : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

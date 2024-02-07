import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/actions/wallet_actions.dart';
import 'package:user_app/application/wallets/generate_deposit_address_srare_notifier_provider.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/generate_deposti_address.data.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_currency_chains_by_id.data.gql.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ChoosePaymentInterfaceWalletConnect extends HookConsumerWidget {
  const ChoosePaymentInterfaceWalletConnect({
    Key? key,
    required this.depositChains,
    required this.loaderStatus,
    required this.indexSelectedPaymentInterface,
    required this.withWalletConnect,
  }) : super(key: key);

  final List<GGetCurrencyChainsDataData_currencyChains?> depositChains;
  final ValueNotifier<bool> loaderStatus;
  final ValueNotifier<int> indexSelectedPaymentInterface;
  final bool withWalletConnect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generateDepositAddressRead =
        ref.read(generateDepositAddressStateNotifierProvider.notifier);

    int paymentInterfacesListLength = depositChains.length;
    WalletActionsGeneral walletActionsGeneral = WalletActionsGeneral();

    return paymentInterfacesListLength == 1
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${tr('wallet.network')}:',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 20.sp),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                  right: 11.w,
                ),
                child: UserAppImage(
                  clipBehavior: Clip.hardEdge,
                  path: depositChains.first!.currencyPaymentInterfaces!.first!
                      .paymentInterface!.logoUrl!,
                  height: 25.h,
                  width: 25.h,
                  isNetwork: true,
                ),
              ),
              Text(
                '${depositChains.first!.currencyPaymentInterfaces!.first!.paymentInterface!.title!.split(' ').first} (${depositChains.first!.currencyPaymentInterfaces!.first!.paymentInterface!.subtitle})',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 20.sp,
                    ),
              ),
            ],
          )
        : Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 19.h,
                  top: 10.h,
                ),
                child: Text(
                  tr('wallet.select_network_for_transaction'),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 20.sp,
                      ),
                ),
              ),
              SizedBox(
                height: 60.h,
                child: Wrap(
                  runSpacing: 15.h,
                  spacing: 1.w,
                  alignment: WrapAlignment.center,
                  children: List.generate(
                    paymentInterfacesListLength,
                    (index) {
                      var item = depositChains[index];

                      return Padding(
                        padding: EdgeInsets.only(
                          left: 8.5.w,
                          right: 8.5.w,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10.r),
                          onTap: () async {
                            if (!withWalletConnect) {
                              loaderStatus.value = true;
                              var generateDepositAddress =
                                  await walletActionsGeneral
                                      .generateDepositAddress(
                                currencyId:
                                    item.currencyPaymentInterfaces!.first!.id!,
                                paymentInterfaceId: item
                                    .currencyPaymentInterfaces!
                                    .first!
                                    .paymentInterface!
                                    .id!,
                              );
                              if (generateDepositAddress
                                  is GGenerateDepositAddressData_generateWallet) {
                                generateDepositAddressRead
                                    .updateGenerateDepositAddress(
                                  generateDepositAddress,
                                );
                              } else {
                                generateDepositAddressRead
                                    .updateGenerateDepositAddress(
                                  GGenerateDepositAddressData_generateWallet(),
                                );
                              }
                              loaderStatus.value = false;
                            }
                            indexSelectedPaymentInterface.value = index;
                          },
                          child: Container(
                            width: 172.h,
                            height: 60.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: indexSelectedPaymentInterface.value ==
                                        index
                                    ? Theme.of(context).primaryColorLight
                                    : AppColors.whiteColor.withOpacity(0.25),
                                width: 1,
                              ),
                              color: isLightTheme(context)
                                  ? (indexSelectedPaymentInterface.value !=
                                          index
                                      ? cardColor
                                      : Theme.of(context).primaryColorLight)
                                  : (indexSelectedPaymentInterface.value !=
                                          index
                                      ? Colors.transparent
                                      : Theme.of(context).primaryColorLight),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                UserAppImage(
                                  clipBehavior: Clip.hardEdge,
                                  path: item!.currencyPaymentInterfaces!.first!
                                      .paymentInterface!.logoUrl!,
                                  isNetwork: true,
                                  width: 27.w,
                                  height: 27.h,
                                ),
                                SizedBox(
                                  width: 11.5.w,
                                ),
                                Text(
                                  item.currencyPaymentInterfaces!.first!
                                      .paymentInterface!.title!
                                      .split(' ')[0],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontSize: 20.sp,
                                        color: indexSelectedPaymentInterface
                                                    .value !=
                                                index
                                            ? Theme.of(context).primaryColor
                                            : AppColors.whiteColorText,
                                      ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
  }
}

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/actions/wallet_actions.dart';
import 'package:user_app/application/wallets/generate_deposit_address_srare_notifier_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/wallet/wallet_payment_interface.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/generate_deposti_address.data.gql.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/deposit/generated_address_deposit/components/%20qr_container.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/deposit/generated_address_deposit/components/important_container.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/deposit/generated_address_deposit/components/minimum_deposit_row.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/deposit/generated_address_deposit/components/row_with_address.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class GenerateAddressDepositMobile extends StatefulHookConsumerWidget {
  const GenerateAddressDepositMobile({
    required this.generatedAddressDepositPaymentInterface,
    super.key,
  });

  final List<WalletPaymentInterface> generatedAddressDepositPaymentInterface;

  @override
  ConsumerState<GenerateAddressDepositMobile> createState() =>
      _GenerateAddressDepositMobileState();
}

class _GenerateAddressDepositMobileState
    extends ConsumerState<GenerateAddressDepositMobile> {
  @override
  Widget build(BuildContext context) {
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final generateDepositAddressRead =
        ref.read(generateDepositAddressStateNotifierProvider.notifier);
    final generateDepositAddressWatch =
        ref.watch(generateDepositAddressStateNotifierProvider);

    WalletActionsGeneral walletActionsGeneral = WalletActionsGeneral();

    final loaderStatus = useState(true);
    final selectedPaPaymentInterface =
        useState(widget.generatedAddressDepositPaymentInterface.first);

    selectedPaymentInterfaceGenerateDepositAddress() async {
      var generateDepositAddress =
          await walletActionsGeneral.generateDepositAddress(
        currencyId: selectedPaPaymentInterface.value.currency.id,
        paymentInterfaceId:
            selectedPaPaymentInterface.value.paymentInterface.id,
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
      selectedPaymentInterfaceGenerateDepositAddress();
      return null;
    }, []);

    List<DropdownMenuItem<WalletPaymentInterface>> addDividersAfterItems() {
      final List<DropdownMenuItem<WalletPaymentInterface>> menuItems = [];
      for (final WalletPaymentInterface item
          in widget.generatedAddressDepositPaymentInterface) {
        menuItems.addAll(
          [
            DropdownMenuItem<WalletPaymentInterface>(
              value: item,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                ),
                child: Row(
                  children: [
                    UserAppImage(
                      clipBehavior: Clip.hardEdge,
                      path: item.paymentInterface.logoUrl,
                      width: 20.w,
                      height: 20..h,
                      isNetwork: true,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      '${item.paymentInterface.title} ${item.paymentInterface.subtitle}',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.75.sp,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            //If it's last item, we will not add Divider after it.
            if (item != widget.generatedAddressDepositPaymentInterface.last)
              DropdownMenuItem<WalletPaymentInterface>(
                enabled: false,
                child: Divider(
                  height: 2..h,
                  color: isLightTheme(context)
                      ? AppColors.whiteColor.withOpacity(0.5)
                      : AppColors.whiteColor.withOpacity(0.05),
                ),
              ),
          ],
        );
      }
      return menuItems;
    }

    List<double> getCustomItemsHeights() {
      final List<double> itemsHeights = [];
      for (int i = 0;
          i < (widget.generatedAddressDepositPaymentInterface.length * 2) - 1;
          i++) {
        if (i.isEven) {
          itemsHeights.add(58..h);
        }
        //Dividers indexes will be the odd indexes
        if (i.isOdd) {
          itemsHeights.add(1.h);
        }
      }
      return itemsHeights;
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
            padding: EdgeInsets.only(top: 15..h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 25.w,
                  ),
                  child: BackButtonMobile(
                    onTap: () => context.pop(),
                  ),
                ),
                Text(
                  'Receive ${walletData.id.toUpperCase()}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 15.sp,
                        letterSpacing: -0.75.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.center,
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
            padding: EdgeInsets.only(top: 20..h, left: 15.w, right: 15.w),
            child: Column(
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton2<WalletPaymentInterface>(
                    isDense: true,
                    isExpanded: true,
                    value: selectedPaPaymentInterface.value,
                    iconStyleData: const IconStyleData(
                      iconSize: 0.1,
                    ),
                    alignment: Alignment.center,
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        color: isLightTheme(context)
                            ? AppColors.mainBackgroundLightColor
                            : AppColors.mainBackgroundDarkColor,
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      offset: Offset(0, 50..h),
                    ),
                    buttonStyleData: ButtonStyleData(
                      width: double.infinity,
                      height: 45..h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: isLightTheme(context)
                            ? AppColors.whiteColor
                            : AppColors.mainBackgroundDarkColor,
                        border: Border.all(
                          width: 5.w,
                          color: isLightTheme(context)
                              ? AppColors.mainBackgroundLightColor
                              : AppColors.whiteColor.withOpacity(0.05),
                        ),
                      ),
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      customHeights: getCustomItemsHeights(),
                      padding: const EdgeInsets.all(0),
                    ),
                    items: addDividersAfterItems(),
                    onChanged: (value) {
                      selectedPaPaymentInterface.value = value!;
                      selectedPaymentInterfaceGenerateDepositAddress();
                      loaderStatus.value = true;
                    },
                  ),
                ),
                SizedBox(
                  height: 30..h,
                ),
                loaderStatus.value
                    ? Padding(
                        padding: EdgeInsets.only(top: 30..h),
                        child: const MainLoaderMobile(
                          loaderSize: 100,
                        ),
                      )
                    : generateDepositAddressWatch.deposit == null
                        ? const SizedBox()
                        : Column(
                            children: [
                              const QrContainerMobile(),
                              SizedBox(
                                height: 25..h,
                              ),
                              const RowWithAddressMobile(),
                              SizedBox(
                                height: 9..h,
                              ),
                              Container(
                                width: double.infinity,
                                height: 5..h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.r),
                                  color: isLightTheme(context)
                                      ? AppColors.mainBackgroundLightColor
                                      : AppColors.whiteColor.withOpacity(0.25),
                                ),
                              ),
                              SizedBox(
                                height: 15..h,
                              ),
                              const MinimumDepositRowMobile(),
                              SizedBox(
                                height: 15..h,
                              ),
                              const ImportantContainerMobile(),
                            ],
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

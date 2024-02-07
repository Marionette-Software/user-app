import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/get_deposit_wallet_connect_state_provider.dart';
import 'package:user_app/application/wallets/get_wallet_connect_selected_input.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_currency_chains_by_id.data.gql.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/helpers/formatters/format_string.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/formatters/text_input_formater.dart';

class DepositInput extends HookConsumerWidget {
  const DepositInput({
    super.key,
    required this.coin,
    required this.image,
    required this.precision,
    required this.indexSelectedPaymentInterface,
    required this.depositChains,
  });
  final String coin;
  final String image;
  final int precision;
  final List<GGetCurrencyChainsDataData_currencyChains?> depositChains;
  final ValueNotifier<int> indexSelectedPaymentInterface;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final depositWalletRead =
        ref.read(getDepositWalletConnectStateProvider.notifier);
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final selectedInputWalletConnectWatch =
        ref.watch(selectedInputWalletConnectStateProvider);
    final selectedInputWalletConnectRead =
        ref.read(selectedInputWalletConnectStateProvider.notifier);

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 45.w,
            ),
            Text(
              '${tr('wallet.minimum_deposit')} ${numberFormatWithPrecision(walletData.precision).format(depositChains[indexSelectedPaymentInterface.value]!.currencyPaymentInterfaces!.first!.minDirectDepositAmount!)} ${coin.toUpperCase()}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    fontSize: 15.sp,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          width: 550.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.25),
            ),
          ),
          child: Row(
            children: [
              Container(
                height: 80.h,
                width: 347.w,
                alignment: Alignment.centerLeft,
                child: Focus(
                  onFocusChange: (value) {
                    selectedInputWalletConnectRead.state = value;
                  },
                  child: TextField(
                    onChanged: (value) {
                      value = value == '.' ? '0.' : value;
                      depositWalletRead.state = value;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 28.h,
                        bottom: 28.h,
                        left: 23.w,
                      ),
                      hintText: selectedInputWalletConnectWatch
                          ? ''
                          : addCharactersToString(
                              '0.', '0', walletData.precision),
                      filled: true,
                      fillColor: Colors.transparent,
                      hintStyle:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Theme.of(context).primaryColorLight,
                                fontSize: 30.sp,
                              ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hoverColor: Colors.transparent,
                    ),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 30.sp,
                        ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      RegExInputFormatter.withRegex(
                        '^\$|^(0|([1-9.][0-9.]{0,}))(\\.[0-9]{0,})?\$',
                      ),
                      NumberTextInputFormatter(
                        decimalRange: precision,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              UserAppImage(
                path: image,
                width: 30.w,
                height: 30.h,
                isNetwork: true,
              ),
              SizedBox(
                width: 10.w,
              ),
              AutoSizeText(
                coin,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 30.sp,
                    ),
              ),
              SizedBox(
                width: 25.w,
              )
            ],
          ),
        ),
      ],
    );
  }
}

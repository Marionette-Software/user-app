import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/select_deposit_options_state_provider.dart';
import 'package:user_app/domain/wallet/wallet_payment_interface.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_currency_chains_by_id.data.gql.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/deposit_web/deposit_web.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/wallet_connect/components/components/select_deposit_option.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/wallet_connect/components/wallet_connect_deposit.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';

class WalletConnect extends HookConsumerWidget {
  const WalletConnect({
    super.key,
    required this.depositChains,
    required this.depositPaymentInterface,
  });
  final List<GGetCurrencyChainsDataData_currencyChains?> depositChains;
  final List<WalletPaymentInterface> depositPaymentInterface;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedWatch = ref.watch(selectDepositOptionsStateProvider);

    return Column(
      children: [
        MainDecorationContainerWeb(
          content: SizedBox(
            width: 600.w,
            child: const SelectDepositOption(),
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        selectedWatch == 0
            ? WalletConnectDeposit(
                depositChains: depositChains,
                depositPaymentInterface: depositPaymentInterface,
              )
            : DepositWeb(
                depositPaymentInterface: depositPaymentInterface,
              ),
      ],
    );
  }
}

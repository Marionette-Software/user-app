import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_withdraw_wallet_payment_interface.data.gql.dart';

final recipientsDataStateNotifierDataStateNotifierProvider = StateNotifierProvider.autoDispose<
    RecipientsDataStateNotifier,
    GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients>(
  (ref) => RecipientsDataStateNotifier(),
);

class RecipientsDataStateNotifier extends StateNotifier<
    GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients> {
  RecipientsDataStateNotifier()
      : super(
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients(),
        );

  void updateBeneficiariesData(
      GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients
          recipients) {
    state = recipients;
  }
}

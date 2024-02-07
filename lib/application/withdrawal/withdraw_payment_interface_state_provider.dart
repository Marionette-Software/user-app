import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/wallet/recipient.dart';
import 'package:user_app/domain/wallet/withdraw_payment_interface.dart';

final withdrawPaymentInterfaceNotifierProvider = StateNotifierProvider<
    WithdrawPaymentInterfaceNotifierProvider, WithdrawPaymentInterface>(
  (ref) => WithdrawPaymentInterfaceNotifierProvider(),
);

class WithdrawPaymentInterfaceNotifierProvider
    extends StateNotifier<WithdrawPaymentInterface> {
  WithdrawPaymentInterfaceNotifierProvider()
      : super(WithdrawPaymentInterface.initialData());

  void updateInterface(WithdrawPaymentInterface interface) {
    state = interface;
  }

  void updateRecipientList(Recipient recipient) {
    state.recipients = [recipient, ...state.recipients];
  }

  void deleteRecipient(String recipientId) {
    state.recipients = List<Recipient>.from(state.recipients)
      ..remove(
        state.recipients.firstWhere(
          (element) => element.id == recipientId,
        ),
      );
  }
}

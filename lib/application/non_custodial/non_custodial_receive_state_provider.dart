import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_receive_data.dart';

final nonCustodialReceiveNotifierProvider = StateNotifierProvider<
    NonCustodialReceiveNotifierProvider, NonCustodialReceiveDataState>(
  (ref) => NonCustodialReceiveNotifierProvider(),
);

class NonCustodialReceiveNotifierProvider
    extends StateNotifier<NonCustodialReceiveDataState> {
  NonCustodialReceiveNotifierProvider()
      : super(
          const NonCustodialReceiveDataState(
            amountFrom: '',
            amountTo: '',
            paymentInterfaceTitle: '',
            receiveAddress: '',
            recipientId: '',
            paymentInterfaceType: '',
            paymentInterfaceSubtitle: '',
          ),
        );

  void updateReceiveState(NonCustodialReceiveDataState receiveState) {
    state = NonCustodialReceiveDataState(
      recipientId: receiveState.recipientId,
      paymentInterfaceTitle: receiveState.paymentInterfaceTitle,
      receiveAddress: receiveState.receiveAddress,
      paymentInterfaceType: receiveState.paymentInterfaceType,
      paymentInterfaceSubtitle: receiveState.paymentInterfaceSubtitle,
      amountFrom: state.amountFrom,
      amountTo: state.amountTo,
    );
  }

  void updateReceiveAmountState(String amountTo, String amountFrom) {
    state = NonCustodialReceiveDataState(
      recipientId: state.recipientId,
      paymentInterfaceTitle: state.paymentInterfaceTitle,
      receiveAddress: state.receiveAddress,
      paymentInterfaceType: state.paymentInterfaceType,
      paymentInterfaceSubtitle: state.paymentInterfaceSubtitle,
      amountFrom: amountFrom,
      amountTo: amountTo,
    );
  }
}

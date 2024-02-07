import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_payment_interface.dart';

final nonCustodialPaymentInterfaceNotifierProvider = StateNotifierProvider<
    NonCustodialPaymentInterfaceNotifierProvider,
    NonCustodialPaymentInterfacesState>(
  (ref) => NonCustodialPaymentInterfaceNotifierProvider(),
);

class NonCustodialPaymentInterfaceNotifierProvider
    extends StateNotifier<NonCustodialPaymentInterfacesState> {
  NonCustodialPaymentInterfaceNotifierProvider()
      : super(
          const NonCustodialPaymentInterfacesState(
            id: '',
            logoUrl: '',
            title: '',
            subtitle: '',
            type: '',
          ),
        );

  void updateInterface(NonCustodialPaymentInterfacesState interface) {
    state = interface;
  }
}

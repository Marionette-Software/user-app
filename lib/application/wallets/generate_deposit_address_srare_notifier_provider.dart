import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/generate_deposti_address.data.gql.dart';

final generateDepositAddressStateNotifierProvider = StateNotifierProvider<
    GenerateDepositAddressStateNotifier,
    GGenerateDepositAddressData_generateWallet>(
  (ref) => GenerateDepositAddressStateNotifier(),
);

class GenerateDepositAddressStateNotifier
    extends StateNotifier<GGenerateDepositAddressData_generateWallet> {
  GenerateDepositAddressStateNotifier()
      : super(
          GGenerateDepositAddressData_generateWallet(),
        );

  void updateGenerateDepositAddress(
      GGenerateDepositAddressData_generateWallet generateDepositAddress) {
    state = generateDepositAddress;
  }
}

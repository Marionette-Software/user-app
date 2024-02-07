import 'package:equatable/equatable.dart';

class WalletHistoryRequest extends Equatable {
  const WalletHistoryRequest({
    required this.refresh,
    required this.walletId,
  });

  final String refresh;
  final String walletId;

  @override
  List<Object> get props => [
        refresh,
        walletId,
      ];
}

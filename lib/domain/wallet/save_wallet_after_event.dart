import 'package:hive/hive.dart';

part 'save_wallet_after_event.g.dart';

@HiveType(typeId: 3)
class SelectedWalletAfterEvent extends HiveObject {
  SelectedWalletAfterEvent({
    required this.walletId,
  });

  @HiveField(0)
  final String walletId;
}

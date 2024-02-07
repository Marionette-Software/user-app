import 'package:hive/hive.dart';

part 'stepper_progress.g.dart';

@HiveType(typeId: 2)
class StepperProgress extends HiveObject {
  StepperProgress({
    required this.authenticated,
    required this.isWalletConnect,
  });

  @HiveField(0)
  final String? authenticated;
  @HiveField(1)
  final String? isWalletConnect;
}

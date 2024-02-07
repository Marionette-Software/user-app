import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/infrastructure/filter/filter_operations.dart';

final filterOperationsStateProvider = StateProvider<FilterOperation>(
  (ref) => FilterOperation(
    id: 'move_to_advanced|move_from_advanced|custodial_withdrawal|custodial_deposit|exchange|deposit|staking_rewards|deposit_reward|trade_reward|trading',
    name: '',
    isSelected: false,
  ),
);

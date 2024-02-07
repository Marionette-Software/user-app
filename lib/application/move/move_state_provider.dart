import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/move/move_state.dart';

final moveStateProvider = StateProvider<MoveState>(
  (ref) => MoveState.primaryWallet,
);

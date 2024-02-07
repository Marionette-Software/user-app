import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_progress_state.dart';

final nonCustodialStateProvider = StateProvider<NonCustodialState>(
  (ref) => NonCustodialState.authentication,
);

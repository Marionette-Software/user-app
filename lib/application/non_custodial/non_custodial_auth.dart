import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/auth/auth_state.dart';

final nonCustodialAuthStateProvider = StateProvider<AuthState>(
  (ref) => AuthState.signUp,
);

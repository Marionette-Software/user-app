import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/auth/auth_state.dart';

final authControllerStateProvider = StateProvider<AuthState>(
  (ref) => AuthState.signIn,
);

final authMobileControllerStateProvider = StateProvider<AuthState>(
      (ref) => AuthState.signIn,
);


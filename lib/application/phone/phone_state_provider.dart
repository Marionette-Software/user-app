import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/phone/phone_state.dart';

final phoneStateProvider = StateProvider<PhoneState>(
  (ref) => PhoneState.invisible,
);

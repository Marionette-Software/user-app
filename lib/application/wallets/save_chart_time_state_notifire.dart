import 'package:hooks_riverpod/hooks_riverpod.dart';

final chartTimeStateProvider = StateProvider.autoDispose<String>(
  (ref) => '1d',
);

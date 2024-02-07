import 'package:hooks_riverpod/hooks_riverpod.dart';

final sendDocumentProvider = StateProvider<bool>(
  (ref) => false,
);

final sendProfileInfoProvider = StateProvider<bool>(
  (ref) => false,
);
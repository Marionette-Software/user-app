import 'package:hooks_riverpod/hooks_riverpod.dart';

final changeColorNotifierProvider =
    StateNotifierProvider<ChangeColorMarketsDataStateNotifier, bool>(
  (ref) => ChangeColorMarketsDataStateNotifier(),
);

class ChangeColorMarketsDataStateNotifier extends StateNotifier<bool> {
  ChangeColorMarketsDataStateNotifier() : super(false);

  void updateData(bool data) {
    state = data;
  }
}

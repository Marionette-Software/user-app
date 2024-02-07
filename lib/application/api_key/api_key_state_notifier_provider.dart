import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/api_key/api_key_state.dart';

final apiKeyStateNotifierProvider =
    StateNotifierProvider<ApiKeyStateNotifier, List<ApiKeyState>>(
  (ref) {
    return ApiKeyStateNotifier();
  },
);

class ApiKeyStateNotifier extends StateNotifier<List<ApiKeyState>> {
  ApiKeyStateNotifier() : super([]);

  void updateApiKeyState(List<ApiKeyState> apiKey) {
    state = apiKey;
  }

  void addApiKey(ApiKeyState apiKey) {
    state = List<ApiKeyState>.from(state)..insert(0, apiKey);
  }

  void removeApiKey(String deleteItemId) {
    state = List<ApiKeyState>.from(state)
      ..remove(
        state.firstWhere(
          (element) => element.id == deleteItemId,
        ),
      );
  }
}

import 'package:ferry/ferry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/api_key/api_key_state_notifier_provider.dart';
import 'package:user_app/domain/api_key/api_key_state.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/infrastructure/api_key/__generated__/get_api_key.data.gql.dart';
import 'package:user_app/infrastructure/api_key/__generated__/get_api_key.var.gql.dart';
import 'package:user_app/infrastructure/api_key/api_key_service.dart';

final getApiKeyFutureProvider =
    FutureProvider.autoDispose.family<List<ApiKeyState>, RefreshRequest>(
  (ref, request) async {
    IApiKeyService service = ApiKeyService();

    OperationResponse<GGetApiKeysData, GGetApiKeysVars> apiKeyResponse =
        await service.getApiKeys();

    var apiKey = apiKeyResponse.data!.apiKeys!.toList();
    List<ApiKeyState> apiKeyList = [];

    for (var element in apiKey) {
      apiKeyList.add(
        ApiKeyState(
          id: element!.id!,
          description: element.description!,
          expires: element.expires!,
          token: '',
          scope: element.scope!,
        ),
      );
    }

    ref
        .read(apiKeyStateNotifierProvider.notifier)
        .updateApiKeyState(apiKeyList);

    return apiKeyList;
  },
);

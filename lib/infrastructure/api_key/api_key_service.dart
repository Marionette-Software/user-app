import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/infrastructure/api_key/__generated__/create_api_key.req.gql.dart';
import 'package:user_app/infrastructure/api_key/__generated__/delete_api_key.req.gql.dart';
import 'package:user_app/infrastructure/api_key/__generated__/get_api_key.req.gql.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/presentation/helpers/set_error_code.dart';

abstract class IApiKeyService {
  Future<dynamic> createApiKey({
    required String description,
    required String otpCode,
  });
  Future<dynamic> getApiKeys();
  Future<dynamic> deleteApiKey(
    String id,
    String otpCode,
  );
}

class ApiKeyService extends IApiKeyService {
  @override
  Future<dynamic> createApiKey({
    required String description,
    required String otpCode,
  }) async {
    DateTime dateTime = DateTime.now();
    int sixMonthsLater =
        dateTime.add(const Duration(days: 30 * 6)).millisecondsSinceEpoch ~/
            1000;

    final response = await initClientWithHeader()
        .request(
          GCreateUserApiKeyReq(
            (b) => b
              ..vars.description = description
              ..vars.otp_code = otpCode
              ..vars.expires = sixMonthsLater
              ..vars.scope = 'trading',
          ),
        )
        .first;

    if (response.hasErrors) {
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.createApiKey;
    }
  }

  @override
  Future<dynamic> getApiKeys() async {
    final response = await initClientWithHeader()
        .request(
          GGetApiKeysReq(),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  @override
  Future<dynamic> deleteApiKey(
    String id,
    String otpCode,
  ) async {
    final response = await initClientWithHeader()
        .request(
          GDeleteApiKeyActionReq(
            (b) => b
              ..vars.id = id
              ..vars.otp_code = otpCode,
          ),
        )
        .first;

    if (response.hasErrors) {
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.deleteApiKey;
    }
  }
}

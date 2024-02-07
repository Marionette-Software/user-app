import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/infrastructure/change_password/__generated__/change_password_request.req.gql.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/presentation/helpers/set_error_code.dart';

class ChangePasswordService {
  Future<dynamic> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final response = await initClientWithHeader()
        .request(GChangeMyPasswordReq(
          (b) => b.vars
            ..old_password = oldPassword
            ..new_password = newPassword,
        ))
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }
}

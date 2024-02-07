import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/reset_password/recovery_password/__generated__/recovery_password_request.req.gql.dart';

class PasswordResetService {
  Future<dynamic> passwordReset(String newPassword, String token) async {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    final response = await initClient(globalData.url)
        .request(GRecoveryPasswordReq((b) => b
          ..vars.token = token
          ..vars.newPassword = newPassword))
        .first;

    if (response.hasErrors) {
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.recoveryPassword;
    }
  }
}

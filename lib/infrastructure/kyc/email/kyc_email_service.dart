import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/kyc/email/__generated__/resend_email.req.gql.dart';

class VerifyEmailService {
  Future<dynamic> verifyEmail({required String email}) async {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    final response = await initClient(globalData.url)
        .request(GResendEmailConfirmReq(((b) => b..vars.email = email)))
        .first;

    if (response.hasErrors) {
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.resendEmailConfirm!;
    }
  }
}

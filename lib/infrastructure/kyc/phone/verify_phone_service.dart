import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/kyc/phone/__generated__/app_phone.req.gql.dart';
import 'package:user_app/presentation/helpers/set_error_code.dart';

class AddPhoneService {
  Future<dynamic> addPhone(String number) async {
    var box =  Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;
    var userBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userBox.getAt(0)!;

    final response =
        await initClientWithHeader()
            .request(GAddPhoneReq((b) => b..vars.phone = number))
            .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.addPhone;
    }
  }
}

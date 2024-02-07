import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/kyc/document_type/__generated__/document_type_request.req.gql.dart';

class KYCDocumentTypesService {
  Future<dynamic> getDocumentType() async {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    final response =
        await initClient(globalData.url).request(GKYCDocumentTypesReq()).first;

    if (response.hasErrors) {
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }
}

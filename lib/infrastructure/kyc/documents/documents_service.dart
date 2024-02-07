import 'package:ferry/typed_links.dart';
import 'package:http/http.dart' as http;
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/kyc_document_type.dart/local/kyc_documents_state.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/kyc/documents/__generated__/add_document_request.req.gql.dart';
import 'package:user_app/presentation/helpers/set_error_code.dart';

class DocumentsApiService {
  Future<dynamic> uploadDocument(
    KycDocumentsState data,
    String token,
    String link,
    String number,
  ) async {
    for (int i = 0; i < data.uploadedImages.length; i++) {
      var multipartFile = http.MultipartFile.fromBytes(
        '',
        data.uploadedImages[i],
        filename: '${DateTime.now().second}.png',
      );

      var box =  Hive.box<GlobalConfigData>(Constants.globalConfig);
      GlobalConfigData globalData = box.getAt(0)!;
      var userBox = Hive.box<UserConfigData>(Constants.userConfig);
      UserConfigData userData = userBox.getAt(0)!;

      final response =
          await initClientWithHeader()
              .request(
                GAddUserDocumentReq(
                  (b) => b
                    ..vars.doc_type = data.documentType
                    ..vars.doc_expire = data.expirationDate
                    ..vars.doc_number = number
                    ..fetchPolicy = FetchPolicy.NoCache
                    ..vars.file = multipartFile,
                ),
              )
              .first;

      if (response.hasErrors) {
        setErrorCode(response.graphqlErrors![0].message);
        return GraphQlError(message: response.graphqlErrors![0].message);
      } else {
        return 'ok';
      }
    }
  }
}

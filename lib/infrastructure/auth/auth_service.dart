import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/platform/platform_utils.dart';
import 'package:user_app/infrastructure/auth/login/__generated__/login_request.req.gql.dart';
import 'package:user_app/infrastructure/auth/logout/__generated__/logout_request.req.gql.dart';
import 'package:user_app/infrastructure/auth/sign_up/__generated__/sign_up_request.req.gql.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/presentation/helpers/set_error_code.dart';

abstract class IAuthService {
  Future<dynamic> login({
    required String email,
    required String password,
    String code,
  });

  Future<dynamic> logout();

  Future<dynamic> signUp({
    required String email,
    required String password,
    String? referralId,
  });

  Future<void> downloadMobile({required String url});

  Future<void> downloadWeb({required String url});
}

class AuthService extends IAuthService {
  @override
  Future<dynamic> signUp({
    required String email,
    required String password,
    String? referralId,
  }) async {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    final response = await initClient(globalData.url)
        .request(GSignUpReq(
          (b) => b
            ..vars.email = email.toLowerCase()
            ..vars.password = password
            ..vars.referralId = referralId,
        ))
        .first;

    if (response.hasErrors) {
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  @override
  Future<dynamic> logout() async {
    final response = await initClientWithHeader().request(GLogoutReq()).first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<dynamic> login({
    required String email,
    required String password,
    String? code,
  }) async {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    final response = await initClient(globalData.url)
        .request(
          GSignInReq(
            (b) => b
              ..vars.email = email
              ..vars.password = password
              ..vars.code = code,
          ),
        )
        .first;

    if (response.hasErrors) {
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  @override
  Future<void> downloadMobile({required String url}) async {
    bool hasPermission = await _requestWritePermission();
    if (!hasPermission) return;

    Dio dio = Dio();
    var dir = await getApplicationDocumentsDirectory();

    // You should put the name you want for the file here.
    // Take in account the extension.
    String fileName = 'app_user_app.apk';
    await dio.download(url, "${dir.path}/$fileName");
    OpenFile.open("${dir.path}/$fileName");
  }

  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }

  @override
  Future<void> downloadWeb({required String url}) async {
    PlatformUtils.openLink(url);
  }
}

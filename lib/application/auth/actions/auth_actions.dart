import 'package:ferry/typed_links.dart';
import 'package:user_app/domain/auth/auth_status.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/request_status.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/non_custodial_exchange/stepper_progress.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/auth/auth_service.dart';
import 'package:user_app/infrastructure/auth/google_auth/__generated__/sign_in_with_google.req.gql.dart';
import 'package:user_app/infrastructure/auth/login/__generated__/login_request.data.gql.dart';
import 'package:user_app/infrastructure/auth/login/__generated__/login_request.var.gql.dart';
import 'package:user_app/infrastructure/auth/sign_up/__generated__/sign_up_request.data.gql.dart';
import 'package:user_app/infrastructure/auth/sign_up/__generated__/sign_up_request.var.gql.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/reset_password/ask_change_password/ask_change_password_service.dart';

abstract class AuthActionsInterface {
  Future<AuthorizationStatus> login({
    required String email,
    required String password,
    required bool loginWithNonCustodial,
  });

  Future<RequestStatus> logout();

  Future<dynamic> signUp({
    required String email,
    required String password,
    required String referralId,
  });

  Future<RequestStatus> askPasswordReset({
    required String email,
  });
  Future<dynamic> signInWithGoogle({
    required String token,
  });
}

class AuthActionsGeneral extends AuthActionsInterface {
  AuthActionsGeneral();

  @override
  Future<AuthorizationStatus> login({
    required String email,
    required String password,
    required bool loginWithNonCustodial,
  }) async {
    IAuthService service = AuthService();
    final response = await service.login(
      email: email,
      password: password,
    );
    if (response is OperationResponse<GSignInData, GSignInVars>) {
      try {
        UserConfigHelper.update(
          userId: response.data!.login!.id,
          token: response.data!.login!.token,
          selectedMarketId: null,
          userName: response.data!.login!.profiles!.isEmpty
              ? 'User'
              : '${response.data!.login!.profiles!.first!.first_name!} ${response.data!.login!.profiles!.first!.last_name!}',
        );
      } catch (e) {
        var userBox = await Hive.openBox<UserConfigData>(Constants.userConfig);
        var userConfigData = UserConfigData(
          userId: response.data!.login!.id,
          token: response.data!.login!.token,
          selectedMarketId: null,
          userName: response.data!.login!.profiles!.isEmpty
              ? 'User'
              : '${response.data!.login!.profiles!.first!.first_name!} ${response.data!.login!.profiles!.first!.last_name!}',
        );
        await userBox.add(userConfigData);
      }

      var nonCustodialBox = await Hive.openBox('nonCustodialBox');
      if (loginWithNonCustodial) {
        StepperProgress stepperProgress = StepperProgress(
          authenticated: 'true',
          isWalletConnect: 'false',
        );
        nonCustodialBox.putAt(0, stepperProgress);
      }

      return AuthorizationStatus.success;
    } else if (response is GraphQlError) {
      if (response.message == '2FA code is wrong or disabled') {
        return AuthorizationStatus.twoFa;
      } else {
        return AuthorizationStatus.error;
      }
    }
    return AuthorizationStatus.error;
  }

  @override
  Future<dynamic> signUp({
    required String email,
    required String password,
    String? referralId,
  }) async {
    IAuthService service = AuthService();
    final response = await service.signUp(
      email: email,
      password: password,
      referralId: referralId,
    );
    if (response is OperationResponse<GSignUpData, GSignUpVars>) {
      return RequestStatus.success;
    } else {
      return response;
    }
  }

  @override
  Future<RequestStatus> logout() async {
    IAuthService service = AuthService();
    final response = await service.logout();
    if (response) {
      UserConfigHelper.update(
        userId: null,
        token: null,
        selectedMarketId: null,
        userName: '',
      );
      return RequestStatus.success;
    } else {
      return RequestStatus.error;
    }
  }

  @override
  Future<RequestStatus> askPasswordReset({
    required String email,
  }) async {
    var service = AskPasswordResetAction();
    var response = await service.askPasswordReset(email);

    if (response is String) {
      return RequestStatus.success;
    } else {
      return RequestStatus.error;
    }
  }

  @override
  Future<dynamic> signInWithGoogle({
    required String token,
    String? code,
  }) async {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    final response = await initClient(globalData.url)
        .request(
          GSignUpWithGoogleReq(
            (b) => b
              ..vars.token = token
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
}

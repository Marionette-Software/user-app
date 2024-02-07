import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_currency_for_filter_history.req.gql.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_history_by_wallet.req.gql.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_ref_user.req.gql.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.req.gql.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_wallets.req.gql.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_wallet_history_kline.req.gql.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/user_get_request.req.gql.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/verify_user_email.req.gql.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/verify_user_phone.req.gql.dart';
import 'package:user_app/presentation/helpers/set_error_code.dart';

abstract class IUserService {
  Future<dynamic> getUserWallets();

  Future<dynamic> getUserProfile();

  Future<dynamic> getFullUserHistory({
    int page,
    int limit,
    String currencyId,
    String typeOperation,
    String formData,
    String toData,
  });

  Future<dynamic> getWalletHistory(String currencyId);

  Future<dynamic> verifyPhone(String phone, String code);

  Future<dynamic> verifyEmailToken(String token, bool isFront);

  Future<dynamic> getWalletHistoryKline(
      String market, String interval, int timeFrom, int timeTo);

  Future<dynamic> getRefUser();

  Future<dynamic> getCurrencyForFilterHistory();
}

class UserService extends IUserService {
  @override
  Future<dynamic> getUserProfile() async {
    var userBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userBox.getAt(0)!;

    final response = await initClientWithHeader()
        .request(GGetUpdateUserReq((b) => b..vars.id = userData.userId))
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  @override
  Future<dynamic> getUserWallets() async {
    var userBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userBox.getAt(0)!;
    final response = await initClientWithHeader()
        .request(GGetUserWalletsReq((b) => b..vars.id = userData.userId))
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  @override
  Future<dynamic> verifyPhone(String phone, String code) async {
    final response = await initClientWithHeader()
        .request(GVerifyUserPhoneNumberReq((b) => b
          ..vars.phone = phone
          ..vars.code = code))
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.verifyPhone!;
    }
  }

  @override
  Future<dynamic> getFullUserHistory({
    int? page,
    int? limit,
    String? currencyId,
    String? typeOperation,
    String formData = '',
    String toData = '',
  }) async {
    final response = await initClientWithHeader()
        .request(
          GGetUserHistoryReq(
            (b) => b
              ..vars.currencyId = currencyId
              ..vars.from = formData
              ..vars.to = toData
              ..vars.limit = limit
              ..vars.page = page
              ..vars.type = typeOperation,
          ),
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
  Future<dynamic> getCurrencyForFilterHistory() async {
    var userBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userBox.getAt(0)!;
    final response = await initClientWithHeader()
        .request(GGetCurrencyForFilterHistoryReq(
            (b) => b..vars.id = userData.userId))
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  @override
  Future<dynamic> getWalletHistory(String currencyId) async {
    final response = await initClientWithHeader()
        .request(GGetUserHistoryByIdReq(
          (b) => b..vars.currencyId = currencyId,
        ))
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  @override
  Future<dynamic> getWalletHistoryKline(
    String market,
    String interval,
    int timeFrom,
    int timeTo,
  ) async {
    final response = await initClientWithHeader()
        .request(
          GWalletHistoryKlineReq(
            (b) => b
              ..vars.market = market
              ..vars.interval = interval
              ..vars.timeFrom = timeFrom
              ..vars.timeTo = timeTo,
          ),
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
  Future verifyEmailToken(String token, bool isFront) async {
    final response = await initClientWithHeader()
        .request(
          GVerifyEmailTokenReq(
            (b) => b
              ..vars.token = token
              ..vars.isFront = isFront,
          ),
        )
        .first;

    // if (response.hasErrors) {
    //   setErrorCode(response.graphqlErrors![0].message);
    //   return GraphQlError(message: response.graphqlErrors![0].message);
    // } else {
    //   return response;
    // }
  }

  @override
  Future<dynamic> getRefUser() async {
    final response =
        await initClientWithHeader().request(GGetRefUserReq()).first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }
}

import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/cancel_stake.req.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/create_stake.req.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/fiat_deposit.req.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/generate_deposti_address.req.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_currency_chains_by_id.req.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_deposit_wallet_payment_interface.req.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_market_rate.req.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_staking_currency.req.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_user_balances.req.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_wallet_connect_data_subcription.req.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_wallet_connect_url_by_id.req.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_withdraw_wallet_payment_interface.req.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/send_user_direct_deposit.req.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/set_favorite_currency.req.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/signature_requst_wallet_connect.req.gql.dart';
import 'package:user_app/presentation/helpers/set_error_code.dart';

abstract class IWalletService {
  Future<dynamic> getMarketRate(String marketPair);
  Future generateDepositAddress({
    required String currencyId,
    required String paymentInterfaceId,
  });

  Future<dynamic> getUserBalances();

  Future<dynamic> getWalletConnectDetailsSubscription({required String token});

  Future<dynamic> signatureRequestWalletConnect({
    required int chainId,
    required String address,
  });

  Future<dynamic> sendDepositRequestWalletConnect({
    required String currencyPaymentInterfaceId,
    required String address,
    required double amount,
  });

  Future<dynamic> getCurrencyChains({required String currencyId});

  Future<dynamic> getUrlWalletConnectById({
    required String currencyPaymentInterface,
  });

  Future<dynamic> fiatDeposit({
    required String currencyId,
    required String paymentInterfaceId,
  });

  Future<dynamic> getStakingCurrency({
    required String currencyId,
  });

  Future<dynamic> createStake({
    required String currencyId,
    required double amount,
  });

  Future<dynamic> cancelStake({
    required String currencyId,
  });

  Future<dynamic> getWithdrawWalletPaymentInterface({
    required String currencyId,
  });

  Future<dynamic> getDepositWalletPaymentInterface({
    required String currencyId,
  });

  Future<dynamic> setFavoriteWallet({
    required String currencyId,
  });
}

class WalletService extends IWalletService {
  @override
  Future<dynamic> getUserBalances() async {
    var userBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userBox.getAt(0)!;
    final response = await initClientWithHeader()
        .request(GGetUserBalancesReq((b) => b..vars.id = userData.userId))
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  @override
  Future<dynamic> getMarketRate(String marketPair) async {
    final response = await initClientWithHeader()
        .request(
          GGetMarketRateReq(
            (b) => b..vars.market = marketPair,
          ),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.marketRate;
    }
  }

  @override
  Future generateDepositAddress({
    required String currencyId,
    required String paymentInterfaceId,
    bool isDonation = false,
  }) async {
    final response = await initClientWithHeader()
        .request(
          GGenerateDepositAddressReq(
            (b) => b
              ..vars.currencyId = currencyId
              ..vars.paymentInterfaceId = paymentInterfaceId
              ..vars.isDonation = isDonation,
          ),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.generateWallet;
    }
  }

  @override
  Future sendDepositRequestWalletConnect({
    required String currencyPaymentInterfaceId,
    required String address,
    required double amount,
  }) async {
    final response = await initClientWithHeader()
        .request(
          GsendUserDirectDepositReq(
            (b) => b
              ..vars.currencyPaymentInterfaceId = currencyPaymentInterfaceId
              ..vars.address = address
              ..vars.amount = amount,
          ),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.userDirectDeposit;
    }
  }

  @override
  Future getCurrencyChains({required String currencyId}) async {
    final response = await initClientWithHeader()
        .request(
          GGetCurrencyChainsDataReq((b) => b..vars.currencyId = currencyId),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!;
    }
  }

  @override
  Future getUrlWalletConnectById(
      {required String currencyPaymentInterface}) async {
    final response = await initClientWithHeader()
        .request(
          GgetWalletConnectURIByIdReq((b) =>
              b..vars.currencyPaymentInterface = currencyPaymentInterface),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.getWalletConnectURI;
    }
  }

  @override
  Future getWalletConnectDetailsSubscription({required String token}) async {
    var userBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userBox.getAt(0)!;
    final response = await initClientWithHeader()
        .request(
          GconnectToWalletReq(
            (b) => b..vars.token = userData.token!,
          ),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.walletToConnect;
    }
  }

  @override
  Future signatureRequestWalletConnect(
      {required int chainId, required String address}) async {
    final response = await initClientWithHeader()
        .request(
          GsignatureRequestWalletConnectReq((b) => b
            ..vars.chainId = chainId
            ..vars.address = address),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data;
    }
  }

  @override
  Future fiatDeposit({
    required String currencyId,
    required String paymentInterfaceId,
    bool isDonation = false,
  }) async {
    final response = await initClientWithHeader()
        .request(
          GFiatGenerateWalletReq(
            (b) => b
              ..vars.currencyId = currencyId
              ..vars.paymentInterfaceId = paymentInterfaceId
              ..vars.isDonation = isDonation,
          ),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      Map<String, dynamic> innerData =
          json.decode(response.data!.generateWallet!.deposit!.address!);

      return innerData;
    }
  }

  @override
  Future getStakingCurrency({required String currencyId}) async {
    final response = await initClientWithHeader()
        .request(
          GGetStakingCurrencyReq((b) => b..vars.id = currencyId),
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
  Future createStake({
    required String currencyId,
    required double amount,
  }) async {
    final response = await initClientWithHeader()
        .request(
          GCreateCurrencyStateReq(
            (b) => b
              ..vars.currencyId = currencyId
              ..vars.amount = amount,
          ),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.createStake;
    }
  }

  @override
  Future cancelStake({
    required String currencyId,
  }) async {
    final response = await initClientWithHeader()
        .request(
          GCancelCurrencyStateReq((b) => b..vars.currencyId = currencyId),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.cancelStake;
    }
  }

  @override
  Future getWithdrawWalletPaymentInterface({
    required String currencyId,
  }) async {
    final response = await initClientWithHeader()
        .request(
          GGetWithdrawWalletPaymentInterfaceReq(
            (b) => b..vars.id = currencyId,
          ),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(
        message: response.graphqlErrors![0].message,
      );
    } else {
      return response;
    }
  }

  @override
  Future getDepositWalletPaymentInterface({
    required String currencyId,
  }) async {
    final response = await initClientWithHeader()
        .request(
          GGetDepositWalletPaymentInterfaceReq(
            (b) => b..vars.id = currencyId,
          ),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(
        message: response.graphqlErrors![0].message,
      );
    } else {
      return response;
    }
  }

  @override
  Future setFavoriteWallet({
    required String currencyId,
  }) async {
    final response = await initClientWithHeader()
        .request(GSetFavoriteWalletReq((b) => b..vars.currencyId = currencyId))
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(
        message: response.graphqlErrors![0].message,
      );
    } else {
      return response;
    }
  }
}

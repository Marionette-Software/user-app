// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;
import 'package:user_app/infrastructure/__generated__/schema.schema.gql.dart'
    show
        GCurrencyPaymentInterfaceInput,
        GDate,
        GIcoLevelInput,
        GInputBonusDonate,
        GInputDonateProject,
        GOperationType,
        GRefGroupOTPaymentInput,
        GRefGroupPercentageInput,
        GTimestamp,
        GUserState,
        GUserType;
import 'package:user_app/infrastructure/api_key/__generated__/create_api_key.data.gql.dart'
    show GCreateUserApiKeyData, GCreateUserApiKeyData_createApiKey;
import 'package:user_app/infrastructure/api_key/__generated__/create_api_key.req.gql.dart'
    show GCreateUserApiKeyReq;
import 'package:user_app/infrastructure/api_key/__generated__/create_api_key.var.gql.dart'
    show GCreateUserApiKeyVars;
import 'package:user_app/infrastructure/api_key/__generated__/delete_api_key.data.gql.dart'
    show GDeleteApiKeyActionData;
import 'package:user_app/infrastructure/api_key/__generated__/delete_api_key.req.gql.dart'
    show GDeleteApiKeyActionReq;
import 'package:user_app/infrastructure/api_key/__generated__/delete_api_key.var.gql.dart'
    show GDeleteApiKeyActionVars;
import 'package:user_app/infrastructure/api_key/__generated__/get_api_key.data.gql.dart'
    show GGetApiKeysData, GGetApiKeysData_apiKeys;
import 'package:user_app/infrastructure/api_key/__generated__/get_api_key.req.gql.dart'
    show GGetApiKeysReq;
import 'package:user_app/infrastructure/api_key/__generated__/get_api_key.var.gql.dart'
    show GGetApiKeysVars;
import 'package:user_app/infrastructure/auth/google_auth/__generated__/sign_in_with_google.data.gql.dart'
    show GSignUpWithGoogleData, GSignUpWithGoogleData_signWithGoogle;
import 'package:user_app/infrastructure/auth/google_auth/__generated__/sign_in_with_google.req.gql.dart'
    show GSignUpWithGoogleReq;
import 'package:user_app/infrastructure/auth/google_auth/__generated__/sign_in_with_google.var.gql.dart'
    show GSignUpWithGoogleVars;
import 'package:user_app/infrastructure/auth/login/__generated__/login_request.data.gql.dart'
    show GSignInData, GSignInData_login, GSignInData_login_profiles;
import 'package:user_app/infrastructure/auth/login/__generated__/login_request.req.gql.dart'
    show GSignInReq;
import 'package:user_app/infrastructure/auth/login/__generated__/login_request.var.gql.dart'
    show GSignInVars;
import 'package:user_app/infrastructure/auth/logout/__generated__/logout_request.data.gql.dart'
    show GLogoutData;
import 'package:user_app/infrastructure/auth/logout/__generated__/logout_request.req.gql.dart'
    show GLogoutReq;
import 'package:user_app/infrastructure/auth/logout/__generated__/logout_request.var.gql.dart'
    show GLogoutVars;
import 'package:user_app/infrastructure/auth/sign_up/__generated__/sign_up_request.data.gql.dart'
    show GSignUpData;
import 'package:user_app/infrastructure/auth/sign_up/__generated__/sign_up_request.req.gql.dart'
    show GSignUpReq;
import 'package:user_app/infrastructure/auth/sign_up/__generated__/sign_up_request.var.gql.dart'
    show GSignUpVars;
import 'package:user_app/infrastructure/change_password/__generated__/change_password_request.data.gql.dart'
    show GChangeMyPasswordData;
import 'package:user_app/infrastructure/change_password/__generated__/change_password_request.req.gql.dart'
    show GChangeMyPasswordReq;
import 'package:user_app/infrastructure/change_password/__generated__/change_password_request.var.gql.dart'
    show GChangeMyPasswordVars;
import 'package:user_app/infrastructure/custodian_exchange/__generated__/custodial_exchange_request.data.gql.dart'
    show GUserExchangeData;
import 'package:user_app/infrastructure/custodian_exchange/__generated__/custodial_exchange_request.req.gql.dart'
    show GUserExchangeReq;
import 'package:user_app/infrastructure/custodian_exchange/__generated__/custodial_exchange_request.var.gql.dart'
    show GUserExchangeVars;
import 'package:user_app/infrastructure/exchange/__generated__/create_wallet_pair_request.data.gql.dart'
    show GInitiateNonCustodianExchangeData;
import 'package:user_app/infrastructure/exchange/__generated__/create_wallet_pair_request.req.gql.dart'
    show GInitiateNonCustodianExchangeReq;
import 'package:user_app/infrastructure/exchange/__generated__/create_wallet_pair_request.var.gql.dart'
    show GInitiateNonCustodianExchangeVars;
import 'package:user_app/infrastructure/exchange/__generated__/get_currencies_request.data.gql.dart'
    show GGetCurrenciesData, GGetCurrenciesData_currencies;
import 'package:user_app/infrastructure/exchange/__generated__/get_currencies_request.req.gql.dart'
    show GGetCurrenciesReq;
import 'package:user_app/infrastructure/exchange/__generated__/get_currencies_request.var.gql.dart'
    show GGetCurrenciesVars;
import 'package:user_app/infrastructure/kyc/document_type/__generated__/document_type_request.data.gql.dart'
    show GKYCDocumentTypesData;
import 'package:user_app/infrastructure/kyc/document_type/__generated__/document_type_request.req.gql.dart'
    show GKYCDocumentTypesReq;
import 'package:user_app/infrastructure/kyc/document_type/__generated__/document_type_request.var.gql.dart'
    show GKYCDocumentTypesVars;
import 'package:user_app/infrastructure/kyc/documents/__generated__/add_document_request.data.gql.dart'
    show GAddUserDocumentData;
import 'package:user_app/infrastructure/kyc/documents/__generated__/add_document_request.req.gql.dart'
    show GAddUserDocumentReq;
import 'package:user_app/infrastructure/kyc/documents/__generated__/add_document_request.var.gql.dart'
    show GAddUserDocumentVars;
import 'package:user_app/infrastructure/kyc/email/__generated__/resend_email.data.gql.dart'
    show GResendEmailConfirmData;
import 'package:user_app/infrastructure/kyc/email/__generated__/resend_email.req.gql.dart'
    show GResendEmailConfirmReq;
import 'package:user_app/infrastructure/kyc/email/__generated__/resend_email.var.gql.dart'
    show GResendEmailConfirmVars;
import 'package:user_app/infrastructure/kyc/identity/__generated__/add_profile_request.data.gql.dart'
    show GAddProfileData;
import 'package:user_app/infrastructure/kyc/identity/__generated__/add_profile_request.req.gql.dart'
    show GAddProfileReq;
import 'package:user_app/infrastructure/kyc/identity/__generated__/add_profile_request.var.gql.dart'
    show GAddProfileVars;
import 'package:user_app/infrastructure/kyc/phone/__generated__/app_phone.data.gql.dart'
    show GAddPhoneData;
import 'package:user_app/infrastructure/kyc/phone/__generated__/app_phone.req.gql.dart'
    show GAddPhoneReq;
import 'package:user_app/infrastructure/kyc/phone/__generated__/app_phone.var.gql.dart'
    show GAddPhoneVars;
import 'package:user_app/infrastructure/move/__generated__/move_from_funds_request.data.gql.dart'
    show GMoveFromAdvancedTradingFundsData;
import 'package:user_app/infrastructure/move/__generated__/move_from_funds_request.req.gql.dart'
    show GMoveFromAdvancedTradingFundsReq;
import 'package:user_app/infrastructure/move/__generated__/move_from_funds_request.var.gql.dart'
    show GMoveFromAdvancedTradingFundsVars;
import 'package:user_app/infrastructure/move/__generated__/move_to_funds_request.data.gql.dart'
    show GMoveToAdvancedTradingFundsData;
import 'package:user_app/infrastructure/move/__generated__/move_to_funds_request.req.gql.dart'
    show GMoveToAdvancedTradingFundsReq;
import 'package:user_app/infrastructure/move/__generated__/move_to_funds_request.var.gql.dart'
    show GMoveToAdvancedTradingFundsVars;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/create_recipient.data.gql.dart'
    show
        GCreateNonCustodialRecipientData,
        GCreateNonCustodialRecipientData_createRecipient;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/create_recipient.req.gql.dart'
    show GCreateNonCustodialRecipientReq;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/create_recipient.var.gql.dart'
    show GCreateNonCustodialRecipientVars;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/get_currencies.data.gql.dart'
    show
        GGetNonCustodialCurrenciesData,
        GGetNonCustodialCurrenciesData_currencies,
        GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces,
        GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface,
        GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain,
        GGetNonCustodialCurrenciesData_currencies_markets,
        GGetNonCustodialCurrenciesData_currencies_markets_base_currency,
        GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces,
        GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface,
        GGetNonCustodialCurrenciesData_currencies_markets_quote_currency,
        GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces,
        GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/get_currencies.req.gql.dart'
    show GGetNonCustodialCurrenciesReq;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/get_currencies.var.gql.dart'
    show GGetNonCustodialCurrenciesVars;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/init_non_custodial.data.gql.dart'
    show GInitNonCustodialData;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/init_non_custodial.req.gql.dart'
    show GInitNonCustodialReq;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/init_non_custodial.var.gql.dart'
    show GInitNonCustodialVars;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/init_non_custodial_classic.data.gql.dart'
    show
        GInitNonCustodialClassicData,
        GInitNonCustodialClassicData_initNonCustodialExchange;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/init_non_custodial_classic.req.gql.dart'
    show GInitNonCustodialClassicReq;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/init_non_custodial_classic.var.gql.dart'
    show GInitNonCustodialClassicVars;
import 'package:user_app/infrastructure/reset_password/ask_change_password/__generated__/ask_change_password_request.data.gql.dart'
    show GAskChangePasswordData;
import 'package:user_app/infrastructure/reset_password/ask_change_password/__generated__/ask_change_password_request.req.gql.dart'
    show GAskChangePasswordReq;
import 'package:user_app/infrastructure/reset_password/ask_change_password/__generated__/ask_change_password_request.var.gql.dart'
    show GAskChangePasswordVars;
import 'package:user_app/infrastructure/reset_password/recovery_password/__generated__/recovery_password_request.data.gql.dart'
    show GRecoveryPasswordData;
import 'package:user_app/infrastructure/reset_password/recovery_password/__generated__/recovery_password_request.req.gql.dart'
    show GRecoveryPasswordReq;
import 'package:user_app/infrastructure/reset_password/recovery_password/__generated__/recovery_password_request.var.gql.dart'
    show GRecoveryPasswordVars;
import 'package:user_app/infrastructure/trade/graphql/__generated__/cancel_all_orders.data.gql.dart'
    show GCancelAllOrdersData;
import 'package:user_app/infrastructure/trade/graphql/__generated__/cancel_all_orders.req.gql.dart'
    show GCancelAllOrdersReq;
import 'package:user_app/infrastructure/trade/graphql/__generated__/cancel_all_orders.var.gql.dart'
    show GCancelAllOrdersVars;
import 'package:user_app/infrastructure/trade/graphql/__generated__/cancel_order.data.gql.dart'
    show GCancelOrderActionData;
import 'package:user_app/infrastructure/trade/graphql/__generated__/cancel_order.req.gql.dart'
    show GCancelOrderActionReq;
import 'package:user_app/infrastructure/trade/graphql/__generated__/cancel_order.var.gql.dart'
    show GCancelOrderActionVars;
import 'package:user_app/infrastructure/trade/graphql/__generated__/create_order.data.gql.dart'
    show GCreateOrderData, GCreateOrderData_openOrder;
import 'package:user_app/infrastructure/trade/graphql/__generated__/create_order.req.gql.dart'
    show GCreateOrderReq;
import 'package:user_app/infrastructure/trade/graphql/__generated__/create_order.var.gql.dart'
    show GCreateOrderVars;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_market.data.gql.dart'
    show
        GGetMarketData,
        GGetMarketData_market,
        GGetMarketData_market_base_currency,
        GGetMarketData_market_marketDynamics,
        GGetMarketData_market_quote_currency;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_market.req.gql.dart'
    show GGetMarketReq;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_market.var.gql.dart'
    show GGetMarketVars;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_markets.data.gql.dart'
    show
        GGetMarketsData,
        GGetMarketsData_markets,
        GGetMarketsData_markets_base_currency,
        GGetMarketsData_markets_marketDynamics,
        GGetMarketsData_markets_quote_currency;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_markets.req.gql.dart'
    show GGetMarketsReq;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_markets.var.gql.dart'
    show GGetMarketsVars;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_private_trades_subscription.data.gql.dart'
    show GGetPrivateTradesData, GGetPrivateTradesData_privateTrades;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_private_trades_subscription.req.gql.dart'
    show GGetPrivateTradesReq;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_private_trades_subscription.var.gql.dart'
    show GGetPrivateTradesVars;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_user_order.data.gql.dart'
    show GGetUserOrderData, GGetUserOrderData_userOrder;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_user_order.req.gql.dart'
    show GGetUserOrderReq;
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_user_order.var.gql.dart'
    show GGetUserOrderVars;
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_dynamics_query.data.gql.dart'
    show GGetMarketDynamicsData, GGetMarketDynamicsData_marketDynamics;
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_dynamics_query.req.gql.dart'
    show GGetMarketDynamicsReq;
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_dynamics_query.var.gql.dart'
    show GGetMarketDynamicsVars;
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_rate_subscription.data.gql.dart'
    show GMarketRateData, GMarketRateData_marketRate;
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_rate_subscription.req.gql.dart'
    show GMarketRateReq;
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_rate_subscription.var.gql.dart'
    show GMarketRateVars;
import 'package:user_app/infrastructure/trade/graphql/__generated__/set_favorite_market.data.gql.dart'
    show GsetFavoriteMarketData;
import 'package:user_app/infrastructure/trade/graphql/__generated__/set_favorite_market.req.gql.dart'
    show GsetFavoriteMarketReq;
import 'package:user_app/infrastructure/trade/graphql/__generated__/set_favorite_market.var.gql.dart'
    show GsetFavoriteMarketVars;
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_balance_update_subscription.data.gql.dart'
    show
        GGetUserBalanceUpdatedData,
        GGetUserBalanceUpdatedData_userBalanceUpdated;
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_balance_update_subscription.req.gql.dart'
    show GGetUserBalanceUpdatedReq;
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_balance_update_subscription.var.gql.dart'
    show GGetUserBalanceUpdatedVars;
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_orders.data.gql.dart'
    show
        GGetUseOrdersData,
        GGetUseOrdersData_userOrders,
        GGetUseOrdersData_userOrders_result,
        GGetUseOrdersData_userOrders_result_Market,
        GGetUseOrdersData_userOrders_result_Market_base_currency,
        GGetUseOrdersData_userOrders_result_Market_marketDynamics,
        GGetUseOrdersData_userOrders_result_Market_quote_currency,
        GGetUseOrdersData_userOrders_result_user;
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_orders.req.gql.dart'
    show GGetUseOrdersReq;
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_orders.var.gql.dart'
    show GGetUseOrdersVars;
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_trades_history.data.gql.dart'
    show
        GGetUserTradesHistoryData,
        GGetUserTradesHistoryData_userTrades,
        GGetUserTradesHistoryData_userTrades_result;
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_trades_history.req.gql.dart'
    show GGetUserTradesHistoryReq;
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_trades_history.var.gql.dart'
    show GGetUserTradesHistoryVars;
import 'package:user_app/infrastructure/trade/graphql/__generated__/wallets_data.data.gql.dart'
    show
        GTradeWalletsDataData,
        GTradeWalletsDataData_user,
        GTradeWalletsDataData_user_currencies;
import 'package:user_app/infrastructure/trade/graphql/__generated__/wallets_data.req.gql.dart'
    show GTradeWalletsDataReq;
import 'package:user_app/infrastructure/trade/graphql/__generated__/wallets_data.var.gql.dart'
    show GTradeWalletsDataVars;
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_history.data.gql.dart'
    show
        GGetPublicTradesHistoryData,
        GGetPublicTradesHistoryData_publicTrades,
        GGetPublicTradesHistoryData_publicTrades_result;
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_history.req.gql.dart'
    show GGetPublicTradesHistoryReq;
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_history.var.gql.dart'
    show GGetPublicTradesHistoryVars;
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_subscription.data.gql.dart'
    show
        GPublicTradesSubscriptionData,
        GPublicTradesSubscriptionData_publicTrades;
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_subscription.req.gql.dart'
    show GPublicTradesSubscriptionReq;
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_subscription.var.gql.dart'
    show GPublicTradesSubscriptionVars;
import 'package:user_app/infrastructure/trade/graphql/market_dynamics/__generated__/market_dynamics_subscription.data.gql.dart'
    show GMarketDynamicsData, GMarketDynamicsData_marketDynamics;
import 'package:user_app/infrastructure/trade/graphql/market_dynamics/__generated__/market_dynamics_subscription.req.gql.dart'
    show GMarketDynamicsReq;
import 'package:user_app/infrastructure/trade/graphql/market_dynamics/__generated__/market_dynamics_subscription.var.gql.dart'
    show GMarketDynamicsVars;
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/diff_orderbook_subscription.data.gql.dart'
    show
        GPublicDiffOrderBookSubscriptionData,
        GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook,
        GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy,
        GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell;
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/diff_orderbook_subscription.req.gql.dart'
    show GPublicDiffOrderBookSubscriptionReq;
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/diff_orderbook_subscription.var.gql.dart'
    show GPublicDiffOrderBookSubscriptionVars;
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/full_orderbook_subscription.data.gql.dart'
    show
        GPublicFullOrderBookSubscriptionData,
        GPublicFullOrderBookSubscriptionData_publicFullOrderBook,
        GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy,
        GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell;
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/full_orderbook_subscription.req.gql.dart'
    show GPublicFullOrderBookSubscriptionReq;
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/full_orderbook_subscription.var.gql.dart'
    show GPublicFullOrderBookSubscriptionVars;
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/public_orderbook.data.gql.dart'
    show
        GPublicOrderBookData,
        GPublicOrderBookData_publicOrderBook,
        GPublicOrderBookData_publicOrderBook_buy,
        GPublicOrderBookData_publicOrderBook_sell;
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/public_orderbook.req.gql.dart'
    show GPublicOrderBookReq;
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/public_orderbook.var.gql.dart'
    show GPublicOrderBookVars;
import 'package:user_app/infrastructure/trade/graphql/user_orders/__generated__/private_orders_subscription.data.gql.dart'
    show
        GPrivateOrdersSubscriptionData,
        GPrivateOrdersSubscriptionData_privateOrders,
        GPrivateOrdersSubscriptionData_privateOrders_Market,
        GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency,
        GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics,
        GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency,
        GPrivateOrdersSubscriptionData_privateOrders_user;
import 'package:user_app/infrastructure/trade/graphql/user_orders/__generated__/private_orders_subscription.req.gql.dart'
    show GPrivateOrdersSubscriptionReq;
import 'package:user_app/infrastructure/trade/graphql/user_orders/__generated__/private_orders_subscription.var.gql.dart'
    show GPrivateOrdersSubscriptionVars;
import 'package:user_app/infrastructure/two_fa/__generated__/get_2fa_status.data.gql.dart'
    show GGet2FaStatusData, GGet2FaStatusData_user;
import 'package:user_app/infrastructure/two_fa/__generated__/get_2fa_status.req.gql.dart'
    show GGet2FaStatusReq;
import 'package:user_app/infrastructure/two_fa/__generated__/get_2fa_status.var.gql.dart'
    show GGet2FaStatusVars;
import 'package:user_app/infrastructure/two_fa/__generated__/request_2fa.data.gql.dart'
    show GRequest2FAData;
import 'package:user_app/infrastructure/two_fa/__generated__/request_2fa.req.gql.dart'
    show GRequest2FAReq;
import 'package:user_app/infrastructure/two_fa/__generated__/request_2fa.var.gql.dart'
    show GRequest2FAVars;
import 'package:user_app/infrastructure/upload_serializer.dart'
    show UploadSerializer;
import 'package:user_app/infrastructure/user/graphql/__generated__/add_user_profile.data.gql.dart'
    show GAddUserProfileData;
import 'package:user_app/infrastructure/user/graphql/__generated__/add_user_profile.req.gql.dart'
    show GAddUserProfileReq;
import 'package:user_app/infrastructure/user/graphql/__generated__/add_user_profile.var.gql.dart'
    show GAddUserProfileVars;
import 'package:user_app/infrastructure/user/graphql/__generated__/change_user_password.data.gql.dart'
    show GChangePasswordData;
import 'package:user_app/infrastructure/user/graphql/__generated__/change_user_password.req.gql.dart'
    show GChangePasswordReq;
import 'package:user_app/infrastructure/user/graphql/__generated__/change_user_password.var.gql.dart'
    show GChangePasswordVars;
import 'package:user_app/infrastructure/user/graphql/__generated__/enable_user_2fa.data.gql.dart'
    show GTurnOn2FAData;
import 'package:user_app/infrastructure/user/graphql/__generated__/enable_user_2fa.req.gql.dart'
    show GTurnOn2FAReq;
import 'package:user_app/infrastructure/user/graphql/__generated__/enable_user_2fa.var.gql.dart'
    show GTurnOn2FAVars;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_currency_for_filter_history.data.gql.dart'
    show
        GGetCurrencyForFilterHistoryData,
        GGetCurrencyForFilterHistoryData_user,
        GGetCurrencyForFilterHistoryData_user_currencies;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_currency_for_filter_history.req.gql.dart'
    show GGetCurrencyForFilterHistoryReq;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_currency_for_filter_history.var.gql.dart'
    show GGetCurrencyForFilterHistoryVars;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_history_by_wallet.data.gql.dart'
    show
        GGetUserHistoryByIdData,
        GGetUserHistoryByIdData_history,
        GGetUserHistoryByIdData_history_result,
        GGetUserHistoryByIdData_history_result_initiator_currency,
        GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces,
        GGetUserHistoryByIdData_history_result_initiator_payment_interface,
        GGetUserHistoryByIdData_history_result_result_currency;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_history_by_wallet.req.gql.dart'
    show GGetUserHistoryByIdReq;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_history_by_wallet.var.gql.dart'
    show GGetUserHistoryByIdVars;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_ref_user.data.gql.dart'
    show
        GGetRefUserData,
        GGetRefUserData_refUser,
        GGetRefUserData_refUser_referralsByLevel;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_ref_user.req.gql.dart'
    show GGetRefUserReq;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_ref_user.var.gql.dart'
    show GGetRefUserVars;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.data.gql.dart'
    show
        GGetUserHistoryData,
        GGetUserHistoryData_history,
        GGetUserHistoryData_history_result,
        GGetUserHistoryData_history_result_initiator_currency,
        GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfaces,
        GGetUserHistoryData_history_result_initiator_payment_interface,
        GGetUserHistoryData_history_result_result_currency;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.req.gql.dart'
    show GGetUserHistoryReq;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.var.gql.dart'
    show GGetUserHistoryVars;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_wallets.data.gql.dart'
    show
        GGetUserWalletsData,
        GGetUserWalletsData_user,
        GGetUserWalletsData_user_currencies,
        GGetUserWalletsData_user_currencies_markets,
        GGetUserWalletsData_user_currencies_markets_base_currency,
        GGetUserWalletsData_user_currencies_markets_marketDynamics,
        GGetUserWalletsData_user_currencies_markets_quote_currency;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_wallets.req.gql.dart'
    show GGetUserWalletsReq;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_wallets.var.gql.dart'
    show GGetUserWalletsVars;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_wallet_history_kline.data.gql.dart'
    show GWalletHistoryKlineData, GWalletHistoryKlineData_kline;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_wallet_history_kline.req.gql.dart'
    show GWalletHistoryKlineReq;
import 'package:user_app/infrastructure/user/graphql/__generated__/get_wallet_history_kline.var.gql.dart'
    show GWalletHistoryKlineVars;
import 'package:user_app/infrastructure/user/graphql/__generated__/user_get_request.data.gql.dart'
    show
        GGetUpdateUserData,
        GGetUpdateUserData_user,
        GGetUpdateUserData_user_documents,
        GGetUpdateUserData_user_labels,
        GGetUpdateUserData_user_phones,
        GGetUpdateUserData_user_profiles;
import 'package:user_app/infrastructure/user/graphql/__generated__/user_get_request.req.gql.dart'
    show GGetUpdateUserReq;
import 'package:user_app/infrastructure/user/graphql/__generated__/user_get_request.var.gql.dart'
    show GGetUpdateUserVars;
import 'package:user_app/infrastructure/user/graphql/__generated__/verify_user_email.data.gql.dart'
    show GVerifyEmailTokenData;
import 'package:user_app/infrastructure/user/graphql/__generated__/verify_user_email.req.gql.dart'
    show GVerifyEmailTokenReq;
import 'package:user_app/infrastructure/user/graphql/__generated__/verify_user_email.var.gql.dart'
    show GVerifyEmailTokenVars;
import 'package:user_app/infrastructure/user/graphql/__generated__/verify_user_phone.data.gql.dart'
    show GVerifyUserPhoneNumberData;
import 'package:user_app/infrastructure/user/graphql/__generated__/verify_user_phone.req.gql.dart'
    show GVerifyUserPhoneNumberReq;
import 'package:user_app/infrastructure/user/graphql/__generated__/verify_user_phone.var.gql.dart'
    show GVerifyUserPhoneNumberVars;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/cancel_stake.data.gql.dart'
    show GCancelCurrencyStateData;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/cancel_stake.req.gql.dart'
    show GCancelCurrencyStateReq;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/cancel_stake.var.gql.dart'
    show GCancelCurrencyStateVars;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/create_stake.data.gql.dart'
    show GCreateCurrencyStateData;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/create_stake.req.gql.dart'
    show GCreateCurrencyStateReq;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/create_stake.var.gql.dart'
    show GCreateCurrencyStateVars;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/fiat_deposit.data.gql.dart'
    show
        GFiatGenerateWalletData,
        GFiatGenerateWalletData_generateWallet,
        GFiatGenerateWalletData_generateWallet_deposit;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/fiat_deposit.req.gql.dart'
    show GFiatGenerateWalletReq;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/fiat_deposit.var.gql.dart'
    show GFiatGenerateWalletVars;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/generate_deposti_address.data.gql.dart'
    show
        GGenerateDepositAddressData,
        GGenerateDepositAddressData_generateWallet,
        GGenerateDepositAddressData_generateWallet_currency,
        GGenerateDepositAddressData_generateWallet_deposit,
        GGenerateDepositAddressData_generateWallet_paymentInterface;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/generate_deposti_address.req.gql.dart'
    show GGenerateDepositAddressReq;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/generate_deposti_address.var.gql.dart'
    show GGenerateDepositAddressVars;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_currency_chains_by_id.data.gql.dart'
    show
        GGetCurrencyChainsDataData,
        GGetCurrencyChainsDataData_currencyChains,
        GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces,
        GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_currency_chains_by_id.req.gql.dart'
    show GGetCurrencyChainsDataReq;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_currency_chains_by_id.var.gql.dart'
    show GGetCurrencyChainsDataVars;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_deposit_wallet_payment_interface.data.gql.dart'
    show
        GGetDepositWalletPaymentInterfaceData,
        GGetDepositWalletPaymentInterfaceData_currency,
        GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces,
        GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency,
        GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_deposit_wallet_payment_interface.req.gql.dart'
    show GGetDepositWalletPaymentInterfaceReq;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_deposit_wallet_payment_interface.var.gql.dart'
    show GGetDepositWalletPaymentInterfaceVars;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_market_rate.data.gql.dart'
    show GGetMarketRateData, GGetMarketRateData_marketRate;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_market_rate.req.gql.dart'
    show GGetMarketRateReq;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_market_rate.var.gql.dart'
    show GGetMarketRateVars;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_staking_currency.data.gql.dart'
    show GGetStakingCurrencyData, GGetStakingCurrencyData_stakingCurrency;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_staking_currency.req.gql.dart'
    show GGetStakingCurrencyReq;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_staking_currency.var.gql.dart'
    show GGetStakingCurrencyVars;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_user_balances.data.gql.dart'
    show
        GGetUserBalancesData,
        GGetUserBalancesData_user,
        GGetUserBalancesData_user_currencies;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_user_balances.req.gql.dart'
    show GGetUserBalancesReq;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_user_balances.var.gql.dart'
    show GGetUserBalancesVars;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_wallet_connect_data_subcription.data.gql.dart'
    show
        GconnectToWalletData,
        GconnectToWalletData_walletToConnect,
        GconnectToWalletData_walletToConnect_paymentInterface;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_wallet_connect_data_subcription.req.gql.dart'
    show GconnectToWalletReq;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_wallet_connect_data_subcription.var.gql.dart'
    show GconnectToWalletVars;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_wallet_connect_url_by_id.data.gql.dart'
    show GgetWalletConnectURIByIdData;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_wallet_connect_url_by_id.req.gql.dart'
    show GgetWalletConnectURIByIdReq;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_wallet_connect_url_by_id.var.gql.dart'
    show GgetWalletConnectURIByIdVars;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_withdraw_wallet_payment_interface.data.gql.dart'
    show
        GGetWithdrawWalletPaymentInterfaceData,
        GGetWithdrawWalletPaymentInterfaceData_currency,
        GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces,
        GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency,
        GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface,
        GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_withdraw_wallet_payment_interface.req.gql.dart'
    show GGetWithdrawWalletPaymentInterfaceReq;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_withdraw_wallet_payment_interface.var.gql.dart'
    show GGetWithdrawWalletPaymentInterfaceVars;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/send_user_direct_deposit.data.gql.dart'
    show GsendUserDirectDepositData;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/send_user_direct_deposit.req.gql.dart'
    show GsendUserDirectDepositReq;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/send_user_direct_deposit.var.gql.dart'
    show GsendUserDirectDepositVars;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/set_favorite_currency.data.gql.dart'
    show GSetFavoriteWalletData;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/set_favorite_currency.req.gql.dart'
    show GSetFavoriteWalletReq;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/set_favorite_currency.var.gql.dart'
    show GSetFavoriteWalletVars;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/signature_requst_wallet_connect.data.gql.dart'
    show
        GsignatureRequestWalletConnectData,
        GsignatureRequestWalletConnectData_connectWallet;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/signature_requst_wallet_connect.req.gql.dart'
    show GsignatureRequestWalletConnectReq;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/signature_requst_wallet_connect.var.gql.dart'
    show GsignatureRequestWalletConnectVars;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_all_balance_subscription.data.gql.dart'
    show GUserAllBalanceData, GUserAllBalanceData_userAllBalance;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_all_balance_subscription.req.gql.dart'
    show GUserAllBalanceReq;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_all_balance_subscription.var.gql.dart'
    show GUserAllBalanceVars;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_balances_subscription.data.gql.dart'
    show GUserBalancesData, GUserBalancesData_userBalanceUpdated;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_balances_subscription.req.gql.dart'
    show GUserBalancesReq;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/user_balances_subscription.var.gql.dart'
    show GUserBalancesVars;
import 'package:user_app/infrastructure/withdraw/__generated__/create_recipient_request.data.gql.dart'
    show GCreateRecipientData, GCreateRecipientData_createRecipient;
import 'package:user_app/infrastructure/withdraw/__generated__/create_recipient_request.req.gql.dart'
    show GCreateRecipientReq;
import 'package:user_app/infrastructure/withdraw/__generated__/create_recipient_request.var.gql.dart'
    show GCreateRecipientVars;
import 'package:user_app/infrastructure/withdraw/__generated__/create_withdraw_request.data.gql.dart'
    show GCreateWithdrawalData;
import 'package:user_app/infrastructure/withdraw/__generated__/create_withdraw_request.req.gql.dart'
    show GCreateWithdrawalReq;
import 'package:user_app/infrastructure/withdraw/__generated__/create_withdraw_request.var.gql.dart'
    show GCreateWithdrawalVars;
import 'package:user_app/infrastructure/withdraw/__generated__/delete_recipient_request.data.gql.dart'
    show GDeleteRecipientData;
import 'package:user_app/infrastructure/withdraw/__generated__/delete_recipient_request.req.gql.dart'
    show GDeleteRecipientReq;
import 'package:user_app/infrastructure/withdraw/__generated__/delete_recipient_request.var.gql.dart'
    show GDeleteRecipientVars;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..add(UploadSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GAddPhoneData,
  GAddPhoneReq,
  GAddPhoneVars,
  GAddProfileData,
  GAddProfileReq,
  GAddProfileVars,
  GAddUserDocumentData,
  GAddUserDocumentReq,
  GAddUserDocumentVars,
  GAddUserProfileData,
  GAddUserProfileReq,
  GAddUserProfileVars,
  GAskChangePasswordData,
  GAskChangePasswordReq,
  GAskChangePasswordVars,
  GCancelAllOrdersData,
  GCancelAllOrdersReq,
  GCancelAllOrdersVars,
  GCancelCurrencyStateData,
  GCancelCurrencyStateReq,
  GCancelCurrencyStateVars,
  GCancelOrderActionData,
  GCancelOrderActionReq,
  GCancelOrderActionVars,
  GChangeMyPasswordData,
  GChangeMyPasswordReq,
  GChangeMyPasswordVars,
  GChangePasswordData,
  GChangePasswordReq,
  GChangePasswordVars,
  GCreateCurrencyStateData,
  GCreateCurrencyStateReq,
  GCreateCurrencyStateVars,
  GCreateNonCustodialRecipientData,
  GCreateNonCustodialRecipientData_createRecipient,
  GCreateNonCustodialRecipientReq,
  GCreateNonCustodialRecipientVars,
  GCreateOrderData,
  GCreateOrderData_openOrder,
  GCreateOrderReq,
  GCreateOrderVars,
  GCreateRecipientData,
  GCreateRecipientData_createRecipient,
  GCreateRecipientReq,
  GCreateRecipientVars,
  GCreateUserApiKeyData,
  GCreateUserApiKeyData_createApiKey,
  GCreateUserApiKeyReq,
  GCreateUserApiKeyVars,
  GCreateWithdrawalData,
  GCreateWithdrawalReq,
  GCreateWithdrawalVars,
  GCurrencyPaymentInterfaceInput,
  GDate,
  GDeleteApiKeyActionData,
  GDeleteApiKeyActionReq,
  GDeleteApiKeyActionVars,
  GDeleteRecipientData,
  GDeleteRecipientReq,
  GDeleteRecipientVars,
  GFiatGenerateWalletData,
  GFiatGenerateWalletData_generateWallet,
  GFiatGenerateWalletData_generateWallet_deposit,
  GFiatGenerateWalletReq,
  GFiatGenerateWalletVars,
  GGenerateDepositAddressData,
  GGenerateDepositAddressData_generateWallet,
  GGenerateDepositAddressData_generateWallet_currency,
  GGenerateDepositAddressData_generateWallet_deposit,
  GGenerateDepositAddressData_generateWallet_paymentInterface,
  GGenerateDepositAddressReq,
  GGenerateDepositAddressVars,
  GGet2FaStatusData,
  GGet2FaStatusData_user,
  GGet2FaStatusReq,
  GGet2FaStatusVars,
  GGetApiKeysData,
  GGetApiKeysData_apiKeys,
  GGetApiKeysReq,
  GGetApiKeysVars,
  GGetCurrenciesData,
  GGetCurrenciesData_currencies,
  GGetCurrenciesReq,
  GGetCurrenciesVars,
  GGetCurrencyChainsDataData,
  GGetCurrencyChainsDataData_currencyChains,
  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces,
  GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface,
  GGetCurrencyChainsDataReq,
  GGetCurrencyChainsDataVars,
  GGetCurrencyForFilterHistoryData,
  GGetCurrencyForFilterHistoryData_user,
  GGetCurrencyForFilterHistoryData_user_currencies,
  GGetCurrencyForFilterHistoryReq,
  GGetCurrencyForFilterHistoryVars,
  GGetDepositWalletPaymentInterfaceData,
  GGetDepositWalletPaymentInterfaceData_currency,
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces,
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency,
  GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface,
  GGetDepositWalletPaymentInterfaceReq,
  GGetDepositWalletPaymentInterfaceVars,
  GGetMarketData,
  GGetMarketData_market,
  GGetMarketData_market_base_currency,
  GGetMarketData_market_marketDynamics,
  GGetMarketData_market_quote_currency,
  GGetMarketDynamicsData,
  GGetMarketDynamicsData_marketDynamics,
  GGetMarketDynamicsReq,
  GGetMarketDynamicsVars,
  GGetMarketRateData,
  GGetMarketRateData_marketRate,
  GGetMarketRateReq,
  GGetMarketRateVars,
  GGetMarketReq,
  GGetMarketVars,
  GGetMarketsData,
  GGetMarketsData_markets,
  GGetMarketsData_markets_base_currency,
  GGetMarketsData_markets_marketDynamics,
  GGetMarketsData_markets_quote_currency,
  GGetMarketsReq,
  GGetMarketsVars,
  GGetNonCustodialCurrenciesData,
  GGetNonCustodialCurrenciesData_currencies,
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces,
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface,
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain,
  GGetNonCustodialCurrenciesData_currencies_markets,
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency,
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces,
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface,
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency,
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces,
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface,
  GGetNonCustodialCurrenciesReq,
  GGetNonCustodialCurrenciesVars,
  GGetPrivateTradesData,
  GGetPrivateTradesData_privateTrades,
  GGetPrivateTradesReq,
  GGetPrivateTradesVars,
  GGetPublicTradesHistoryData,
  GGetPublicTradesHistoryData_publicTrades,
  GGetPublicTradesHistoryData_publicTrades_result,
  GGetPublicTradesHistoryReq,
  GGetPublicTradesHistoryVars,
  GGetRefUserData,
  GGetRefUserData_refUser,
  GGetRefUserData_refUser_referralsByLevel,
  GGetRefUserReq,
  GGetRefUserVars,
  GGetStakingCurrencyData,
  GGetStakingCurrencyData_stakingCurrency,
  GGetStakingCurrencyReq,
  GGetStakingCurrencyVars,
  GGetUpdateUserData,
  GGetUpdateUserData_user,
  GGetUpdateUserData_user_documents,
  GGetUpdateUserData_user_labels,
  GGetUpdateUserData_user_phones,
  GGetUpdateUserData_user_profiles,
  GGetUpdateUserReq,
  GGetUpdateUserVars,
  GGetUseOrdersData,
  GGetUseOrdersData_userOrders,
  GGetUseOrdersData_userOrders_result,
  GGetUseOrdersData_userOrders_result_Market,
  GGetUseOrdersData_userOrders_result_Market_base_currency,
  GGetUseOrdersData_userOrders_result_Market_marketDynamics,
  GGetUseOrdersData_userOrders_result_Market_quote_currency,
  GGetUseOrdersData_userOrders_result_user,
  GGetUseOrdersReq,
  GGetUseOrdersVars,
  GGetUserBalanceUpdatedData,
  GGetUserBalanceUpdatedData_userBalanceUpdated,
  GGetUserBalanceUpdatedReq,
  GGetUserBalanceUpdatedVars,
  GGetUserBalancesData,
  GGetUserBalancesData_user,
  GGetUserBalancesData_user_currencies,
  GGetUserBalancesReq,
  GGetUserBalancesVars,
  GGetUserHistoryByIdData,
  GGetUserHistoryByIdData_history,
  GGetUserHistoryByIdData_history_result,
  GGetUserHistoryByIdData_history_result_initiator_currency,
  GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces,
  GGetUserHistoryByIdData_history_result_initiator_payment_interface,
  GGetUserHistoryByIdData_history_result_result_currency,
  GGetUserHistoryByIdReq,
  GGetUserHistoryByIdVars,
  GGetUserHistoryData,
  GGetUserHistoryData_history,
  GGetUserHistoryData_history_result,
  GGetUserHistoryData_history_result_initiator_currency,
  GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfaces,
  GGetUserHistoryData_history_result_initiator_payment_interface,
  GGetUserHistoryData_history_result_result_currency,
  GGetUserHistoryReq,
  GGetUserHistoryVars,
  GGetUserOrderData,
  GGetUserOrderData_userOrder,
  GGetUserOrderReq,
  GGetUserOrderVars,
  GGetUserTradesHistoryData,
  GGetUserTradesHistoryData_userTrades,
  GGetUserTradesHistoryData_userTrades_result,
  GGetUserTradesHistoryReq,
  GGetUserTradesHistoryVars,
  GGetUserWalletsData,
  GGetUserWalletsData_user,
  GGetUserWalletsData_user_currencies,
  GGetUserWalletsData_user_currencies_markets,
  GGetUserWalletsData_user_currencies_markets_base_currency,
  GGetUserWalletsData_user_currencies_markets_marketDynamics,
  GGetUserWalletsData_user_currencies_markets_quote_currency,
  GGetUserWalletsReq,
  GGetUserWalletsVars,
  GGetWithdrawWalletPaymentInterfaceData,
  GGetWithdrawWalletPaymentInterfaceData_currency,
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces,
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency,
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface,
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients,
  GGetWithdrawWalletPaymentInterfaceReq,
  GGetWithdrawWalletPaymentInterfaceVars,
  GIcoLevelInput,
  GInitNonCustodialClassicData,
  GInitNonCustodialClassicData_initNonCustodialExchange,
  GInitNonCustodialClassicReq,
  GInitNonCustodialClassicVars,
  GInitNonCustodialData,
  GInitNonCustodialReq,
  GInitNonCustodialVars,
  GInitiateNonCustodianExchangeData,
  GInitiateNonCustodianExchangeReq,
  GInitiateNonCustodianExchangeVars,
  GInputBonusDonate,
  GInputDonateProject,
  GKYCDocumentTypesData,
  GKYCDocumentTypesReq,
  GKYCDocumentTypesVars,
  GLogoutData,
  GLogoutReq,
  GLogoutVars,
  GMarketDynamicsData,
  GMarketDynamicsData_marketDynamics,
  GMarketDynamicsReq,
  GMarketDynamicsVars,
  GMarketRateData,
  GMarketRateData_marketRate,
  GMarketRateReq,
  GMarketRateVars,
  GMoveFromAdvancedTradingFundsData,
  GMoveFromAdvancedTradingFundsReq,
  GMoveFromAdvancedTradingFundsVars,
  GMoveToAdvancedTradingFundsData,
  GMoveToAdvancedTradingFundsReq,
  GMoveToAdvancedTradingFundsVars,
  GOperationType,
  GPrivateOrdersSubscriptionData,
  GPrivateOrdersSubscriptionData_privateOrders,
  GPrivateOrdersSubscriptionData_privateOrders_Market,
  GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency,
  GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics,
  GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency,
  GPrivateOrdersSubscriptionData_privateOrders_user,
  GPrivateOrdersSubscriptionReq,
  GPrivateOrdersSubscriptionVars,
  GPublicDiffOrderBookSubscriptionData,
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook,
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy,
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell,
  GPublicDiffOrderBookSubscriptionReq,
  GPublicDiffOrderBookSubscriptionVars,
  GPublicFullOrderBookSubscriptionData,
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook,
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy,
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell,
  GPublicFullOrderBookSubscriptionReq,
  GPublicFullOrderBookSubscriptionVars,
  GPublicOrderBookData,
  GPublicOrderBookData_publicOrderBook,
  GPublicOrderBookData_publicOrderBook_buy,
  GPublicOrderBookData_publicOrderBook_sell,
  GPublicOrderBookReq,
  GPublicOrderBookVars,
  GPublicTradesSubscriptionData,
  GPublicTradesSubscriptionData_publicTrades,
  GPublicTradesSubscriptionReq,
  GPublicTradesSubscriptionVars,
  GRecoveryPasswordData,
  GRecoveryPasswordReq,
  GRecoveryPasswordVars,
  GRefGroupOTPaymentInput,
  GRefGroupPercentageInput,
  GRequest2FAData,
  GRequest2FAReq,
  GRequest2FAVars,
  GResendEmailConfirmData,
  GResendEmailConfirmReq,
  GResendEmailConfirmVars,
  GSetFavoriteWalletData,
  GSetFavoriteWalletReq,
  GSetFavoriteWalletVars,
  GSignInData,
  GSignInData_login,
  GSignInData_login_profiles,
  GSignInReq,
  GSignInVars,
  GSignUpData,
  GSignUpReq,
  GSignUpVars,
  GSignUpWithGoogleData,
  GSignUpWithGoogleData_signWithGoogle,
  GSignUpWithGoogleReq,
  GSignUpWithGoogleVars,
  GTimestamp,
  GTradeWalletsDataData,
  GTradeWalletsDataData_user,
  GTradeWalletsDataData_user_currencies,
  GTradeWalletsDataReq,
  GTradeWalletsDataVars,
  GTurnOn2FAData,
  GTurnOn2FAReq,
  GTurnOn2FAVars,
  GUserAllBalanceData,
  GUserAllBalanceData_userAllBalance,
  GUserAllBalanceReq,
  GUserAllBalanceVars,
  GUserBalancesData,
  GUserBalancesData_userBalanceUpdated,
  GUserBalancesReq,
  GUserBalancesVars,
  GUserExchangeData,
  GUserExchangeReq,
  GUserExchangeVars,
  GUserState,
  GUserType,
  GVerifyEmailTokenData,
  GVerifyEmailTokenReq,
  GVerifyEmailTokenVars,
  GVerifyUserPhoneNumberData,
  GVerifyUserPhoneNumberReq,
  GVerifyUserPhoneNumberVars,
  GWalletHistoryKlineData,
  GWalletHistoryKlineData_kline,
  GWalletHistoryKlineReq,
  GWalletHistoryKlineVars,
  GconnectToWalletData,
  GconnectToWalletData_walletToConnect,
  GconnectToWalletData_walletToConnect_paymentInterface,
  GconnectToWalletReq,
  GconnectToWalletVars,
  GgetWalletConnectURIByIdData,
  GgetWalletConnectURIByIdReq,
  GgetWalletConnectURIByIdVars,
  GsendUserDirectDepositData,
  GsendUserDirectDepositReq,
  GsendUserDirectDepositVars,
  GsetFavoriteMarketData,
  GsetFavoriteMarketReq,
  GsetFavoriteMarketVars,
  GsignatureRequestWalletConnectData,
  GsignatureRequestWalletConnectData_connectWallet,
  GsignatureRequestWalletConnectReq,
  GsignatureRequestWalletConnectVars,
])
final Serializers serializers = _serializersBuilder.build();

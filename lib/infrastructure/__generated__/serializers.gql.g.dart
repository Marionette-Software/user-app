// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(FetchPolicy.serializer)
      ..add(GAddPhoneData.serializer)
      ..add(GAddPhoneReq.serializer)
      ..add(GAddPhoneVars.serializer)
      ..add(GAddProfileData.serializer)
      ..add(GAddProfileReq.serializer)
      ..add(GAddProfileVars.serializer)
      ..add(GAddUserDocumentData.serializer)
      ..add(GAddUserDocumentReq.serializer)
      ..add(GAddUserDocumentVars.serializer)
      ..add(GAddUserProfileData.serializer)
      ..add(GAddUserProfileReq.serializer)
      ..add(GAddUserProfileVars.serializer)
      ..add(GAskChangePasswordData.serializer)
      ..add(GAskChangePasswordReq.serializer)
      ..add(GAskChangePasswordVars.serializer)
      ..add(GCancelAllOrdersData.serializer)
      ..add(GCancelAllOrdersReq.serializer)
      ..add(GCancelAllOrdersVars.serializer)
      ..add(GCancelCurrencyStateData.serializer)
      ..add(GCancelCurrencyStateReq.serializer)
      ..add(GCancelCurrencyStateVars.serializer)
      ..add(GCancelOrderActionData.serializer)
      ..add(GCancelOrderActionReq.serializer)
      ..add(GCancelOrderActionVars.serializer)
      ..add(GChangeMyPasswordData.serializer)
      ..add(GChangeMyPasswordReq.serializer)
      ..add(GChangeMyPasswordVars.serializer)
      ..add(GChangePasswordData.serializer)
      ..add(GChangePasswordReq.serializer)
      ..add(GChangePasswordVars.serializer)
      ..add(GCreateCurrencyStateData.serializer)
      ..add(GCreateCurrencyStateReq.serializer)
      ..add(GCreateCurrencyStateVars.serializer)
      ..add(GCreateNonCustodialRecipientData.serializer)
      ..add(GCreateNonCustodialRecipientData_createRecipient.serializer)
      ..add(GCreateNonCustodialRecipientReq.serializer)
      ..add(GCreateNonCustodialRecipientVars.serializer)
      ..add(GCreateOrderData.serializer)
      ..add(GCreateOrderData_openOrder.serializer)
      ..add(GCreateOrderReq.serializer)
      ..add(GCreateOrderVars.serializer)
      ..add(GCreateRecipientData.serializer)
      ..add(GCreateRecipientData_createRecipient.serializer)
      ..add(GCreateRecipientReq.serializer)
      ..add(GCreateRecipientVars.serializer)
      ..add(GCreateUserApiKeyData.serializer)
      ..add(GCreateUserApiKeyData_createApiKey.serializer)
      ..add(GCreateUserApiKeyReq.serializer)
      ..add(GCreateUserApiKeyVars.serializer)
      ..add(GCreateWithdrawalData.serializer)
      ..add(GCreateWithdrawalReq.serializer)
      ..add(GCreateWithdrawalVars.serializer)
      ..add(GCurrencyPaymentInterfaceInput.serializer)
      ..add(GDate.serializer)
      ..add(GDeleteApiKeyActionData.serializer)
      ..add(GDeleteApiKeyActionReq.serializer)
      ..add(GDeleteApiKeyActionVars.serializer)
      ..add(GDeleteRecipientData.serializer)
      ..add(GDeleteRecipientReq.serializer)
      ..add(GDeleteRecipientVars.serializer)
      ..add(GFiatGenerateWalletData.serializer)
      ..add(GFiatGenerateWalletData_generateWallet.serializer)
      ..add(GFiatGenerateWalletData_generateWallet_deposit.serializer)
      ..add(GFiatGenerateWalletReq.serializer)
      ..add(GFiatGenerateWalletVars.serializer)
      ..add(GGenerateDepositAddressData.serializer)
      ..add(GGenerateDepositAddressData_generateWallet.serializer)
      ..add(GGenerateDepositAddressData_generateWallet_currency.serializer)
      ..add(GGenerateDepositAddressData_generateWallet_deposit.serializer)
      ..add(GGenerateDepositAddressData_generateWallet_paymentInterface
          .serializer)
      ..add(GGenerateDepositAddressReq.serializer)
      ..add(GGenerateDepositAddressVars.serializer)
      ..add(GGet2FaStatusData.serializer)
      ..add(GGet2FaStatusData_user.serializer)
      ..add(GGet2FaStatusReq.serializer)
      ..add(GGet2FaStatusVars.serializer)
      ..add(GGetApiKeysData.serializer)
      ..add(GGetApiKeysData_apiKeys.serializer)
      ..add(GGetApiKeysReq.serializer)
      ..add(GGetApiKeysVars.serializer)
      ..add(GGetCurrenciesData.serializer)
      ..add(GGetCurrenciesData_currencies.serializer)
      ..add(GGetCurrenciesReq.serializer)
      ..add(GGetCurrenciesVars.serializer)
      ..add(GGetCurrencyChainsDataData.serializer)
      ..add(GGetCurrencyChainsDataData_currencyChains.serializer)
      ..add(GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces
          .serializer)
      ..add(
          GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces_paymentInterface
              .serializer)
      ..add(GGetCurrencyChainsDataReq.serializer)
      ..add(GGetCurrencyChainsDataVars.serializer)
      ..add(GGetCurrencyForFilterHistoryData.serializer)
      ..add(GGetCurrencyForFilterHistoryData_user.serializer)
      ..add(GGetCurrencyForFilterHistoryData_user_currencies.serializer)
      ..add(GGetCurrencyForFilterHistoryReq.serializer)
      ..add(GGetCurrencyForFilterHistoryVars.serializer)
      ..add(GGetDepositWalletPaymentInterfaceData.serializer)
      ..add(GGetDepositWalletPaymentInterfaceData_currency.serializer)
      ..add(
          GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces
              .serializer)
      ..add(
          GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_currency
              .serializer)
      ..add(
          GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces_paymentInterface
              .serializer)
      ..add(GGetDepositWalletPaymentInterfaceReq.serializer)
      ..add(GGetDepositWalletPaymentInterfaceVars.serializer)
      ..add(GGetMarketData.serializer)
      ..add(GGetMarketData_market.serializer)
      ..add(GGetMarketData_market_base_currency.serializer)
      ..add(GGetMarketData_market_marketDynamics.serializer)
      ..add(GGetMarketData_market_quote_currency.serializer)
      ..add(GGetMarketDynamicsData.serializer)
      ..add(GGetMarketDynamicsData_marketDynamics.serializer)
      ..add(GGetMarketDynamicsReq.serializer)
      ..add(GGetMarketDynamicsVars.serializer)
      ..add(GGetMarketRateData.serializer)
      ..add(GGetMarketRateData_marketRate.serializer)
      ..add(GGetMarketRateReq.serializer)
      ..add(GGetMarketRateVars.serializer)
      ..add(GGetMarketReq.serializer)
      ..add(GGetMarketVars.serializer)
      ..add(GGetMarketsData.serializer)
      ..add(GGetMarketsData_markets.serializer)
      ..add(GGetMarketsData_markets_base_currency.serializer)
      ..add(GGetMarketsData_markets_marketDynamics.serializer)
      ..add(GGetMarketsData_markets_quote_currency.serializer)
      ..add(GGetMarketsReq.serializer)
      ..add(GGetMarketsVars.serializer)
      ..add(GGetNonCustodialCurrenciesData.serializer)
      ..add(GGetNonCustodialCurrenciesData_currencies.serializer)
      ..add(GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces
          .serializer)
      ..add(
          GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface
              .serializer)
      ..add(
          GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain
              .serializer)
      ..add(GGetNonCustodialCurrenciesData_currencies_markets.serializer)
      ..add(GGetNonCustodialCurrenciesData_currencies_markets_base_currency
          .serializer)
      ..add(
          GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces
              .serializer)
      ..add(
          GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface
              .serializer)
      ..add(GGetNonCustodialCurrenciesData_currencies_markets_quote_currency
          .serializer)
      ..add(
          GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces
              .serializer)
      ..add(
          GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface
              .serializer)
      ..add(GGetNonCustodialCurrenciesReq.serializer)
      ..add(GGetNonCustodialCurrenciesVars.serializer)
      ..add(GGetPrivateTradesData.serializer)
      ..add(GGetPrivateTradesData_privateTrades.serializer)
      ..add(GGetPrivateTradesReq.serializer)
      ..add(GGetPrivateTradesVars.serializer)
      ..add(GGetPublicTradesHistoryData.serializer)
      ..add(GGetPublicTradesHistoryData_publicTrades.serializer)
      ..add(GGetPublicTradesHistoryData_publicTrades_result.serializer)
      ..add(GGetPublicTradesHistoryReq.serializer)
      ..add(GGetPublicTradesHistoryVars.serializer)
      ..add(GGetRefUserData.serializer)
      ..add(GGetRefUserData_refUser.serializer)
      ..add(GGetRefUserData_refUser_referralsByLevel.serializer)
      ..add(GGetRefUserReq.serializer)
      ..add(GGetRefUserVars.serializer)
      ..add(GGetStakingCurrencyData.serializer)
      ..add(GGetStakingCurrencyData_stakingCurrency.serializer)
      ..add(GGetStakingCurrencyReq.serializer)
      ..add(GGetStakingCurrencyVars.serializer)
      ..add(GGetUpdateUserData.serializer)
      ..add(GGetUpdateUserData_user.serializer)
      ..add(GGetUpdateUserData_user_documents.serializer)
      ..add(GGetUpdateUserData_user_labels.serializer)
      ..add(GGetUpdateUserData_user_phones.serializer)
      ..add(GGetUpdateUserData_user_profiles.serializer)
      ..add(GGetUpdateUserReq.serializer)
      ..add(GGetUpdateUserVars.serializer)
      ..add(GGetUseOrdersData.serializer)
      ..add(GGetUseOrdersData_userOrders.serializer)
      ..add(GGetUseOrdersData_userOrders_result.serializer)
      ..add(GGetUseOrdersData_userOrders_result_Market.serializer)
      ..add(GGetUseOrdersData_userOrders_result_Market_base_currency.serializer)
      ..add(
          GGetUseOrdersData_userOrders_result_Market_marketDynamics.serializer)
      ..add(
          GGetUseOrdersData_userOrders_result_Market_quote_currency.serializer)
      ..add(GGetUseOrdersData_userOrders_result_user.serializer)
      ..add(GGetUseOrdersReq.serializer)
      ..add(GGetUseOrdersVars.serializer)
      ..add(GGetUserBalanceUpdatedData.serializer)
      ..add(GGetUserBalanceUpdatedData_userBalanceUpdated.serializer)
      ..add(GGetUserBalanceUpdatedReq.serializer)
      ..add(GGetUserBalanceUpdatedVars.serializer)
      ..add(GGetUserBalancesData.serializer)
      ..add(GGetUserBalancesData_user.serializer)
      ..add(GGetUserBalancesData_user_currencies.serializer)
      ..add(GGetUserBalancesReq.serializer)
      ..add(GGetUserBalancesVars.serializer)
      ..add(GGetUserHistoryByIdData.serializer)
      ..add(GGetUserHistoryByIdData_history.serializer)
      ..add(GGetUserHistoryByIdData_history_result.serializer)
      ..add(
          GGetUserHistoryByIdData_history_result_initiator_currency.serializer)
      ..add(
          GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces
              .serializer)
      ..add(GGetUserHistoryByIdData_history_result_initiator_payment_interface
          .serializer)
      ..add(GGetUserHistoryByIdData_history_result_result_currency.serializer)
      ..add(GGetUserHistoryByIdReq.serializer)
      ..add(GGetUserHistoryByIdVars.serializer)
      ..add(GGetUserHistoryData.serializer)
      ..add(GGetUserHistoryData_history.serializer)
      ..add(GGetUserHistoryData_history_result.serializer)
      ..add(GGetUserHistoryData_history_result_initiator_currency.serializer)
      ..add(
          GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfaces
              .serializer)
      ..add(GGetUserHistoryData_history_result_initiator_payment_interface
          .serializer)
      ..add(GGetUserHistoryData_history_result_result_currency.serializer)
      ..add(GGetUserHistoryReq.serializer)
      ..add(GGetUserHistoryVars.serializer)
      ..add(GGetUserOrderData.serializer)
      ..add(GGetUserOrderData_userOrder.serializer)
      ..add(GGetUserOrderReq.serializer)
      ..add(GGetUserOrderVars.serializer)
      ..add(GGetUserTradesHistoryData.serializer)
      ..add(GGetUserTradesHistoryData_userTrades.serializer)
      ..add(GGetUserTradesHistoryData_userTrades_result.serializer)
      ..add(GGetUserTradesHistoryReq.serializer)
      ..add(GGetUserTradesHistoryVars.serializer)
      ..add(GGetUserWalletsData.serializer)
      ..add(GGetUserWalletsData_user.serializer)
      ..add(GGetUserWalletsData_user_currencies.serializer)
      ..add(GGetUserWalletsData_user_currencies_markets.serializer)
      ..add(
          GGetUserWalletsData_user_currencies_markets_base_currency.serializer)
      ..add(
          GGetUserWalletsData_user_currencies_markets_marketDynamics.serializer)
      ..add(
          GGetUserWalletsData_user_currencies_markets_quote_currency.serializer)
      ..add(GGetUserWalletsReq.serializer)
      ..add(GGetUserWalletsVars.serializer)
      ..add(GGetWithdrawWalletPaymentInterfaceData.serializer)
      ..add(GGetWithdrawWalletPaymentInterfaceData_currency.serializer)
      ..add(
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces
              .serializer)
      ..add(
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency
              .serializer)
      ..add(
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface
              .serializer)
      ..add(
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients
              .serializer)
      ..add(GGetWithdrawWalletPaymentInterfaceReq.serializer)
      ..add(GGetWithdrawWalletPaymentInterfaceVars.serializer)
      ..add(GIcoLevelInput.serializer)
      ..add(GInitNonCustodialClassicData.serializer)
      ..add(GInitNonCustodialClassicData_initNonCustodialExchange.serializer)
      ..add(GInitNonCustodialClassicReq.serializer)
      ..add(GInitNonCustodialClassicVars.serializer)
      ..add(GInitNonCustodialData.serializer)
      ..add(GInitNonCustodialReq.serializer)
      ..add(GInitNonCustodialVars.serializer)
      ..add(GInitiateNonCustodianExchangeData.serializer)
      ..add(GInitiateNonCustodianExchangeReq.serializer)
      ..add(GInitiateNonCustodianExchangeVars.serializer)
      ..add(GInputBonusDonate.serializer)
      ..add(GInputDonateProject.serializer)
      ..add(GKYCDocumentTypesData.serializer)
      ..add(GKYCDocumentTypesReq.serializer)
      ..add(GKYCDocumentTypesVars.serializer)
      ..add(GLogoutData.serializer)
      ..add(GLogoutReq.serializer)
      ..add(GLogoutVars.serializer)
      ..add(GMarketDynamicsData.serializer)
      ..add(GMarketDynamicsData_marketDynamics.serializer)
      ..add(GMarketDynamicsReq.serializer)
      ..add(GMarketDynamicsVars.serializer)
      ..add(GMarketRateData.serializer)
      ..add(GMarketRateData_marketRate.serializer)
      ..add(GMarketRateReq.serializer)
      ..add(GMarketRateVars.serializer)
      ..add(GMoveFromAdvancedTradingFundsData.serializer)
      ..add(GMoveFromAdvancedTradingFundsReq.serializer)
      ..add(GMoveFromAdvancedTradingFundsVars.serializer)
      ..add(GMoveToAdvancedTradingFundsData.serializer)
      ..add(GMoveToAdvancedTradingFundsReq.serializer)
      ..add(GMoveToAdvancedTradingFundsVars.serializer)
      ..add(GOperationType.serializer)
      ..add(GPrivateOrdersSubscriptionData.serializer)
      ..add(GPrivateOrdersSubscriptionData_privateOrders.serializer)
      ..add(GPrivateOrdersSubscriptionData_privateOrders_Market.serializer)
      ..add(GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency
          .serializer)
      ..add(GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics
          .serializer)
      ..add(GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency
          .serializer)
      ..add(GPrivateOrdersSubscriptionData_privateOrders_user.serializer)
      ..add(GPrivateOrdersSubscriptionReq.serializer)
      ..add(GPrivateOrdersSubscriptionVars.serializer)
      ..add(GPublicDiffOrderBookSubscriptionData.serializer)
      ..add(GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook.serializer)
      ..add(GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy
          .serializer)
      ..add(GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell
          .serializer)
      ..add(GPublicDiffOrderBookSubscriptionReq.serializer)
      ..add(GPublicDiffOrderBookSubscriptionVars.serializer)
      ..add(GPublicFullOrderBookSubscriptionData.serializer)
      ..add(GPublicFullOrderBookSubscriptionData_publicFullOrderBook.serializer)
      ..add(GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy
          .serializer)
      ..add(GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell
          .serializer)
      ..add(GPublicFullOrderBookSubscriptionReq.serializer)
      ..add(GPublicFullOrderBookSubscriptionVars.serializer)
      ..add(GPublicOrderBookData.serializer)
      ..add(GPublicOrderBookData_publicOrderBook.serializer)
      ..add(GPublicOrderBookData_publicOrderBook_buy.serializer)
      ..add(GPublicOrderBookData_publicOrderBook_sell.serializer)
      ..add(GPublicOrderBookReq.serializer)
      ..add(GPublicOrderBookVars.serializer)
      ..add(GPublicTradesSubscriptionData.serializer)
      ..add(GPublicTradesSubscriptionData_publicTrades.serializer)
      ..add(GPublicTradesSubscriptionReq.serializer)
      ..add(GPublicTradesSubscriptionVars.serializer)
      ..add(GRecoveryPasswordData.serializer)
      ..add(GRecoveryPasswordReq.serializer)
      ..add(GRecoveryPasswordVars.serializer)
      ..add(GRefGroupOTPaymentInput.serializer)
      ..add(GRefGroupPercentageInput.serializer)
      ..add(GRequest2FAData.serializer)
      ..add(GRequest2FAReq.serializer)
      ..add(GRequest2FAVars.serializer)
      ..add(GResendEmailConfirmData.serializer)
      ..add(GResendEmailConfirmReq.serializer)
      ..add(GResendEmailConfirmVars.serializer)
      ..add(GSetFavoriteWalletData.serializer)
      ..add(GSetFavoriteWalletReq.serializer)
      ..add(GSetFavoriteWalletVars.serializer)
      ..add(GSignInData.serializer)
      ..add(GSignInData_login.serializer)
      ..add(GSignInData_login_profiles.serializer)
      ..add(GSignInReq.serializer)
      ..add(GSignInVars.serializer)
      ..add(GSignUpData.serializer)
      ..add(GSignUpReq.serializer)
      ..add(GSignUpVars.serializer)
      ..add(GSignUpWithGoogleData.serializer)
      ..add(GSignUpWithGoogleData_signWithGoogle.serializer)
      ..add(GSignUpWithGoogleReq.serializer)
      ..add(GSignUpWithGoogleVars.serializer)
      ..add(GTimestamp.serializer)
      ..add(GTradeWalletsDataData.serializer)
      ..add(GTradeWalletsDataData_user.serializer)
      ..add(GTradeWalletsDataData_user_currencies.serializer)
      ..add(GTradeWalletsDataReq.serializer)
      ..add(GTradeWalletsDataVars.serializer)
      ..add(GTurnOn2FAData.serializer)
      ..add(GTurnOn2FAReq.serializer)
      ..add(GTurnOn2FAVars.serializer)
      ..add(GUserAllBalanceData.serializer)
      ..add(GUserAllBalanceData_userAllBalance.serializer)
      ..add(GUserAllBalanceReq.serializer)
      ..add(GUserAllBalanceVars.serializer)
      ..add(GUserBalancesData.serializer)
      ..add(GUserBalancesData_userBalanceUpdated.serializer)
      ..add(GUserBalancesReq.serializer)
      ..add(GUserBalancesVars.serializer)
      ..add(GUserExchangeData.serializer)
      ..add(GUserExchangeReq.serializer)
      ..add(GUserExchangeVars.serializer)
      ..add(GUserState.serializer)
      ..add(GUserType.serializer)
      ..add(GVerifyEmailTokenData.serializer)
      ..add(GVerifyEmailTokenReq.serializer)
      ..add(GVerifyEmailTokenVars.serializer)
      ..add(GVerifyUserPhoneNumberData.serializer)
      ..add(GVerifyUserPhoneNumberReq.serializer)
      ..add(GVerifyUserPhoneNumberVars.serializer)
      ..add(GWalletHistoryKlineData.serializer)
      ..add(GWalletHistoryKlineData_kline.serializer)
      ..add(GWalletHistoryKlineReq.serializer)
      ..add(GWalletHistoryKlineVars.serializer)
      ..add(GconnectToWalletData.serializer)
      ..add(GconnectToWalletData_walletToConnect.serializer)
      ..add(GconnectToWalletData_walletToConnect_paymentInterface.serializer)
      ..add(GconnectToWalletReq.serializer)
      ..add(GconnectToWalletVars.serializer)
      ..add(GgetWalletConnectURIByIdData.serializer)
      ..add(GgetWalletConnectURIByIdReq.serializer)
      ..add(GgetWalletConnectURIByIdVars.serializer)
      ..add(GsendUserDirectDepositData.serializer)
      ..add(GsendUserDirectDepositReq.serializer)
      ..add(GsendUserDirectDepositVars.serializer)
      ..add(GsetFavoriteMarketData.serializer)
      ..add(GsetFavoriteMarketReq.serializer)
      ..add(GsetFavoriteMarketVars.serializer)
      ..add(GsignatureRequestWalletConnectData.serializer)
      ..add(GsignatureRequestWalletConnectData_connectWallet.serializer)
      ..add(GsignatureRequestWalletConnectReq.serializer)
      ..add(GsignatureRequestWalletConnectVars.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType.nullable(GGetApiKeysData_apiKeys)]),
          () => new ListBuilder<GGetApiKeysData_apiKeys?>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType.nullable(GGetCurrenciesData_currencies)]),
          () => new ListBuilder<GGetCurrenciesData_currencies?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GGetCurrencyChainsDataData_currencyChains)
          ]),
          () => new ListBuilder<GGetCurrencyChainsDataData_currencyChains?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces)
          ]),
          () => new ListBuilder<
              GGetCurrencyChainsDataData_currencyChains_currencyPaymentInterfaces?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GGetCurrencyForFilterHistoryData_user_currencies)
          ]),
          () => new ListBuilder<
              GGetCurrencyForFilterHistoryData_user_currencies?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces)
          ]),
          () => new ListBuilder<
              GGetDepositWalletPaymentInterfaceData_currency_currencyPaymentInterfaces?>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType.nullable(GGetMarketsData_markets)]),
          () => new ListBuilder<GGetMarketsData_markets?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GGetNonCustodialCurrenciesData_currencies)
          ]),
          () => new ListBuilder<GGetNonCustodialCurrenciesData_currencies?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GGetNonCustodialCurrenciesData_currencies_markets)
          ]),
          () => new ListBuilder<
              GGetNonCustodialCurrenciesData_currencies_markets?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces)
          ]),
          () => new ListBuilder<
              GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces)
          ]),
          () => new ListBuilder<
              GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces)
          ]),
          () => new ListBuilder<
              GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GGetPublicTradesHistoryData_publicTrades_result)
          ]),
          () => new ListBuilder<
              GGetPublicTradesHistoryData_publicTrades_result?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GGetRefUserData_refUser_referralsByLevel)
          ]),
          () => new ListBuilder<GGetRefUserData_refUser_referralsByLevel?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GGetUpdateUserData_user_documents)
          ]),
          () => new ListBuilder<GGetUpdateUserData_user_documents?>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType.nullable(GGetUpdateUserData_user_labels)]),
          () => new ListBuilder<GGetUpdateUserData_user_labels?>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType.nullable(GGetUpdateUserData_user_phones)]),
          () => new ListBuilder<GGetUpdateUserData_user_phones?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GGetUpdateUserData_user_profiles)
          ]),
          () => new ListBuilder<GGetUpdateUserData_user_profiles?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GGetUseOrdersData_userOrders_result)
          ]),
          () => new ListBuilder<GGetUseOrdersData_userOrders_result?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GGetUserBalancesData_user_currencies)
          ]),
          () => new ListBuilder<GGetUserBalancesData_user_currencies?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GGetUserHistoryByIdData_history_result)
          ]),
          () => new ListBuilder<GGetUserHistoryByIdData_history_result?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces)
          ]),
          () => new ListBuilder<
              GGetUserHistoryByIdData_history_result_initiator_currency_currencyPaymentInterfaces?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GGetUserHistoryData_history_result)
          ]),
          () => new ListBuilder<GGetUserHistoryData_history_result?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfaces)
          ]),
          () => new ListBuilder<
              GGetUserHistoryData_history_result_initiator_currency_currencyPaymentInterfaces?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GGetUserTradesHistoryData_userTrades_result)
          ]),
          () => new ListBuilder<GGetUserTradesHistoryData_userTrades_result?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GGetUserWalletsData_user_currencies)
          ]),
          () => new ListBuilder<GGetUserWalletsData_user_currencies?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GGetUserWalletsData_user_currencies_markets)
          ]),
          () => new ListBuilder<GGetUserWalletsData_user_currencies_markets?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces)
          ]),
          () => new ListBuilder<
              GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients)
          ]),
          () => new ListBuilder<
              GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy)
          ]),
          () => new ListBuilder<
              GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell)
          ]),
          () => new ListBuilder<
              GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy)
          ]),
          () => new ListBuilder<
              GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(
                GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell)
          ]),
          () => new ListBuilder<
              GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GPublicOrderBookData_publicOrderBook_buy)
          ]),
          () => new ListBuilder<GPublicOrderBookData_publicOrderBook_buy?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GPublicOrderBookData_publicOrderBook_sell)
          ]),
          () => new ListBuilder<GPublicOrderBookData_publicOrderBook_sell?>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType.nullable(GSignInData_login_profiles)]),
          () => new ListBuilder<GSignInData_login_profiles?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GTradeWalletsDataData_user_currencies)
          ]),
          () => new ListBuilder<GTradeWalletsDataData_user_currencies?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType.nullable(GUserAllBalanceData_userAllBalance)
          ]),
          () => new ListBuilder<GUserAllBalanceData_userAllBalance?>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType.nullable(GWalletHistoryKlineData_kline)]),
          () => new ListBuilder<GWalletHistoryKlineData_kline?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType.nullable(String)]),
          () => new ListBuilder<String?>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

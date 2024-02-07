//import 'package:flutter_web3/flutter_web3.dart';
import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/non_custodial_exchange/stepper_progress.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/create_recipient.req.gql.dart';
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/get_currencies.req.gql.dart';
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/init_non_custodial.req.gql.dart';
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/init_non_custodial_classic.req.gql.dart';
import 'package:user_app/domain/non_custodial_exchange/init_non_custodial_exchange_classic_state.dart';
import 'package:user_app/presentation/helpers/set_error_code.dart';

abstract class INonCustodialExchangeService {
  Future<dynamic> getCurrencies();
  //Future<dynamic> connectToWC();
  //Future<dynamic> signTransaction(String data);
  Future<dynamic> getStepperBox();
  Future<dynamic> createRecipient({
    String paymentInterfaceId,
    String currencyId,
    String data,
    String description,
  });
  Future<dynamic> initNonCustodialExchange(
    String provider,
    String inPaymentInterfaceId,
    String inCurrencyId,
    double amount,
    double slippage,
    String recipientId,
  );
  Future<dynamic> initNonCustodialExchangeClassic(
    InitNonCustodialExchangeClassicState initNonCustodialClassicReq,
  );
}

class NonCustodialExchangeService extends INonCustodialExchangeService {
  @override
  Future<dynamic> getCurrencies() async {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    final response = await initClient(globalData.url)
        .request(GGetNonCustodialCurrenciesReq())
        .first;

    if (response.hasErrors) {
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  //TODO WC & W3
  // @override
  // Future<dynamic> connectToWC() async {
  //   final wc = WalletConnectProvider.fromRpc(
  //     {1: 'https://mainnet.infura.io/v3/adbd963f845f4c3686b57c4066095070'},
  //     chainId: 1,
  //     network: 'mainnet',
  //   );
  //
  //   await wc.connect();
  //
  //   if (wc.connected) {
  //     Web3Provider? web3wc = Web3Provider.fromWalletConnect(wc);
  //     final signer = web3wc.getSigner();
  //     return signer.getAddress();
  //   } else {
  //     return GraphQlError(message: 'Something went wrong');
  //   }
  // }
  //
  // //TODO WC & W3
  // @override
  // // ignore: avoid_renaming_method_parameters
  // Future<dynamic> signTransaction(String info) async {
  //   final wc = WalletConnectProvider.fromRpc(
  //     {1: 'https://mainnet.infura.io/v3/adbd963f845f4c3686b57c4066095070'},
  //     chainId: 1,
  //     network: 'mainnet',
  //   );
  //   // final wc = WalletConnectProvider.fromRpc(
  //   //   {
  //   //     56: 'https://bsc-mainnet.nodereal.io/v1/64a9df0874fb4a93b9d0a3849de012d3'
  //   //   },
  //   //   chainId: 56,
  //   //   network: 'mainnet',
  //   // );
  //
  //   await wc.connect();
  //
  //   if (wc.connected) {
  //     Web3Provider? web3wc = Web3Provider.fromWalletConnect(wc);
  //     var json = jsonDecode(info);
  //
  //     var swapTx = json["swapTxData"];
  //     var approveAllowenceTx = json["approveAllowenceTx"];
  //
  //     if (approveAllowenceTx != "") {
  //       final to = approveAllowenceTx['to'];
  //       final gas = approveAllowenceTx['gas'];
  //       final gasPrice = approveAllowenceTx['gasPrice'];
  //       final data = approveAllowenceTx['data'];
  //       try {
  //         final tx = await web3wc.getSigner().sendTransaction(
  //               TransactionRequest(
  //                 to: to,
  //                 value: BigInt.from(0),
  //                 gasLimit: gas,
  //                 gasPrice: gasPrice,
  //                 data: '$data',
  //               ),
  //             );
  //         return tx;
  //       } catch (error) {
  //         return GraphQlError(message: '$error');
  //       }
  //     }
  //
  //     final to = swapTx['to'];
  //     final gas = swapTx['gas'];
  //     final gasPrice = swapTx['gasPrice'];
  //     final data = swapTx['data'];
  //     final value = swapTx['value'];
  //     try {
  //       final tx = await web3wc.getSigner().sendTransaction(
  //             TransactionRequest(
  //               to: to,
  //               value: BigInt.parse(value),
  //               gasLimit: BigInt.from(gas),
  //               gasPrice: BigInt.parse(gasPrice),
  //               data: '$data',
  //             ),
  //           );
  //       return tx;
  //     } catch (error) {
  //       return GraphQlError(message: '$error');
  //     }
  //   }
  // }

  @override
  Future<dynamic> createRecipient({
    String? paymentInterfaceId,
    String? currencyId,
    String? data,
    String? description,
  }) async {
    final response =
        await initClientWithHeader()
            .request(
              GCreateNonCustodialRecipientReq(
                (b) => b
                  ..vars.paymentInterfaceId = paymentInterfaceId
                  ..vars.currencyId = currencyId
                  ..vars.data = data
                  ..vars.description = description,
              ),
            )
            .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.createRecipient!.id!;
    }
  }

  @override
  Future<dynamic> initNonCustodialExchange(
      String provider,
      String inPaymentInterfaceId,
      String inCurrencyId,
      double amount,
      double slippage,
      String recipientId) async {
    final response =
        await initClientWithHeader()
            .request(GInitNonCustodialReq((b) => b
              ..vars.provider = provider
              ..vars.inPaymentInterfaceId = inPaymentInterfaceId
              ..vars.inCurrencyId = inCurrencyId
              ..vars.amount = amount
              ..vars.slippage = slippage
              ..vars.recipientId = recipientId))
            .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.initNonCustodialExternalExchange!;
    }
  }

  @override
  Future<dynamic> initNonCustodialExchangeClassic(
      InitNonCustodialExchangeClassicState initNonCustodialClassicReq) async {
    final response =
        await initClientWithHeader()
            .request(
              GInitNonCustodialClassicReq(
                (b) => b
                  ..vars.inPaymentInterfaceId =
                      initNonCustodialClassicReq.inPaymentInterfaceId
                  ..vars.inCurrencyId = initNonCustodialClassicReq.inCurrencyId
                  ..vars.amount = initNonCustodialClassicReq.amount
                  ..vars.recipientId =
                      initNonCustodialClassicReq.recipientId,
              ),
            )
            .first;
    return response;
  }

  @override
  Future<dynamic> getStepperBox() async {
    var box = await Hive.openBox('nonCustodialBox');
    StepperProgress stepperProgress = box.getAt(0);

    return stepperProgress;
  }
}

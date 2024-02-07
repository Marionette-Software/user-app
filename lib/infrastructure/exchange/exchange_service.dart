import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/infrastructure/exchange/__generated__/get_currencies_request.req.gql.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/presentation/helpers/set_error_code.dart';

abstract class IExchangeService {
  Future<dynamic> getCurrencies();
  Future<dynamic> createWalletPair(
      {required String currencyFrom,
      required String paymentInterfaceFrom,
      required String currencyTo,
      required String paymentInterfaceTo,
      required String paymentInterfaceToData,
      required double amount});
}

class ExchangeService extends IExchangeService {
  @override
  Future<dynamic> getCurrencies() async {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    final response =
        await initClient(globalData.url).request(GGetCurrenciesReq()).first;

    if (response.hasErrors) {
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!;
    }
  }

  @override
  Future<dynamic> createWalletPair(
      {required String currencyFrom,
      required String paymentInterfaceFrom,
      required String currencyTo,
      required String paymentInterfaceTo,
      required String paymentInterfaceToData,
      required double amount}) async {
    final response =
        await initClientWithHeader()
            .request(GGetCurrenciesReq())
            .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }
}

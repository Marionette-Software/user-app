import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/infrastructure/custodian_exchange/__generated__/custodial_exchange_request.req.gql.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/presentation/helpers/set_error_code.dart';

class CustodialExchangeService {
  Future<dynamic> custodialExchange({
    required String? currencyFrom,
    required String? currencyTo,
    required double? amount,
  }) async {
    final response = await initClientWithHeader()
        .request(GUserExchangeReq(
          (b) => b
            ..vars.currencyFrom = currencyFrom
            ..vars.currencyTo = currencyTo
            ..vars.amount = amount,
        ))
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return true;
    }
  }
}

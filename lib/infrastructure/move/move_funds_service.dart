import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/move/__generated__/move_from_funds_request.req.gql.dart';
import 'package:user_app/infrastructure/move/__generated__/move_to_funds_request.req.gql.dart';
import 'package:user_app/presentation/helpers/set_error_code.dart';

class MoveToTradingService {
  Future<dynamic> moveToTradingFunds({
    required String currencyId,
    required double amount,
  }) async {
    final response =
        await initClientWithHeader()
            .request(
              GMoveToAdvancedTradingFundsReq(
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
      return true;
    }
  }
}

class MoveFromTradingService {
  Future<dynamic> moveFromTradingFunds({
    required String currencyId,
    required double amount,
  }) async {
    final response =
        await initClientWithHeader()
            .request(
              GMoveFromAdvancedTradingFundsReq(
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
      return true;
    }
  }
}

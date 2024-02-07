import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/withdraw/__generated__/create_recipient_request.req.gql.dart';
import 'package:user_app/infrastructure/withdraw/__generated__/create_withdraw_request.req.gql.dart';
import 'package:user_app/infrastructure/withdraw/__generated__/delete_recipient_request.req.gql.dart';
import 'package:user_app/presentation/helpers/set_error_code.dart';

abstract class IWithdrawService {
  Future<dynamic> createWithdraw({
    required String recipientId,
    required String code,
    required double amount,
  });

  Future<dynamic> createRecipient({
    required String paymentInterfaceId,
    required String currencyId,
    required String data,
    required String description,
  });

  Future<dynamic> deleteRecipient({
    required String id,
  });
}

class WithdrawService extends IWithdrawService {
  @override
  Future<dynamic> createWithdraw({
    required String recipientId,
    required double amount,
    required String code,
  }) async {
    final response = await initClientWithHeader()
        .request(
          GCreateWithdrawalReq(
            (b) => b
              ..vars.beneficiary_id = recipientId
              ..vars.amount = amount
              ..vars.code = code,
          ),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.userWithdraw;
    }
  }

  @override
  Future<dynamic> createRecipient({
    required String paymentInterfaceId,
    required String currencyId,
    required String data,
    required String description,
  }) async {
    final response = await initClientWithHeader()
        .request(
          GCreateRecipientReq(
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
      return response.data!.createRecipient;
    }
  }

  @override
  Future<dynamic> deleteRecipient({
    required String id,
  }) async {
    final response = await initClientWithHeader()
        .request(
          GDeleteRecipientReq((b) => b..vars.id = id),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.deleteRecipient;
    }
  }
}

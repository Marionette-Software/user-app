import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/two_fa/__generated__/get_2fa_status.req.gql.dart';
import 'package:user_app/infrastructure/two_fa/__generated__/request_2fa.req.gql.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/enable_user_2fa.req.gql.dart';

import 'package:user_app/presentation/helpers/set_error_code.dart';

abstract class ITwoFaService {
  Future<dynamic> getTwoFaDetails();
  Future<dynamic> turnOn2Fa(String code);
  Future<dynamic> getTwoFaStatus();
}

class TwoFaService extends ITwoFaService {
  @override
  Future<dynamic> getTwoFaDetails() async {
    final response =
        await initClientWithHeader()
            .request(GRequest2FAReq())
            .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.request2FA!;
    }
  }

  @override
  Future<dynamic> turnOn2Fa(String code) async {
    final response =
        await initClientWithHeader()
            .request(GTurnOn2FAReq((b) => b..vars.code = code))
            .first;
    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.turnOn2FA!;
    }
  }

  @override
  Future<dynamic> getTwoFaStatus() async {
    final response =
        await initClientWithHeader()
            .request(GGet2FaStatusReq())
            .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.user!.enabled2fa;
    }
  }
}

import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/identity_profile/identity_profile_request.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/kyc/identity/__generated__/add_profile_request.req.gql.dart';
import 'package:user_app/presentation/helpers/set_error_code.dart';

class IdentityProfileService {
  Future<dynamic> identityProfile(
    IdentityProfileRequest identityProfileRequest,
  ) async {
      final response =
        await initClientWithHeader()
            .request(
              GAddProfileReq(
                (b) => b
                  ..vars.first_name = identityProfileRequest.firstName
                  ..vars.last_name = identityProfileRequest.lastName
                  ..vars.birth = identityProfileRequest.dateOfBirth
                  ..vars.address = identityProfileRequest.address
                  ..vars.postcode = identityProfileRequest.postcode
                  ..vars.country = identityProfileRequest.country
                  ..vars.city = identityProfileRequest.city,
              ),
            )
            .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.addProfile;
    }
  }
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/identity_profile/identity_profile_request.dart';

final identityStateNotifierProvider =
    StateNotifierProvider<IdentityStateNotifier, IdentityProfileRequest>(
  (ref) => IdentityStateNotifier(),
);

class IdentityStateNotifier extends StateNotifier<IdentityProfileRequest> {
  IdentityStateNotifier()
      : super(
          const IdentityProfileRequest(
            firstName: '',
            lastName: '',
            dateOfBirth: '',
            address: '',
            postcode: '',
            city: '',
            country: '',
            token: '',
          ),
        );

  void updateFirstName(String data) {
    state = IdentityProfileRequest(
      firstName: data,
      lastName: state.lastName,
      dateOfBirth: state.dateOfBirth,
      address: state.address,
      postcode: state.postcode,
      city: state.city,
      country: state.country,
      token: state.token,
    );
  }

  void updateLastName(String data) {
    state = IdentityProfileRequest(
      firstName: state.firstName,
      lastName: data,
      dateOfBirth: state.dateOfBirth,
      address: state.address,
      postcode: state.postcode,
      city: state.city,
      country: state.country,
      token: state.token,
    );
  }

  void updateDateOfBirth(String data) {
    state = IdentityProfileRequest(
      firstName: state.firstName,
      lastName: state.lastName,
      dateOfBirth: data,
      address: state.address,
      postcode: state.postcode,
      city: state.city,
      country: state.country,
      token: state.token,
    );
  }

  void updateAddress(String data) {
    state = IdentityProfileRequest(
      firstName: state.firstName,
      lastName: state.lastName,
      dateOfBirth: state.dateOfBirth,
      address: data,
      postcode: state.postcode,
      city: state.city,
      country: state.country,
      token: state.token,
    );
  }

  void updatePostcode(String data) {
    state = IdentityProfileRequest(
      firstName: state.firstName,
      lastName: state.lastName,
      dateOfBirth: state.dateOfBirth,
      address: state.address,
      postcode: data,
      city: state.city,
      country: state.country,
      token: state.token,
    );
  }

  void updateCity(String data) {
    state = IdentityProfileRequest(
      firstName: state.firstName,
      lastName: state.lastName,
      dateOfBirth: state.dateOfBirth,
      address: state.address,
      postcode: state.postcode,
      city: data,
      country: state.country,
      token: state.token,
    );
  }

  void updateCountry(String data) {
    state = IdentityProfileRequest(
      firstName: state.firstName,
      lastName: state.lastName,
      dateOfBirth: state.dateOfBirth,
      address: state.address,
      postcode: state.postcode,
      city: state.city,
      country: data,
      token: state.token,
    );
  }

  void updateToken(String data) {
    state = IdentityProfileRequest(
      firstName: state.firstName,
      lastName: state.lastName,
      dateOfBirth: state.dateOfBirth,
      address: state.address,
      postcode: state.postcode,
      city: state.city,
      country: state.country,
      token: data,
    );
  }
}

import 'package:equatable/equatable.dart';

class IdentityProfileRequest extends Equatable {
  const IdentityProfileRequest({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.address,
    required this.postcode,
    required this.city,
    required this.country,
    required this.token,
  });

  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String address;
  final String postcode;
  final String city;
  final String country;
  final String token;

  @override
  List<Object> get props => [
        firstName,
        lastName,
        dateOfBirth,
        address,
        postcode,
        city,
        country,
        token
      ];
}

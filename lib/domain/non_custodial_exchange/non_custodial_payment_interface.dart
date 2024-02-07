import 'package:equatable/equatable.dart';

class NonCustodialPaymentInterfacesState extends Equatable {
  const NonCustodialPaymentInterfacesState({
    required this.id,
    required this.title,
    required this.logoUrl,
    required this.subtitle,
    required this.type,
  });

  final String id;
  final String title;
  final String logoUrl;
  final String subtitle;
  final String type;

  @override
  List<Object> get props => [
        id,
        title,
        logoUrl,
        subtitle,
        type,
      ];
}

import 'package:equatable/equatable.dart';

class ApiKeyState extends Equatable {
  const ApiKeyState({
    required this.id,
    required this.description,
    required this.scope,
    required this.expires,
    this.token,
  });

  final String id;
  final String description;
  final String scope;
  final int expires;
  final String? token;

  @override
  List<Object> get props => [
        id,
        description,
        scope,
        expires,
        token!,
      ];
}

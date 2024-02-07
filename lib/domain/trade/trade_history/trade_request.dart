import 'package:equatable/equatable.dart';

class TradeRequest extends Equatable {
  const TradeRequest({
    required this.market,
    required this.token,
    required this.url,
  });

  final String market;
  final String token;
  final String url;

  @override
  List<Object> get props => [
        market,
        token,
        url,
      ];
}

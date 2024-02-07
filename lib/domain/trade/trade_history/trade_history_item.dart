import 'package:equatable/equatable.dart';

class TradeHistoryItem extends Equatable {
  const TradeHistoryItem(
      {required this.price,
      required this.amount,
      required this.date,
      required this.side});

  final double price;
  final double amount;
  final String date;
  final String side;

  @override
  List<Object> get props => [
        price,
        amount,
        date,
        side,
      ];
}

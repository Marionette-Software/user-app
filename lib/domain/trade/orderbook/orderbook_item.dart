import 'package:equatable/equatable.dart';

class OrderBookItem extends Equatable {
  const OrderBookItem({
    required this.price,
    required this.amount,
    required this.cumulativeAmount,
  });

  final double price;
  final double amount;
  final double cumulativeAmount;

  @override
  List<Object> get props => [
        price,
        amount,
        cumulativeAmount,
      ];
}

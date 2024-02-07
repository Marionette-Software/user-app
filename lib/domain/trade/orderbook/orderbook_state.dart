import 'package:equatable/equatable.dart';
import 'package:user_app/domain/trade/orderbook/orderbook_item.dart';

class OrderBookState extends Equatable {
  const OrderBookState({
    required this.buy,
    required this.sell,
  });

  final List<OrderBookItem> buy;
  final List<OrderBookItem> sell;

  @override
  List<Object> get props => [
        buy,
        sell,
      ];
}

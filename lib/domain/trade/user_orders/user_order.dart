import 'package:equatable/equatable.dart';
import 'package:user_app/domain/trade/market/market_item.dart';

class UserOrderItem extends Equatable {
  const UserOrderItem({
    required this.id,
    required this.date,
    required this.market,
    required this.side,
    required this.type,
    required this.price,
    required this.amount,
    required this.total,
    required this.executed,
    required this.status,
    required this.marketItem,
  });

  final String id;
  final String date;
  final String market;
  final String side;
  final String type;
  final double price;
  final double amount;
  final double total;
  final double executed;
  final String status;
  final MarketItem marketItem;

  @override
  List<Object> get props => [
        id,
        price,
        amount,
        date,
        market,
        side,
        type,
        total,
        executed,
        status,
        marketItem,
      ];
}

import 'dart:ui';
import 'package:equatable/equatable.dart';

class StatisticWalletDataState extends Equatable {
  const StatisticWalletDataState({
    required this.balanceToUsdt,
    required this.id,
    required this.color,
    required this.iconUrl,
    required this.amount,
  });

  final double balanceToUsdt;
  final String id;
  final Color color;
  final String iconUrl;
  final String amount;

  @override
  List<Object> get props => [
        balanceToUsdt,
        id,
        color,
        iconUrl,
        amount,
      ];
}

import 'package:equatable/equatable.dart';

class InitNonCustodialExchangeClassicState extends Equatable {
  const InitNonCustodialExchangeClassicState({
    required this.inPaymentInterfaceId,
    required this.inCurrencyId,
    required this.amount,
    required this.recipientId,
  });

  final String inPaymentInterfaceId;
  final String inCurrencyId;
  final double amount;
  final String recipientId;

  @override
  List<Object> get props => [
        inPaymentInterfaceId,
        inCurrencyId,
        amount,
        recipientId,
      ];
}

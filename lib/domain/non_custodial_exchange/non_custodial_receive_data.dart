import 'package:equatable/equatable.dart';

class NonCustodialReceiveDataState extends Equatable {
  const NonCustodialReceiveDataState({
    required this.amountFrom,
    required this.amountTo,
    required this.paymentInterfaceTitle,
    required this.receiveAddress,
    required this.recipientId,
    required this.paymentInterfaceType,
    required this.paymentInterfaceSubtitle,
  });

  final String amountFrom;
  final String amountTo;
  final String paymentInterfaceTitle;
  final String receiveAddress;
  final String recipientId;
  final String paymentInterfaceType;
  final String paymentInterfaceSubtitle;

  @override
  List<Object> get props => [
        amountFrom,
        paymentInterfaceTitle,
        receiveAddress,
        recipientId,
        paymentInterfaceType,
        paymentInterfaceSubtitle,
      ];
}

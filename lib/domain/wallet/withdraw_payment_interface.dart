import 'package:json_annotation/json_annotation.dart';
import 'package:user_app/domain/wallet/recipient.dart';
import 'package:user_app/domain/wallet/payment_interface.dart';
import 'package:user_app/domain/wallet/payment_interface_currency.dart';

part 'withdraw_payment_interface.g.dart';

@JsonSerializable()
class WithdrawPaymentInterface {
  final String type;
  final PaymentInterface paymentInterface;
  final PaymentInterfaceCurrency currency;
   List<Recipient> recipients;
  final String? recipientSchema;
  final double minWithdrawAmount;
  final double maxWithdrawAmount;
  final double withdrawFee;
  final double minWithdrawFee;
  final double maxWithdrawFee;
  final double maxWithdrawAmount24h;
  final double withdrawAmount24h;

  WithdrawPaymentInterface({
    required this.type,
    required this.paymentInterface,
    required this.currency,
    required this.recipients,
    this.recipientSchema,
    required this.maxWithdrawAmount,
    required this.minWithdrawAmount,
    required this.withdrawFee,
    required this.maxWithdrawAmount24h,
    required this.maxWithdrawFee,
    required this.minWithdrawFee,
    required this.withdrawAmount24h,
  });

  factory WithdrawPaymentInterface.initialData() => WithdrawPaymentInterface(
        type: 'type',
        paymentInterface: PaymentInterface.initialData(),
        currency: PaymentInterfaceCurrency.initialData(),
        recipients: [],
        recipientSchema: '',
        maxWithdrawAmount: 0.0,
        minWithdrawAmount: 0.0,
        withdrawFee: 0.0,
        maxWithdrawAmount24h: 0.0,
        maxWithdrawFee: 0.0,
        minWithdrawFee: 0.0,
        withdrawAmount24h: 0.0,
      );

  factory WithdrawPaymentInterface.fromJson(Map<String, dynamic> json) =>
      _$WithdrawPaymentInterfaceFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawPaymentInterfaceToJson(this);
}

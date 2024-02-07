import 'package:json_annotation/json_annotation.dart';
import 'package:user_app/domain/wallet/payment_interface.dart';
import 'package:user_app/domain/wallet/payment_interface_currency.dart';

part 'wallet_payment_interface.g.dart';

@JsonSerializable()
class WalletPaymentInterface {
  final bool userDepositEnable;
  final bool userDirectDepositEnabled;
  final bool enable;
  final String id;
  final double minDirectDepositAmount;
  final String type;
  final PaymentInterface paymentInterface;
  final PaymentInterfaceCurrency currency;

  WalletPaymentInterface({
    required this.id,
    required this.userDirectDepositEnabled,
    required this.currency,
    required this.paymentInterface,
    required this.type,
    required this.minDirectDepositAmount,
    required this.enable,
    required this.userDepositEnable,
  });

  factory WalletPaymentInterface.initialData() => WalletPaymentInterface(
        id: 'id',
        userDirectDepositEnabled: false,
        currency: PaymentInterfaceCurrency.initialData(),
        paymentInterface: PaymentInterface.initialData(),
        type: 'type',
        minDirectDepositAmount: 0,
        enable: false,
        userDepositEnable: false,
      );

  factory WalletPaymentInterface.fromJson(Map<String, dynamic> json) =>
      _$WalletPaymentInterfaceFromJson(json);

  Map<String, dynamic> toJson() => _$WalletPaymentInterfaceToJson(this);
}

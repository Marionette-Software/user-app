import 'package:json_annotation/json_annotation.dart';

part 'payment_interface_currency.g.dart';

@JsonSerializable()
class PaymentInterfaceCurrency {
  final String id;
  final String? name;
  final String? icon_url;

  PaymentInterfaceCurrency({
    required this.id,
    this.name = 'N/A',
    this.icon_url,
  });

  factory PaymentInterfaceCurrency.initialData() => PaymentInterfaceCurrency(
        id: 'id',
      );

  factory PaymentInterfaceCurrency.fromJson(Map<String, dynamic> json) =>
      _$PaymentInterfaceCurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentInterfaceCurrencyToJson(this);
}

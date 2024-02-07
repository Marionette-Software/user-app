import 'package:json_annotation/json_annotation.dart';

part 'payment_interface.g.dart';

@JsonSerializable()
class PaymentInterface {
  final String id;
  final String? title;
  final String? logoUrl;
  final String? subtitle;

  PaymentInterface({
    required this.id,
    this.title = 'N/A',
    this.subtitle = 'N/A',
    this.logoUrl,
  });

  factory PaymentInterface.initialData() => PaymentInterface(
        id: 'id',
      );

  factory PaymentInterface.fromJson(Map<String, dynamic> json) =>
      _$PaymentInterfaceFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentInterfaceToJson(this);
}

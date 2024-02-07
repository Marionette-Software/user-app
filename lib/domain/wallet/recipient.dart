import 'package:json_annotation/json_annotation.dart';

part 'recipient.g.dart';

@JsonSerializable()
class Recipient {
  final String id;
  final String? data;
  final String? description;
   bool confirmDelete;

  Recipient({
    required this.id,
    this.data = 'N/A',
    this.description = 'N/A',
    this.confirmDelete = false
  });

  factory Recipient.initialData() => Recipient(
        id: 'id',
      );

  factory Recipient.fromJson(Map<String, dynamic> json) =>
      _$RecipientFromJson(json);

  Map<String, dynamic> toJson() => _$RecipientToJson(this);
}

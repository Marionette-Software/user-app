import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class KycDocumentsState extends Equatable {
  const KycDocumentsState({
    required this.documentType,
    required this.documentNumber,
    required this.expirationDate,
    required this.uploadedImages,
  });

  final String documentType;
  final String documentNumber;
  final String expirationDate;
  final List<Uint8List> uploadedImages;

  @override
  List<Object> get props => [
        documentType,
        documentNumber,
        expirationDate,
        uploadedImages,
      ];
}

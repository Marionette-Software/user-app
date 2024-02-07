import 'dart:typed_data';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/kyc_document_type.dart/local/kyc_documents_state.dart';

final kycDocumentsStateNotifierProvider = StateNotifierProvider.autoDispose<
    KycDocumentsStateNotifier, KycDocumentsState>(
  (ref) => KycDocumentsStateNotifier(),
);

class KycDocumentsStateNotifier extends StateNotifier<KycDocumentsState> {
  KycDocumentsStateNotifier()
      : super(
          const KycDocumentsState(
            documentType: '',
            documentNumber: '',
            expirationDate: '',
            uploadedImages: [],
          ),
        );

  void updateDocumentType(String data) {
    state = KycDocumentsState(
      documentType: data,
      documentNumber: state.documentNumber,
      expirationDate: state.expirationDate,
      uploadedImages: state.uploadedImages,
    );
  }

  void updateDocumentNumber(String data) {
    state = KycDocumentsState(
      documentType: state.documentType,
      documentNumber: data,
      expirationDate: state.expirationDate,
      uploadedImages: state.uploadedImages,
    );
  }

  void updateExpirationDate(String data) {
    state = KycDocumentsState(
      documentType: state.documentType,
      documentNumber: state.documentNumber,
      expirationDate: data,
      uploadedImages: state.uploadedImages,
    );
  }

  void updateImageList(List<Uint8List> uploadedImages) {
    state = KycDocumentsState(
      documentType: state.documentType,
      documentNumber: state.documentNumber,
      expirationDate: state.expirationDate,
      uploadedImages: uploadedImages,
    );
  }
}

final documentStatusStateProvider =
    StateNotifierProvider<DocumentStatusStateNotifier, dynamic>(
  (ref) => DocumentStatusStateNotifier(),
);

class DocumentStatusStateNotifier extends StateNotifier<dynamic> {
  DocumentStatusStateNotifier()
      : super(
          {
            'documetType': 'visible',
          },
        );

  void updateDocumentStatus(String documentType) {
    state = state = {
      'documetType': documentType,
    };
  }
}

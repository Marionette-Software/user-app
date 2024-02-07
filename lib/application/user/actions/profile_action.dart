import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/request_status.dart';
import 'package:user_app/domain/general/request_status_with_detail.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/identity_profile/identity_profile_request.dart';
import 'package:user_app/domain/kyc_document_type.dart/local/kyc_documents_state.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/change_password/change_password_service.dart';
import 'package:user_app/infrastructure/kyc/documents/documents_service.dart';
import 'package:user_app/infrastructure/kyc/email/kyc_email_service.dart';
import 'package:user_app/infrastructure/kyc/identity/verify_identity_service.dart';
import 'package:user_app/infrastructure/kyc/phone/verify_phone_service.dart';
import 'package:user_app/infrastructure/two_fa/two_fa_service.dart';
import 'package:user_app/infrastructure/user/user_service.dart';

abstract class ProfileActionsInterface {
  Future<RequestStatus> twoFAEnable({
    required String pin,
  });
  Future<RequestStatus> twoFADisable({
    required String pin,
  });
  Future<RequestStatusWithDetail> changePassword({
    required String oldPassword,
    required String newPassword,
  });
  Future<RequestStatus> verifyEmail({
    required String email,
  });
  Future<RequestStatusWithDetail> addPhone({
    required String phone,
  });
  Future<RequestStatus> verifyPhone({
    required String phone,
    required String code,
  });
  Future<RequestStatusWithDetail> identityProfile({
    required IdentityProfileRequest identity,
  });
  Future<RequestStatus> uploadDocument({
    required KycDocumentsState data,
    required String token,
    required String link,
    required String number,
  });
}

class ProfileActionsGeneral extends ProfileActionsInterface {
  ProfileActionsGeneral();

  @override
  Future<RequestStatus> twoFAEnable({
    required String pin,
  }) async {
    var res = await TwoFaService().turnOn2Fa(
      pin,
    );
    if (res != null && res == 'ok') {
      return RequestStatus.success;
    }
    {
      return RequestStatus.error;
    }
  }

  @override
  Future<RequestStatus> twoFADisable({required String pin}) async {
    var res = await TwoFaService().turnOn2Fa(
      pin,
    );
    if (res != null && res == 'ok') {
      return RequestStatus.success;
    } else {
      return RequestStatus.error;
    }
  }

  @override
  Future<RequestStatus> verifyEmail({
    required String email,
  }) async {
    final emailService = VerifyEmailService();
    var response = await emailService.verifyEmail(email: email);
    if (response is GraphQlError) {
      return RequestStatus.error;
    } else {
      return RequestStatus.success;
    }
  }

  @override
  Future<RequestStatusWithDetail> addPhone({required String phone}) async {
    var result = await AddPhoneService().addPhone(phone);
    if (result is GraphQlError) {
      return RequestStatusWithDetail(
          detail: result.message, status: RequestStatus.error);
    } else {
      return RequestStatusWithDetail(detail: '', status: RequestStatus.success);
    }
  }

  @override
  Future<RequestStatusWithDetail> identityProfile({
    required IdentityProfileRequest identity,
  }) async {
    var response = await IdentityProfileService().identityProfile(identity);
    if (response == 'ok') {
      return RequestStatusWithDetail(
        detail: '',
        status: RequestStatus.success,
      );
    } else {
      return RequestStatusWithDetail(
        detail: response.message,
        status: RequestStatus.error,
      );
    }
  }

  Future<RequestStatus> verifyDocument() async {
    return RequestStatus.success;
  }

  @override
  Future<RequestStatusWithDetail> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    RequestStatusWithDetail res =
        RequestStatusWithDetail(detail: '', status: RequestStatus.error);
    await ChangePasswordService()
        .changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    )
        .then((response) async {
      if (response is GraphQlError) {
        res = RequestStatusWithDetail(
            detail: response.message, status: RequestStatus.error);
      } else {
        res =
            RequestStatusWithDetail(detail: '', status: RequestStatus.success);
        var userBox = Hive.box<UserConfigData>(Constants.userConfig);
        var userConfigData = UserConfigData(
          userId: null,
          token: null,
          selectedMarketId: null,
          userName: '',
        );
        userBox.putAt(0, userConfigData);
    }});

    return res;
  }

  @override
  Future<RequestStatus> verifyPhone({
    required String phone,
    required String code,
  }) async {
    var result = await UserService().verifyPhone(phone, code);
    if (result == 'ok') {
      return RequestStatus.success;
    } else {
      return RequestStatus.error;
    }
  }

  @override
  Future<RequestStatus> uploadDocument({
    required KycDocumentsState data,
    required String token,
    required String link,
    required String number,
  }) async {
    final result =
        await DocumentsApiService().uploadDocument(data, token, link, number);
    if (result == 'ok') {
      return RequestStatus.success;
    } else {
      return RequestStatus.error;
    }
  }
}

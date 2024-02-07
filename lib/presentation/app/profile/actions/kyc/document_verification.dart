import 'dart:typed_data';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_app/application/kyc/documents_state_provider.dart';
import 'package:user_app/application/kyc/send_document_state_provider.dart';
import 'package:user_app/application/user/actions/profile_action.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/request_status.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';

class DocumentVerificationAction {
  documentVerification(
      {required WidgetRef ref,
      required ValueNotifier<LoadState> loaderState,
      required TextEditingController numberCtlController,
      required TextEditingController dateCtlController,
      required BuildContext context,
      required PlatformTypeState platformType}) async {
    final documents = ref.watch(kycDocumentsStateNotifierProvider);
    final documentStatus = ref.read(documentStatusStateProvider.notifier);
    final sendDocumentState = ref.read(sendDocumentProvider.notifier);

    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;
    var userBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userBox.getAt(0)!;
    loaderState.value = LoadState.loading;

    ProfileActionsGeneral()
        .uploadDocument(
      data: documents,
      token: userData.token!,
      link: globalData.url,
      number: numberCtlController.text,
    )
        .then(
      (response) async {
        if (response == RequestStatus.success) {
          documentStatus.updateDocumentStatus('unvisible');
          await Future.delayed(
            const Duration(seconds: 3),
          ).then(
            (value) {
              loaderState.value = LoadState.notLoading;

              sendDocumentState.state = true;

              final snackBar = SnackBar(
                elevation: 0,
                padding: EdgeInsets.only(
                  bottom:
                      // ignore: use_build_context_synchronously
                      MediaQuery.viewInsetsOf(context).bottom + 30
                        ..h,
                ),
                behavior: SnackBarBehavior.floating,
                clipBehavior: Clip.none,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  titleFontSize:
                      platformType == PlatformTypeState.mobile ? 20.sp : 30.sp,
                  messageFontSize:
                      platformType == PlatformTypeState.mobile ? 15.sp : 20.sp,
                  title: tr('snack_bar_message.success.success'),
                  message: tr('snack_bar_message.success.documents_submitted'),
                  contentType: ContentType.success,
                ),
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
              context.pop();
            },
          );
        } else {
          loaderState.value = LoadState.notLoading;

          final snackBar = SnackBar(
            elevation: 0,
            padding: EdgeInsets.only(
              bottom:
                  // ignore: use_build_context_synchronously
                  MediaQuery.viewInsetsOf(context).bottom + 30
                    ..h,
            ),
            behavior: SnackBarBehavior.floating,
            clipBehavior: Clip.none,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              titleFontSize:
                  platformType == PlatformTypeState.mobile ? 20.sp : 30.sp,
              messageFontSize:
                  platformType == PlatformTypeState.mobile ? 15.sp : 20.sp,
              title: tr('snack_bar_message.errors.error'),
              message: tr('snack_bar_message.errors.wrong'),
              contentType: ContentType.failure,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      },
    );
  }

  uploadDocumentFile({required WidgetRef ref}) async {
    final documentsState = ref.read(kycDocumentsStateNotifierProvider.notifier);
    final documents = ref.watch(kycDocumentsStateNotifierProvider);

    Future<Uint8List> toUint8List(XFile? file) async {
      final Uint8List bytes = await file!.readAsBytes();
      return bytes;
    }

    final ImagePicker picker = ImagePicker();
    if (documents.uploadedImages.length < 5) {
      List<Uint8List> temp = [];
      temp.addAll(documents.uploadedImages);
      XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        toUint8List(image).then(
          (value) => {
            temp.add(value),
            documentsState.updateImageList(temp),
          },
        );
      }
    }
  }
}

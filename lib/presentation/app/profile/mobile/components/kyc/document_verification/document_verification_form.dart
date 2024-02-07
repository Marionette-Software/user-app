import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/documents_state_provider.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/profile/actions/kyc/document_verification.dart';
import 'package:user_app/presentation/app/profile/mobile/components/kyc/document_verification/components/document_upload_form.dart';
import 'package:user_app/presentation/app/profile/mobile/components/kyc/document_verification/components/select_document_type.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class DocumentVerificationFormMobile extends StatefulHookConsumerWidget {
  const DocumentVerificationFormMobile({super.key});

  @override
  ConsumerState<DocumentVerificationFormMobile> createState() =>
      _DocumentVerificationFormMobileState();
}

class _DocumentVerificationFormMobileState
    extends ConsumerState<DocumentVerificationFormMobile> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final documentsState = ref.read(kycDocumentsStateNotifierProvider.notifier);
    final documents = ref.watch(kycDocumentsStateNotifierProvider);

    final dateCtlController = useTextEditingController();
    final numberCtlController = useTextEditingController();
    final documentTypeController = useTextEditingController();

    final loaderState = useState(LoadState.notLoading);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainBackgroundDarkColor,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50..h),
          child: Padding(
            padding: EdgeInsets.only(
              top: 15..h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: BackButtonMobile(
                    onTap: () => context.pop(),
                  ),
                ),
                Text(
                  tr('profile.document_upload'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 15.sp,
                        letterSpacing: -0.75.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  width: 70.w,
                  height: 25..h,
                )
              ],
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 10..h,
          ),
          decoration: BoxDecoration(
            color: isLightTheme(context)
                ? AppColors.whiteColor
                : walletBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 35..h,
                  left: 30.w,
                  right: 30.w,
                  bottom: MediaQuery.viewInsetsOf(context).bottom + 50
                    ..h),
              child: Column(
                children: [
                  SelectDocumentTypeMobile(
                    documentTypeController: documentTypeController,
                  ),
                  SizedBox(
                    height: 15..h,
                  ),
                  TextFormField(
                    controller: numberCtlController,
                    maxLength: 30,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return tr('profile.please_fill_field');
                      } else {
                        return null;
                      }
                    },
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    decoration: InputDecoration(
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      filled: false,
                      errorStyle: const TextStyle(
                        fontSize: 0,
                        height: 0,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isLightTheme(context)
                              ? AppColors.mainBackgroundLightColor
                              : AppColors.whiteColor.withOpacity(0.25),
                          width: 5..h,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isLightTheme(context)
                              ? AppColors.mainBackgroundLightColor
                              : AppColors.whiteColor.withOpacity(0.25),
                          width: 5..h,
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: MainColorsApp.redColor, width: 5..h),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isLightTheme(context)
                              ? AppColors.mainBackgroundLightColor
                              : AppColors.whiteColor.withOpacity(0.25),
                          width: 5..h,
                        ),
                      ),
                      hintText: tr('profile.document_number'),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.75.sp,
                              color: isLightTheme(context)
                                  ? AppColors.aboutHeaderLight
                                  : AppColors.whiteColor.withOpacity(0.5)),
                      isCollapsed: false,
                    ),
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      letterSpacing: -0.75.sp,
                    ),
                  ),
                  TextFormField(
                    autocorrect: true,
                    controller: dateCtlController,
                    keyboardType: TextInputType.datetime,
                    textCapitalization: TextCapitalization.words,
                    onChanged: (String value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return tr('profile.please_fill_field');
                      } else {
                        return null;
                      }
                    },
                    onTap: () async {
                      DateTime? date;
                      FocusScope.of(context).requestFocus(FocusNode());
                      date = await showDatePicker(
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Theme.of(context).primaryColorLight,
                                onBackground: isLightTheme(context)
                                    ? AppColors.whiteColor
                                    : Theme.of(context).colorScheme.background,
                                onSurface: isLightTheme(context)
                                    ? AppColors.blackColor
                                    : AppColors.whiteColor,
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                        context: context,
                        initialEntryMode: DatePickerEntryMode.calendar,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.parse('2055-01-01 00:00:00'),
                      );
                      if (date != null) {
                        dateCtlController.text = date.toString().split(' ')[0];
                        documentsState.updateExpirationDate(
                          date.toString().split(' ')[0],
                        );
                      }
                    },
                    decoration: InputDecoration(
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      filled: false,
                      errorStyle: const TextStyle(
                        fontSize: 0,
                        height: 0,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isLightTheme(context)
                              ? AppColors.mainBackgroundLightColor
                              : AppColors.whiteColor.withOpacity(0.25),
                          width: 5..h,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isLightTheme(context)
                              ? AppColors.mainBackgroundLightColor
                              : AppColors.whiteColor.withOpacity(0.25),
                          width: 5..h,
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: MainColorsApp.redColor, width: 5..h),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isLightTheme(context)
                              ? AppColors.mainBackgroundLightColor
                              : AppColors.whiteColor.withOpacity(0.25),
                          width: 5..h,
                        ),
                      ),
                      hintText: tr('profile.expiration_date'),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.75.sp,
                              color: isLightTheme(context)
                                  ? AppColors.aboutHeaderLight
                                  : AppColors.whiteColor.withOpacity(0.5)),
                      isCollapsed: false,
                    ),
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      letterSpacing: -0.75.sp,
                    ),
                  ),
                  const DocumentUploadFormMobile(),
                  SizedBox(
                    height: 30..h,
                  ),
                  loaderState.value == LoadState.loading
                      ? const CircularProgressIndicator()
                      : MainButton(
                          disableColor:
                              MainColorsApp.accentColor.withOpacity(0.5),
                          borderRadius: 25,
                          text: tr('profile.submit'),
                          height: 45..h,
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 15,
                          onTap: documents.uploadedImages.isNotEmpty &&
                                  numberCtlController.text.isNotEmpty &&
                                  dateCtlController.text.isNotEmpty &&
                                  documents.documentType.isNotEmpty
                              ? () {
                                  DocumentVerificationAction()
                                      .documentVerification(
                                    ref: ref,
                                    platformType: PlatformTypeState.mobile,
                                    loaderState: loaderState,
                                    numberCtlController: numberCtlController,
                                    dateCtlController: dateCtlController,
                                    context: context,
                                  );
                                }
                              : null,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

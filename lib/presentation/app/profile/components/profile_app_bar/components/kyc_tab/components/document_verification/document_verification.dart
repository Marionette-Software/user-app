import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/documents_state_provider.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/profile/actions/kyc/document_verification.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/document_verification/components/document_upload_form.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/document_verification/components/select_documet_type.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class DocumentVerification extends HookConsumerWidget {
  const DocumentVerification({
    required this.platformType,
    Key? key,
  }) : super(key: key);

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documentsState = ref.read(kycDocumentsStateNotifierProvider.notifier);
    final documents = ref.watch(kycDocumentsStateNotifierProvider);

    final dateCtlController = useTextEditingController();
    final numberCtlController = useTextEditingController();
    final documentTypeController = useTextEditingController();

    final loaderState = useState(LoadState.notLoading);

    return SizedBox(
      width: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 600,
        tabletValue: 475,
        mobileValue: 320,
      ).w,
      height: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 760,
        tabletValue: 590,
        mobileValue: 508,
      ).h,
      child: MainDecorationContainerWeb(
        content: Padding(
          padding: EdgeInsets.only(
            top: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 30,
              tabletValue: 25,
              mobileValue: 26,
            ).h,
            left: 25.w,
            right: 25.w,
            bottom: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 30,
              tabletValue: 30,
              mobileValue: 0,
            ).h,
          ),
          child: SizedBox(
            height: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 700,
              tabletValue: 550,
              mobileValue: 508,
            ).h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    tr('profile.document_upload'),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 30,
                            tabletValue: 20,
                            mobileValue: 20,
                          ).sp,
                        ),
                  ),
                  SizedBox(
                    height: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 30,
                      tabletValue: 25,
                      mobileValue: 15,
                    ).h,
                  ),
                  SelectDocumentType(
                    platformType: platformType,
                    documentTypeController: documentTypeController,
                  ),
                  SizedBox(
                    height: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 25,
                      tabletValue: 15,
                      mobileValue: 15,
                    ).h,
                  ),
                  SizedBox(
                    height: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 80,
                      tabletValue: 60,
                      mobileValue: 50,
                    ).h,
                    child: TextFormField(
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
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            getSizeFromPlatformType(
                              platformType: platformType,
                              webValue: 10,
                              tabletValue: 10,
                              mobileValue: 5,
                            ).r,
                          ),
                        ),
                        fillColor:
                            Theme.of(context).inputDecorationTheme.fillColor,
                        hintStyle:
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontSize: getSizeFromPlatformType(
                                    platformType: platformType,
                                    webValue: 20,
                                    tabletValue: 15,
                                    mobileValue: 10,
                                  ).sp,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
                                ),
                        hintText: tr('profile.document_number'),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            getSizeFromPlatformType(
                              platformType: platformType,
                              webValue: 10,
                              tabletValue: 10,
                              mobileValue: 5,
                            ).r,
                          ),
                          borderSide: BorderSide(
                            color: isLightTheme(context)
                                ? Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.05)
                                : AppColors.whiteColor.withOpacity(0.25),
                            width: 1.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(
                          top: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 28,
                            tabletValue: 21,
                            mobileValue: 17,
                          ).h,
                          bottom: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 28,
                            tabletValue: 21,
                            mobileValue: 17,
                          ).h,
                          right: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 23,
                            tabletValue: 15,
                            mobileValue: 11,
                          ).w,
                          left: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 23,
                            tabletValue: 15,
                            mobileValue: 11,
                          ).w,
                        ),
                      ),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: getSizeFromPlatformType(
                              platformType: platformType,
                              webValue: 20,
                              tabletValue: 15,
                              mobileValue: 10,
                            ).sp,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 25,
                      tabletValue: 15,
                      mobileValue: 10,
                    ).h,
                  ),
                  SizedBox(
                    height: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 80,
                      tabletValue: 60,
                      mobileValue: 50,
                    ).h,
                    child: TextFormField(
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
                                      : Theme.of(context)
                                          .colorScheme
                                          .background,
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
                          dateCtlController.text =
                              date.toString().split(' ')[0];
                          documentsState.updateExpirationDate(
                            date.toString().split(' ')[0],
                          );
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            getSizeFromPlatformType(
                              platformType: platformType,
                              webValue: 10,
                              tabletValue: 10,
                              mobileValue: 5,
                            ).r,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            getSizeFromPlatformType(
                              platformType: platformType,
                              webValue: 10,
                              tabletValue: 10,
                              mobileValue: 5,
                            ).r,
                          ),
                          borderSide: BorderSide(
                            color: isLightTheme(context)
                                ? Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.05)
                                : AppColors.whiteColor.withOpacity(0.25),
                            width: 1.0,
                          ),
                        ),
                        fillColor:
                            Theme.of(context).inputDecorationTheme.fillColor,
                        hintStyle: TextStyle(
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 20,
                            tabletValue: 15,
                            mobileValue: 10,
                          ).sp,
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                        hintText: tr('profile.expiration_date'),
                        contentPadding: EdgeInsets.only(
                          top: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 28,
                            tabletValue: 21,
                            mobileValue: 17,
                          ).h,
                          bottom: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 28,
                            tabletValue: 21,
                            mobileValue: 17,
                          ).h,
                          right: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 23,
                            tabletValue: 15,
                            mobileValue: 11,
                          ).w,
                          left: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 23,
                            tabletValue: 15,
                            mobileValue: 11,
                          ).w,
                        ),
                      ),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: getSizeFromPlatformType(
                              platformType: platformType,
                              webValue: 20,
                              tabletValue: 15,
                              mobileValue: 10,
                            ).sp,
                          ),
                    ),
                  ),
                  DocumentUploadForm(
                    platformType: platformType,
                  ),
                  SizedBox(
                    height: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 15,
                      tabletValue: 10,
                      mobileValue: 9,
                    ).h,
                  ),
                  loaderState.value == LoadState.loading
                      ? const CircularProgressIndicator()
                      : MainButton(
                          disableColor:
                              MainColorsApp.accentColor.withOpacity(0.5),
                          borderRadius: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 10,
                            tabletValue: 8,
                            mobileValue: 5,
                          ),
                          text: tr('profile.submit'),
                          height: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 60,
                            tabletValue: 45,
                            mobileValue: 35,
                          ).h,
                          color: Theme.of(context).primaryColorLight,
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 20,
                            tabletValue: 15,
                            mobileValue: 13,
                          ),
                          onTap: documents.uploadedImages.isNotEmpty &&
                                  numberCtlController.text.isNotEmpty &&
                                  dateCtlController.text.isNotEmpty &&
                                  documents.documentType.isNotEmpty
                              ? () {
                                  DocumentVerificationAction()
                                      .documentVerification(
                                    ref: ref,
                                    loaderState: loaderState,
                                    platformType: PlatformTypeState.web,
                                    numberCtlController: numberCtlController,
                                    dateCtlController: dateCtlController,
                                    context: context,
                                  );
                                }
                              : null,
                        ),
                  SizedBox(
                    height: 15.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

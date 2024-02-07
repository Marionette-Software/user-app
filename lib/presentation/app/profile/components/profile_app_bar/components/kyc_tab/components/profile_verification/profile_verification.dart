import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/identity_state_provider.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/profile/actions/kyc/profile_verification.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/profile_verification/components/profile_country_code_picker.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/profile_verification/components/profile_date_input.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/profile_verification/components/profile_input.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/format_string.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class ProfileVerification extends HookConsumerWidget {
  static final _formKey = GlobalKey<FormState>();

  const ProfileVerification({
    required this.platformType,
    super.key,
  });
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final identityState = ref.read(identityStateNotifierProvider.notifier);
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final cityController = useTextEditingController();
    final residentialAddressController = useTextEditingController();
    final postcodeController = useTextEditingController();
    final dateCtlController = useTextEditingController();
    final countryController = useTextEditingController();

    final loaderState = useState(LoadState.notLoading);
    var validateErrorCountry = useState(false);

    return SizedBox(
      width: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 600,
        tabletValue: 475,
        mobileValue: 320,
      ).w,
      height: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 930,
        tabletValue: 670,
        mobileValue: 560,
      ).h,
      child: MainDecorationContainerWeb(
        content: Padding(
          padding: EdgeInsets.only(
            top: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 36,
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  tr('profile.identity_verification'),
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
                    tabletValue: 10,
                    mobileValue: 15,
                  ).h,
                ),
                Container(
                  height: platformType == PlatformTypeState.web
                      ? 800.h
                      : platformType == PlatformTypeState.tablet
                          ? 580.h
                          : 470.h,
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.viewInsetsOf(context).bottom,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProfileInput(
                          lengthLimiting: 100,
                          platformType: platformType,
                          hintText: tr('profile.identity_first_name'),
                          controller: firstNameController,
                          onChanged: (String value) {
                            if (value.isNotEmpty) {
                              identityState.updateFirstName(
                                formatFirstLetterUppercase(value),
                              );
                            }
                          },
                          onValidator: (value) {
                            if (value.isEmpty) {
                              return '';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 25,
                            tabletValue: 15,
                            mobileValue: 10,
                          ).h,
                        ),
                        ProfileInput(
                          lengthLimiting: 100,
                          platformType: platformType,
                          hintText: tr('profile.identity_last_name'),
                          controller: lastNameController,
                          onChanged: (String value) {
                            if (value.isNotEmpty) {
                              identityState.updateLastName(
                                formatFirstLetterUppercase(value),
                              );
                            }
                          },
                          onValidator: (value) {
                            if (value.isEmpty) {
                              return '';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 25,
                            tabletValue: 15,
                            mobileValue: 10,
                          ).h,
                        ),
                        ProfileDateInput(
                          dateCtlController: dateCtlController,
                          platformType: platformType,
                        ),
                        SizedBox(
                          height: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 25,
                            tabletValue: 15,
                            mobileValue: 10,
                          ).h,
                        ),
                        ProfileCountryCodePicker(
                          validateErrorCountry: validateErrorCountry,
                          platformType: platformType,
                          countryController: countryController,
                        ),
                        SizedBox(
                          height: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 25,
                            tabletValue: 15,
                            mobileValue: 20,
                          ).h,
                        ),
                        ProfileInput(
                          lengthLimiting: 100,
                          platformType: platformType,
                          hintText: tr('profile.identity_city'),
                          controller: cityController,
                          onChanged: (String value) {
                            identityState.updateCity(value);
                          },
                          onValidator: (value) {
                            if (value.isEmpty) {
                              return '';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 25,
                            tabletValue: 15,
                            mobileValue: 10,
                          ).h,
                        ),
                        ProfileInput(
                          lengthLimiting: 100,
                          platformType: platformType,
                          hintText: tr('profile.identity_residential_address'),
                          controller: residentialAddressController,
                          onChanged: (String value) {
                            identityState.updateAddress(value);
                          },
                          onValidator: (value) {
                            if (value.isEmpty) {
                              return '';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 25,
                            tabletValue: 15,
                            mobileValue: 10,
                          ).h,
                        ),
                        ProfileInput(
                          lengthLimiting: 20,
                          platformType: platformType,
                          hintText: tr('profile.identity_postcode'),
                          controller: postcodeController,
                          onChanged: (String value) {
                            identityState.updatePostcode(value);
                          },
                          onValidator: (value) {
                            if (value.isEmpty) {
                              return '';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 25,
                            tabletValue: 15,
                            mobileValue: 10,
                          ).h,
                        ),
                        loaderState.value == LoadState.loading
                            ? const Center(child: CircularProgressIndicator())
                            : Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: getSizeFromPlatformType(
                                    platformType: platformType,
                                    webValue: 60,
                                    tabletValue: 45,
                                    mobileValue: 35,
                                  ).h,
                                  width: double.infinity,
                                  child: InkWell(
                                    onTap: () {
                                      ProfileVerificationAction()
                                          .profileVerification(
                                        ref: ref,
                                        formKey: _formKey,
                                        context: context,
                                        validateErrorCountry:
                                            validateErrorCountry,
                                        loaderState: loaderState,
                                        platformType: platformType,
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          getSizeFromPlatformType(
                                            platformType: platformType,
                                            webValue: 10,
                                            tabletValue: 10,
                                            mobileValue: 5,
                                          ).h,
                                        ),
                                        color:
                                            Theme.of(context).primaryColorLight,
                                      ),
                                      child: Center(
                                        child: Text(
                                          tr('profile.submit'),
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: getSizeFromPlatformType(
                                              platformType: platformType,
                                              webValue: 20,
                                              tabletValue: 15,
                                              mobileValue: 10,
                                            ).sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

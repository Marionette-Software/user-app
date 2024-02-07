import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/identity_state_provider.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/profile/actions/kyc/profile_verification.dart';
import 'package:user_app/presentation/app/profile/mobile/components/kyc/profile_verification/components/profile_country_code_piker.dart';
import 'package:user_app/presentation/app/profile/mobile/components/kyc/profile_verification/components/profile_date_input.dart';
import 'package:user_app/presentation/app/profile/mobile/components/kyc/profile_verification/components/profile_input.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/format_string.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ProfileVerificationFormMobile extends HookConsumerWidget {
  static final _formKey = GlobalKey<FormState>();

  const ProfileVerificationFormMobile({
    super.key,
  });

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
                  'Identity Verification',
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
                  top: 20..h,
                  left: 30.w,
                  right: 30.w,
                  bottom: MediaQuery.viewInsetsOf(context).bottom + 50
                    ..h),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ProfileInputMobile(
                      lengthLimiting: 100,
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
                      height: 30..h,
                    ),
                    ProfileInputMobile(
                      lengthLimiting: 100,
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
                      height: 30..h,
                    ),
                    ProfileDateInputMobile(
                      dateCtlController: dateCtlController,
                    ),
                    SizedBox(
                      height: 40..h,
                    ),
                    ProfileCountryCodePickerMobile(
                      validateErrorCountry: validateErrorCountry,
                      platformType: PlatformTypeState.mobile,
                      countryController: countryController,
                    ),
                    SizedBox(
                      height: 30..h,
                    ),
                    ProfileInputMobile(
                      lengthLimiting: 100,
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
                      height: 30..h,
                    ),
                    ProfileInputMobile(
                      lengthLimiting: 100,
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
                      height: 30..h,
                    ),
                    ProfileInputMobile(
                      lengthLimiting: 20,
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
                      height: 30..h,
                    ),
                    loaderState.value == LoadState.loading
                        ? const Center(child: CircularProgressIndicator())
                        : Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 45..h,
                              width: double.infinity,
                              child: InkWell(
                                onTap: () {
                                  ProfileVerificationAction()
                                      .profileVerification(
                                    ref: ref,
                                    formKey: _formKey,
                                    context: context,
                                    validateErrorCountry: validateErrorCountry,
                                    loaderState: loaderState,
                                    platformType: PlatformTypeState.mobile,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      25.r,
                                    ),
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                                  child: Center(
                                    child: Text(
                                      tr('profile.submit'),
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 15.sp,
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
          ),
        ),
      ),
    );
  }
}

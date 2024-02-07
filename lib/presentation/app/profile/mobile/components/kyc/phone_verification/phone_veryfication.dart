import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/user/actions/profile_action.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/general/request_status.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/presentation/app/profile/mobile/components/kyc/profile_verification/profile_verification_form.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class PhoneVerificationFormMobile extends StatefulHookConsumerWidget {
  const PhoneVerificationFormMobile({super.key});

  @override
  ConsumerState<PhoneVerificationFormMobile> createState() =>
      _PhoneVerificationFormMobileState();
}

class _PhoneVerificationFormMobileState
    extends ConsumerState<PhoneVerificationFormMobile> {
  @override
  void dispose() {
    super.dispose();
  }

  String selectedCountry = '';
  String phone = '';
  String smsCode = '';
  bool addedPhone = false;

  CountdownTimerController? countdownTimerController = CountdownTimerController(
    endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 180,
    onEnd: () {},
  );

  final countryController = TextEditingController();
  final phoneController = TextEditingController();
  final smsCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loaderState = useState(LoadState.notLoading);

    ProfileActionsGeneral service = ProfileActionsGeneral();

    sendSmsCode() {
      loaderState.value = LoadState.loading;
      service.addPhone(phone: '$selectedCountry$phone').then(
        (response) {
          if (response.status == RequestStatus.success) {
            setState(() {
              addedPhone = true;
            });
            final snackBar = SnackBar(
              elevation: 0,
              clipBehavior: Clip.none,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                titleFontSize: 20.sp,
                messageFontSize: 15.sp,
                title: tr('snack_bar_message.success.success'),
                message:
                    '${tr('snack_bar_message.success.verification_code_was_sent_to')} $phone',
                contentType: ContentType.success,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          } else {
            final snackBar = SnackBar(
              elevation: 0,
              clipBehavior: Clip.none,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                titleFontSize: 20.sp,
                messageFontSize: 15.sp,
                title: tr('snack_bar_message.errors.error'),
                message: response.detail,
                contentType: ContentType.failure,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          }
          loaderState.value = LoadState.notLoading;
        },
      );
    }

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
                  'Phone Verification'.hardcoded,
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
                  Row(
                    children: [
                      CountryCodePicker(
                        barrierColor: AppColors.placeHolderGrey,
                        padding: EdgeInsets.only(
                          top: 17.h,
                          bottom: 17.h,
                          left: 11.w,
                        ),
                        boxDecoration: BoxDecoration(
                          color: isLightTheme(context)
                              ? AppColors.whiteColor
                              : AppColors.mainBackgroundDarkColor,
                        ),
                        dialogBackgroundColor: isLightTheme(context)
                            ? AppColors.whiteColor
                            : AppColors.mainBackgroundDarkColor,
                        backgroundColor: isLightTheme(context)
                            ? AppColors.whiteColor
                            : AppColors.mainBackgroundDarkColor,
                        textStyle:
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: isLightTheme(context)
                                      ? Theme.of(context).primaryColor
                                      : AppColors.whiteColor,
                                  fontSize: 13.sp,
                                ),
                        dialogTextStyle:
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: isLightTheme(context)
                                      ? Theme.of(context).primaryColor
                                      : AppColors.whiteColor,
                                  fontSize: 13.sp,
                                ),
                        searchDecoration: InputDecoration(
                          isDense: true,
                          errorMaxLines: 1,
                          errorStyle: const TextStyle(
                            height: 0.01,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              5.r,
                            ),
                          ),
                          filled: true,
                          fillColor: isLightTheme(context)
                              ? AppColors.whiteColor
                              : AppColors.mainBackgroundDarkColor,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              5.r,
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
                          prefixIconColor: isLightTheme(context)
                              ? Theme.of(context).primaryColor
                              : AppColors.whiteColor,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                          hintText: tr('profile.type_a_country'),
                          hintStyle:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5),
                                    fontSize: 13.sp,
                                  ),
                        ),
                        dialogSize: Size(
                          320.w,
                          682.h,
                        ),
                        onChanged: (value) {
                          countryController.text = value.dialCode!;
                          setState(() {
                            selectedCountry = value.dialCode!;
                          });
                        },
                        initialSelection: tr('profile.country'),
                        showCountryOnly: false,
                        showFlag: true,
                        builder: (value) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: Icon(
                                  Icons.expand_more,
                                  color: isLightTheme(context)
                                      ? Theme.of(context).primaryColor
                                      : AppColors.whiteColor,
                                  size: 22.w,
                                ),
                              ),
                              countryController.text.isNotEmpty
                                  ? Padding(
                                      padding: EdgeInsets.only(right: 10.w),
                                      child: Image.network(
                                        '/assets/packages/country_code_picker/flags/${value!.code!.toLowerCase()}.png',
                                        height: 30..h,
                                        width: 30.w,
                                      ),
                                    )
                                  : const SizedBox(),
                              Text(
                                (countryController.text.isNotEmpty)
                                    ? "${value!.dialCode}"
                                    : 'Code',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500),
                              ),
                            ],
                          );
                        },
                      ),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp('[0-9]'),
                            ),
                          ],
                          onChanged: (String? value) {
                            setState(() {
                              phone = value!;
                            });
                          },
                          decoration: InputDecoration(
                            floatingLabelAlignment:
                                FloatingLabelAlignment.center,
                            filled: false,
                            errorStyle: const TextStyle(
                              fontSize: 0,
                              height: 0,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintText: 'Enter phone number   ',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.75.sp,
                                    color: isLightTheme(context)
                                        ? AppColors.aboutHeaderLight
                                        : AppColors.whiteColor
                                            .withOpacity(0.5)),
                            isCollapsed: false,
                          ),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                            letterSpacing: -1.sp,
                          ),
                        ),
                      ),
                      addedPhone
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  addedPhone = false;
                                });
                              },
                              icon: Icon(
                                Icons.edit,
                                color: isLightTheme(context)
                                    ? walletBackgroundColor
                                    : AppColors.whiteColor,
                                size: 16.w,
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                  Container(
                    color: isLightTheme(context)
                        ? AppColors.mainBackgroundLightColor
                        : AppColors.whiteColor.withOpacity(0.25),
                    height: 5..h,
                  ),
                  addedPhone
                      ? Padding(
                          padding: EdgeInsets.only(top: 24..h),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CountdownTimer(
                                    controller: countdownTimerController,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontSize: 13.sp,
                                        ),
                                    widgetBuilder: (ctx, time) {
                                      if (time == null) {
                                        return InkWell(
                                          onTap: () {
                                            countdownTimerController!
                                                .disposeTimer();
                                            countdownTimerController!
                                                .endTime = DateTime.now()
                                                    .millisecondsSinceEpoch +
                                                1000 * 5;
                                            countdownTimerController!.start();
                                            sendSmsCode();
                                          },
                                          child: Text(
                                            tr('profile.resend_code'),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: -0.75.sp,
                                                  color:
                                                      MainColorsApp.accentColor,
                                                  fontSize: 15.sp,
                                                ),
                                          ),
                                        );
                                      }
                                      return Center(
                                        child: Text(
                                          "${time.min != null ? time.min.toString() : '0'}:${time.sec != null ? time.sec.toString() : '0'}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.75.sp,
                                                color:
                                                    MainColorsApp.accentColor,
                                                fontSize: 15.sp,
                                              ),
                                        ),
                                      );
                                    },
                                    endWidget: const SizedBox(),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.phone,
                                      controller: smsCodeController,
                                      onChanged: (String? value) {
                                        setState(() {
                                          smsCode = value!;
                                        });
                                      },
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]'),
                                        ),
                                      ],
                                      decoration: InputDecoration(
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        filled: false,
                                        errorStyle: const TextStyle(
                                          fontSize: 0,
                                          height: 0,
                                        ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        hintText: 'Input SMS code',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.75.sp,
                                                color: isLightTheme(context)
                                                    ? AppColors.aboutHeaderLight
                                                    : AppColors.whiteColor
                                                        .withOpacity(0.5)),
                                        isCollapsed: false,
                                      ),
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Inter',
                                        letterSpacing: -1.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                color: isLightTheme(context)
                                    ? AppColors.mainBackgroundLightColor
                                    : AppColors.whiteColor.withOpacity(0.25),
                                height: 5..h,
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: 20..h,
                  ),
                  loaderState.value == LoadState.loading
                      ? const Center(child: CircularProgressIndicator())
                      : addedPhone
                          ? MainButton(
                              disableColor: isLightTheme(context)
                                  ? AppColors.mainBackgroundLightColor
                                  : AppColors.whiteColor.withOpacity(0.05),
                              onTap: smsCode.isEmpty
                                  ? null
                                  : () async {
                                      loaderState.value = LoadState.loading;
                                      service
                                          .verifyPhone(
                                        phone: '$selectedCountry$phone',
                                        code: smsCode,
                                      )
                                          .then(
                                        (response) {
                                          if (response ==
                                              RequestStatus.success) {
                                            final snackBar = SnackBar(
                                              elevation: 0,
                                              clipBehavior: Clip.none,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor:
                                                  Colors.transparent,
                                              content: AwesomeSnackbarContent(
                                                titleFontSize: 20.sp,
                                                messageFontSize: 15.sp,
                                                title: tr(
                                                    'profile.phone_verification_success'),
                                                message: '',
                                                contentType:
                                                    ContentType.success,
                                              ),
                                            );

                                            ScaffoldMessenger.of(context)
                                              ..hideCurrentSnackBar()
                                              ..showSnackBar(snackBar);
                                            context.pop();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ProfileVerificationFormMobile(),
                                              ),
                                            );
                                          } else {
                                            final snackBar = SnackBar(
                                              elevation: 0,
                                              clipBehavior: Clip.none,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor:
                                                  Colors.transparent,
                                              content: AwesomeSnackbarContent(
                                                titleFontSize: 20.sp,
                                                messageFontSize: 15.sp,
                                                title: tr(
                                                    'snack_bar_message.errors.error'),
                                                message: tr(
                                                    'snack_bar_message.errors.no_valid_code'),
                                                contentType:
                                                    ContentType.failure,
                                              ),
                                            );

                                            ScaffoldMessenger.of(context)
                                              ..hideCurrentSnackBar()
                                              ..showSnackBar(snackBar);
                                          }
                                          loaderState.value =
                                              LoadState.notLoading;
                                        },
                                      );
                                    },
                              fontSize: 15,
                              text: 'Submit',
                              height: 45..h,
                              color: MainColorsApp.accentColor,
                              borderRadius: 25,
                            )
                          : MainButton(
                              disableColor: isLightTheme(context)
                                  ? AppColors.mainBackgroundLightColor
                                  : AppColors.whiteColor.withOpacity(0.05),
                              onTap: (phone.isEmpty || selectedCountry.isEmpty)
                                  ? null
                                  : () async {
                                      sendSmsCode();
                                    },
                              fontSize: 15,
                              text: 'Request SMS code',
                              height: 45..h,
                              color: MainColorsApp.accentColor,
                              borderRadius: 25,
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

import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/choose_code_state.dart';
import 'package:user_app/application/kyc/send_code_state_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class PhoneInput extends StatefulHookConsumerWidget {
  const PhoneInput({
    required this.platformType,
    required this.phoneNumberController,
    super.key,
  });

  final PlatformTypeState platformType;
  final TextEditingController phoneNumberController;

  @override
  ConsumerState<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends ConsumerState<PhoneInput> {
  @override
  void dispose() {
    super.dispose();
  }

  final countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sendCodeState = ref.read(sendCodeStateProvider.notifier);
    final sendCodeController = ref.watch(sendCodeStateProvider);
    final phoneCodeState = ref.read(phoneCodeStateProvider.notifier);

    return Stack(
      children: [
        SizedBox(
          height: getSizeFromPlatformType(
            platformType: widget.platformType,
            webValue: 80,
            tabletValue: 60,
            mobileValue: 52,
          ).h,
          child: SizedBox(
            height: getSizeFromPlatformType(
              platformType: widget.platformType,
              webValue: 80,
              tabletValue: 60,
              mobileValue: 52,
            ).h,
            width: getSizeFromPlatformType(
              platformType: widget.platformType,
              webValue: 550,
              tabletValue: 425,
              mobileValue: 270,
            ).w,
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Theme.of(context).primaryColorLight,
                    ),
              ),
              child: Column(
                children: [
                  TextFormField(
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    enabled: sendCodeController == true ? false : true,
                    autovalidateMode: AutovalidateMode.disabled,
                    cursorColor:
                        Theme.of(context).primaryColor.withOpacity(0.5),
                    keyboardType: TextInputType.number,
                    controller: widget.phoneNumberController,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding:  EdgeInsets.only(left: 20.w),
                        child: SizedBox(
                          width: 170.w,
                          child: CountryCodePicker(
                            barrierColor: AppColors.placeHolderGrey,
                            padding: EdgeInsets.only(
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
                                      fontSize: 20.sp,
                                    ),
                            dialogTextStyle:
                                Theme.of(context).textTheme.titleSmall!.copyWith(
                                      color: isLightTheme(context)
                                          ? Theme.of(context).primaryColor
                                          : AppColors.whiteColor,
                                      fontSize: 20.sp,
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
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5),
                                    fontSize: 20.sp,
                                  ),
                            ),
                            dialogSize: Size(
                              600.w,
                              685.h,
                            ),
                            onChanged: (value) {
                              countryController.text = value.dialCode!;
                      
                              phoneCodeState.state = value.dialCode!;
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
                                          fontSize: getSizeFromPlatformType(
                                            platformType: widget.platformType,
                                            webValue: 24,
                                            tabletValue: 18,
                                            mobileValue: 15,
                                          ).sp,
                                          fontWeight: FontWeight.w700,
                                          color: sendCodeController == false
                                              ? Theme.of(context).primaryColor
                                              : Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.5),
                                        ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      isDense: true,
                      counterText: "",
                      border: InputBorder.none,
                      hintText: tr('profile.enter_phone'),
                      hintStyle: TextStyle(
                        fontSize: getSizeFromPlatformType(
                          platformType: widget.platformType,
                          webValue: 24,
                          tabletValue: 18,
                          mobileValue: 15,
                        ).sp,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                      ),
                      errorStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: getSizeFromPlatformType(
                        platformType: widget.platformType,
                        webValue: 24,
                        tabletValue: 18,
                        mobileValue: 15,
                      ).sp,
                      fontWeight: FontWeight.w700,
                      color: sendCodeController == false
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        sendCodeController == true
            ? Positioned(
                top: 12.h,
                right: widget.platformType == PlatformTypeState.mobile
                    ? 15.h
                    : 28.w,
                child: InkWell(
                  onTap: () {
                    sendCodeState.state = false;
                  },
                  child: Icon(
                    Icons.edit,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

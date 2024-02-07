import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/identity_state_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ProfileCountryCodePickerMobile extends HookConsumerWidget {
  const ProfileCountryCodePickerMobile({
    required this.platformType,
    required this.countryController,
    required this.validateErrorCountry,
    super.key,
  });

  final PlatformTypeState platformType;
  final TextEditingController countryController;
  final ValueNotifier<bool> validateErrorCountry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final identityState = ref.read(identityStateNotifierProvider.notifier);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isLightTheme(context)
                ? Theme.of(context).primaryColor.withOpacity(0.05)
                : AppColors.whiteColor.withOpacity(0.25),
            width: 5..h,
          ),
        ),
      ),
      child: CountryCodePicker(
        padding: EdgeInsets.only(bottom: 20..h, top: 20..h),
        barrierColor: Colors.transparent,
        boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: isLightTheme(context)
              ? AppColors.mainBackgroundLightColor
              : AppColors.mainBackgroundDarkColor,
        ),
        dialogBackgroundColor: isLightTheme(context)
            ? AppColors.mainBackgroundLightColor
            : AppColors.mainBackgroundDarkColor,
        backgroundColor: isLightTheme(context)
            ? AppColors.mainBackgroundLightColor
            : AppColors.mainBackgroundDarkColor,
        textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: isLightTheme(context)
                  ? Theme.of(context).primaryColor
                  : AppColors.whiteColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              letterSpacing: -0.75.sp,
            ),
        dialogTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: isLightTheme(context)
                  ? Theme.of(context).primaryColor
                  : AppColors.whiteColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              letterSpacing: -0.75.sp,
            ),
        closeIcon: const Icon(
          Icons.close,
          size: 0.001,
        ),
        searchDecoration: InputDecoration(
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
              color: MainColorsApp.redColor,
              width: 5..h,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: isLightTheme(context)
                  ? AppColors.mainBackgroundLightColor
                  : AppColors.whiteColor.withOpacity(0.25),
              width: 5..h,
            ),
          ),
          hintText: tr('profile.type_a_country'),
          hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.75.sp,
                color: isLightTheme(context)
                    ? AppColors.aboutHeaderLight
                    : AppColors.whiteColor.withOpacity(0.5),
              ),
        ),
        dialogSize: Size(
          double.infinity,
          500..h,
        ),
        onChanged: (value) {
          countryController.text = value.name!;
          identityState.updateCountry(value.name!);
        },
        initialSelection: tr('profile.country'),
        showCountryOnly: true,
        builder: (name) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 14..h),
                child: Text(
                  (countryController.text.isNotEmpty)
                      ? "${name!.name}"
                      : tr('profile.country_of_residence'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: (countryController.text.isNotEmpty)
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColor.withOpacity(0.5),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 14..h),
                child: Icon(
                  Icons.expand_more,
                  color: isLightTheme(context)
                      ? Theme.of(context).primaryColor
                      : AppColors.whiteColor,
                  size: 22.w,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

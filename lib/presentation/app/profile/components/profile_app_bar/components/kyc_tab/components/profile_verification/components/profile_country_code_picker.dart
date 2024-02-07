import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/identity_state_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ProfileCountryCodePicker extends HookConsumerWidget {
  const ProfileCountryCodePicker({
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
        border: Border.all(
          color: isLightTheme(context)
              ? Theme.of(context).primaryColor.withOpacity(0.05)
              : AppColors.whiteColor.withOpacity(0.25),
          width: 1.0,
        ),
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(
          getSizeFromPlatformType(
            platformType: platformType,
            webValue: 10,
            tabletValue: 10,
            mobileValue: 5,
          ).r,
        ),
      ),
      height: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 70,
        tabletValue: 60,
        mobileValue: 40,
      ).h,
      child: CountryCodePicker(
        barrierColor: AppColors.placeHolderGrey,
        padding: EdgeInsets.only(
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
          left: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 23,
            tabletValue: 15,
            mobileValue: 11,
          ).w,
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
        textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: isLightTheme(context)
                  ? Theme.of(context).primaryColor
                  : AppColors.whiteColor,
              fontSize: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 20,
                tabletValue: 15,
                mobileValue: 10,
              ).sp,
            ),
        dialogTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: isLightTheme(context)
                  ? Theme.of(context).primaryColor
                  : AppColors.whiteColor,
              fontSize: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 20,
                tabletValue: 15,
                mobileValue: 10,
              ).sp,
            ),
        searchDecoration: InputDecoration(
          isDense: true,
          errorMaxLines: 1,
          errorStyle: const TextStyle(
            height: 0.01,
          ),
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
          filled: true,
          fillColor: isLightTheme(context)
              ? AppColors.whiteColor
              : AppColors.mainBackgroundDarkColor,
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
                  ? Theme.of(context).primaryColor.withOpacity(0.05)
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
          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                fontSize: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 20,
                  tabletValue: 15,
                  mobileValue: 10,
                ).sp,
              ),
        ),
        dialogSize: Size(
          320.w,
          682.h,
        ),
        onChanged: (value) {
          countryController.text = value.name!;
          identityState.updateCountry(value.name!);
        },
        initialSelection: tr('profile.country'),
        showCountryOnly: true,
        builder: (name) {
          return Container(
            height: 55.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 10,
                  tabletValue: 10,
                  mobileValue: 5,
                ).r,
              ),
              color: Theme.of(context).inputDecorationTheme.fillColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 23,
                      tabletValue: 15,
                      mobileValue: 11,
                    ).w,
                  ),
                  child: Text(
                    (countryController.text.isNotEmpty)
                        ? "${name!.name}"
                        : tr('profile.country_of_residence'),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: (countryController.text.isNotEmpty)
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColor.withOpacity(0.5),
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 20,
                            tabletValue: 15,
                            mobileValue: 10,
                          ).sp,
                        ),
                  ),
                ),
                const Spacer(),
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
              ],
            ),
          );
        },
      ),
    );
  }
}

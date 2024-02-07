import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/identity_state_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ProfileDateInput extends HookConsumerWidget {
  const ProfileDateInput({
    required this.platformType,
    required this.dateCtlController,
    super.key,
  });

  final PlatformTypeState platformType;
  final TextEditingController dateCtlController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final identityState = ref.read(identityStateNotifierProvider.notifier);

    return SizedBox(
      height: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 80,
        tabletValue: 60,
        mobileValue: 50,
      ).h,
      child: TextFormField(
        readOnly: true,
        controller: dateCtlController,
        keyboardType: TextInputType.datetime,
        onTap: () async {
          DateTime? date;
          FocusScope.of(context).requestFocus(
            FocusNode(),
          );
          date = await showDatePicker(
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: Theme.of(context).primaryColorLight,
                    onSurface: isLightTheme(context)
                        ? AppColors.blackColor
                        : AppColors.whiteColor,
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      foregroundColor: isLightTheme(context)
                          ? Theme.of(context).primaryColor
                          : AppColors.whiteColor,
                    ),
                  ),
                ),
                child: child!,
              );
            },
            context: context,
            initialEntryMode: DatePickerEntryMode.calendar,
            initialDate: DateTime.now(),
            firstDate: DateTime(1920),
            lastDate: DateTime.now(),
          );
          if (date != null) {
            dateCtlController.text = date.toString().split(' ')[0];
            identityState.updateDateOfBirth(date.toString().split(' ')[0]);
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            return '';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          isDense: true,
          errorStyle: const TextStyle(
            fontSize: 0,
            height: 0,
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
                  ? Theme.of(context).primaryColor.withOpacity(0.05)
                  : AppColors.whiteColor.withOpacity(0.25),
              width: 1.0,
            ),
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
          hintText: tr('profile.identity_date_of_birth'),
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
            left: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 23,
              tabletValue: 15,
              mobileValue: 11,
            ).w,
          ),
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
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 20,
                tabletValue: 15,
                mobileValue: 10,
              ).sp,
            ),
      ),
    );
  }
}

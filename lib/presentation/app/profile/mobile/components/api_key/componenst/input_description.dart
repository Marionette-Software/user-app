import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/api_key/api_key_state_notifier_provider.dart';
import 'package:user_app/domain/api_key/api_key_state.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/infrastructure/api_key/__generated__/create_api_key.data.gql.dart';
import 'package:user_app/infrastructure/api_key/api_key_service.dart';
import 'package:user_app/presentation/app/profile/mobile/components/api_key/componenst/created_api_key_details.dart';
import 'package:user_app/presentation/components/two_fa/mobile/permission_two_fa.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class InputDecorationMobile extends HookConsumerWidget {
  const InputDecorationMobile({
    required this.descriptionController,
    required this.descriptionValue,
    required this.createButtonState,
    super.key,
  });

  final TextEditingController descriptionController;
  final ValueNotifier<String> descriptionValue;
  final ValueNotifier<bool> createButtonState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ApiKeyService service = ApiKeyService();

    createApiKey(String code) async {
      var response = await service.createApiKey(
        description: descriptionValue.value,
        otpCode: code,
      );

      if (response is GraphQlError) {
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          clipBehavior: Clip.none,
          padding: EdgeInsets.only(
            bottom:
                // ignore: use_build_context_synchronously
                MediaQuery.viewInsetsOf(context).bottom + 30
                  ..h,
          ),
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            titleFontSize: 20.sp,
            messageFontSize: 15.sp,
            title: tr('snack_bar_message.errors.error'),
            message: response.message,
            contentType: ContentType.failure,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      } else if (response is GCreateUserApiKeyData_createApiKey) {
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          clipBehavior: Clip.none,
          padding: EdgeInsets.only(
            bottom:
                // ignore: use_build_context_synchronously
                MediaQuery.viewInsetsOf(context).bottom + 30
                  ..h,
          ),
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            titleFontSize: 20.sp,
            messageFontSize: 15.sp,
            title: tr('snack_bar_message.success.success'),
            message: tr('snack_bar_message.success.new_api_key_created'),
            contentType: ContentType.success,
          ),
        );

        ref.read(apiKeyStateNotifierProvider.notifier).addApiKey(
              ApiKeyState(
                id: response.id!,
                description: response.description!,
                scope: response.scope!,
                expires: response.expires!,
              ),
            );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);

        createButtonState.value = !createButtonState.value;
        descriptionValue.value = '';
        descriptionController.clear();

        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreatedApiKeyDetailsMobile(
              apiKeyToken: response.token!,
            ),
          ),
        );
      }
    }

    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
          controller: descriptionController,
          onChanged: (value) {
            descriptionValue.value = value;
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(20),
          ],
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
              borderSide:
                  BorderSide(color: MainColorsApp.redColor, width: 5..h),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: isLightTheme(context)
                    ? AppColors.mainBackgroundLightColor
                    : AppColors.whiteColor.withOpacity(0.25),
                width: 5..h,
              ),
            ),
            hintText: 'Input new API key description'.hardcoded,
            hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
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
        SizedBox(
          height: 20..h,
        ),
        InkWell(
          onTap: descriptionValue.value.isNotEmpty
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PerditionTwoFaMobile(
                        onPermission2Fa: createApiKey,
                      ),
                    ),
                  );
                }
              : null,
          child: Container(
            width: double.infinity,
            height: 45..h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: descriptionValue.value.isNotEmpty
                  ? MainColorsApp.accentColor
                  : MainColorsApp.accentColor.withOpacity(0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    tr('profile.create'),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.75.sp),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

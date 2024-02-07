// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/api_key/api_key_state_notifier_provider.dart';
import 'package:user_app/domain/api_key/api_key_state.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/infrastructure/api_key/__generated__/create_api_key.data.gql.dart';
import 'package:user_app/infrastructure/api_key/api_key_service.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/profile/web/components/api_key/components/created_api_key_details.dart';
import 'package:user_app/presentation/components/two_fa/permission_2fa.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class InputDecorationWeb extends HookConsumerWidget {
  const InputDecorationWeb({
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
          clipBehavior: Clip.none,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            titleFontSize: 30.sp,
            messageFontSize: 20.sp,
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
          clipBehavior: Clip.none,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            titleFontSize: 30.sp,
            messageFontSize: 20.sp,
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

       context.pop();

        createButtonState.value = !createButtonState.value;
        descriptionValue.value = '';
        descriptionController.clear();

        showDialog(
          barrierColor: AppColors.placeHolderGrey,
          context: context,
          builder: (context) => ModalWindowWallet(
            titleSize: 30,
            title: '',
            content: CreatedApiKeyDetailsWeb(
              apiKeyToken: response.token!,
            ),
          ),
        );
      }
    }

    return Padding(
      padding: EdgeInsets.only(top: 50.h),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
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
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
            decoration: InputDecoration(
              isDense: true,
              errorStyle: const TextStyle(
                fontSize: 0,
                height: 0,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              hintText: tr('profile.input_new_api_key_description'),
              hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: isLightTheme(context)
                        ? Theme.of(context).primaryColor.withOpacity(0.5)
                        : AppColors.whiteColor.withOpacity(0.5),
                  ),
              contentPadding: EdgeInsets.only(
                top: 28.h,
                bottom: 28.h,
                left: 23.w,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 15.w,
              top: 5.h,
              bottom: 5.h,
            ),
            child: InkWell(
              onTap: descriptionValue.value.isNotEmpty
                  ? () {
                      showDialog(
                        barrierColor: AppColors.placeHolderGrey,
                        context: context,
                        builder: (context) => ModalWindowWallet(
                          titleSize: 30,
                          title: '',
                          content: Permission2Fa(
                            onPermission2Fa: createApiKey,
                            platformType: PlatformTypeState.web,
                          ),
                        ),
                      );
                    }
                  : null,
              child: Container(
                width: 163.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
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
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: AppColors.whiteColor,
                                  fontSize: 20.sp,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/api_key/api_key_state_notifier_provider.dart';
import 'package:user_app/application/two_fa/actions/two_fa_actions.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/infrastructure/api_key/api_key_service.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/profile/web/components/api_key/components/api_key_item.dart';
import 'package:user_app/presentation/components/two_fa/activation_two_fa.dart';
import 'package:user_app/presentation/components/two_fa/permission_2fa.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ApiKeyListWeb extends HookConsumerWidget {
  const ApiKeyListWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IApiKeyService service = ApiKeyService();
    TwoFaActionsGeneral twoFaActionsGeneral = TwoFaActionsGeneral();

    final apiKeyWatch = ref.watch(apiKeyStateNotifierProvider);
    final deleteItemId = useState('');

    deleteApiKey(String code) async {
      var response = await service.deleteApiKey(
        deleteItemId.value,
        code,
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
      } else if (response is String) {
        ref
            .read(apiKeyStateNotifierProvider.notifier)
            .removeApiKey(deleteItemId.value);

        final snackBar = SnackBar(
          elevation: 0,
          clipBehavior: Clip.none,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            titleFontSize: 30.sp,
            messageFontSize: 20.sp,
            title: tr('snack_bar_message.success.success'),
            message: tr('snack_bar_message.success.api_key_deleted'),
            contentType: ContentType.success,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);

        context.pop();
      }
    }

    return apiKeyWatch.isNotEmpty
        ? Padding(
            padding: EdgeInsets.only(top: 60.h),
            child: SizedBox(
              height: 600.h,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: apiKeyWatch.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15.h,
                  ),
                  itemBuilder: (context, i) {
                    var item = apiKeyWatch[i];
                    return ApiKeyItemWeb(
                      onTap: () async {
                        var twoFaStatus =
                            await twoFaActionsGeneral.getTwoFaStatus();
                        deleteItemId.value = item.id;

                        if (twoFaStatus) {
                          showDialog(
                            barrierColor: AppColors.placeHolderGrey,
                            context: context,
                            builder: (context) => ModalWindowWallet(
                              titleSize: 30,
                              title: '',
                              content: Permission2Fa(
                                onPermission2Fa: deleteApiKey,
                                platformType: PlatformTypeState.web,
                              ),
                            ),
                          );
                        } else {
                          showDialog(
                            barrierColor: AppColors.placeHolderGrey,
                            context: context,
                            builder: (context) => ModalWindowWallet(
                              titleSize: 30,
                              shapeRadius: 10,
                              title: '',
                              content: ActivationTwoFa(
                                activateMessage:
                                    tr('profile.activate_2fa_to_delete_key'),
                                platformType: PlatformTypeState.web,
                              ),
                            ),
                          );
                        }
                      },
                      item: item,
                    );
                  },
                ),
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(top: 53.h),
            child: Center(
              child: Text(
                tr('profile.no_api_keys'),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: isLightTheme(context)
                          ? Theme.of(context).primaryColor.withOpacity(0.25)
                          : AppColors.whiteColor.withOpacity(0.25),
                      fontSize: 20.sp,
                    ),
              ),
            ),
          );
  }
}

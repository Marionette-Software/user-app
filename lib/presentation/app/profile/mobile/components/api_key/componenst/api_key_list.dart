import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/api_key/api_key_state_notifier_provider.dart';
import 'package:user_app/application/api_key/get_api_key_future_provider.dart';
import 'package:user_app/application/two_fa/actions/two_fa_actions.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/infrastructure/api_key/api_key_service.dart';
import 'package:user_app/presentation/app/profile/mobile/components/api_key/componenst/api_key_item.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/components/two_fa/mobile/activation_two_fa.dart';
import 'package:user_app/presentation/components/two_fa/mobile/permission_two_fa.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ApiKeyListMobile extends HookConsumerWidget {
  const ApiKeyListMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IApiKeyService service = ApiKeyService();
    TwoFaActionsGeneral twoFaActionsGeneral = TwoFaActionsGeneral();

    final apiKeyWatch = ref.watch(apiKeyStateNotifierProvider);
    final refreshValue = useState(1);

    final apiKeyFuture = ref.watch(
      getApiKeyFutureProvider(
        RefreshRequest(refresh: '$refreshValue'),
      ),
    );

    final deleteItemId = useState('');

    deleteApiKey(String code) async {
      var response = await service.deleteApiKey(
        deleteItemId.value,
        code,
      );

      if (response is GraphQlError) {
        final snackBar = SnackBar(
          elevation: 0,
          padding: EdgeInsets.only(
            bottom:
                // ignore: use_build_context_synchronously
                MediaQuery.viewInsetsOf(context).bottom + 30
                  ..h,
          ),
          behavior: SnackBarBehavior.floating,
          clipBehavior: Clip.none,
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
      } else if (response is String) {
        ref
            .read(apiKeyStateNotifierProvider.notifier)
            .removeApiKey(deleteItemId.value);

        final snackBar = SnackBar(
          elevation: 0,
          padding: EdgeInsets.only(
            bottom:
                // ignore: use_build_context_synchronously
                MediaQuery.viewInsetsOf(context).bottom + 30
                  ..h,
          ),
          clipBehavior: Clip.none,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            titleFontSize: 20.sp,
            messageFontSize: 15.sp,
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

    return apiKeyFuture.when(
      data: (data) {
        return apiKeyWatch.isNotEmpty
            ? ListView.separated(
                itemCount: apiKeyWatch.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 15..h,
                ),
                itemBuilder: (context, i) {
                  var item = apiKeyWatch[i];
                  return ApiKeyItemMobile(
                    onTap: () async {
                      var twoFaStatus =
                          await twoFaActionsGeneral.getTwoFaStatus();
                      deleteItemId.value = item.id;

                      if (twoFaStatus) {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PerditionTwoFaMobile(
                              onPermission2Fa: deleteApiKey,
                            ),
                          ),
                        );
                      } else {
                        // ignore: use_build_context_synchronously
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return const ActivationTwoFaMobile(
                              title:
                                  'Please activate Two Factor\nAuthentication to delete new API key',
                            );
                          },
                        );
                      }
                    },
                    item: item,
                  );
                },
              )
            : Padding(
                padding: EdgeInsets.only(top: 35..h),
                child: Center(
                  child: Text(
                    tr('profile.no_api_keys'),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : AppColors.whiteColor.withOpacity(0.5),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.75,
                        ),
                  ),
                ),
              );
      },
      error: (error, _) => UserAppError(
        errorMessage: error.toString(),
      ),
      loading: () => Padding(
        padding: EdgeInsets.only(top: 100..h),
        child: const MainLoaderMobile(
          loaderSize: 100,
        ),
      ),
    );
  }
}

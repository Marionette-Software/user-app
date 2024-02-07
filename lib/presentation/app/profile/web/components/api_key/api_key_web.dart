import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/api_key/get_api_key_future_provider.dart';
import 'package:user_app/application/two_fa/actions/two_fa_actions.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/presentation/app/components/header_web/header_web.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/profile/web/components/api_key/components/api_key_list.dart';
import 'package:user_app/presentation/app/profile/web/components/api_key/components/input_description.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/components/two_fa/activation_two_fa.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ApiKeyWeb extends HookConsumerWidget {
  const ApiKeyWeb({
    Key? key,
  }) : super(key: key);

  static const routeName = '/apiKey';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createButtonState = useState(true);
    final descriptionValue = useState('');

    final descriptionController = useTextEditingController();
    TwoFaActionsGeneral twoFaActionsGeneral = TwoFaActionsGeneral();

    final refreshValue = useState(1);
    final apiKeyFuture = ref.watch(
      getApiKeyFutureProvider(
        RefreshRequest(refresh: '$refreshValue'),
      ),
    );

    useEffect(() {
      if (refreshValue.value == 0) {
        refreshValue.value++;
      }
      return null;
    }, []);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          60.h,
        ),
        child: const HeaderWeb(),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 50.h),
          child: Container(
            width: 600.w,
            height: 846.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  isLightTheme(context)
                      ? AppColors.whiteColor
                      : AppColors.whiteColor.withOpacity(0.1),
                  isLightTheme(context)
                      ? AppColors.whiteColor
                      : AppColors.whiteColor.withOpacity(0.0),
                ],
              ),
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                isLightTheme(context)
                    ? BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        spreadRadius: 10,
                        blurRadius: 20,
                        offset: const Offset(0, 3),
                      )
                    : BoxShadow(
                        color: Theme.of(context)
                            .primaryColorLight
                            .withOpacity(0.0),
                        spreadRadius: 15,
                        blurRadius: 30,
                        offset: const Offset(0, 3),
                      )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 25.w,
                right: 10.w,
              ),
              child: Column(
                children: [
                  createButtonState.value
                      ? Padding(
                          padding: EdgeInsets.only(top: 60.h),
                          child: InkWell(
                            onTap: () async {
                              var twoFaStatus =
                                  await twoFaActionsGeneral.getTwoFaStatus();

                              if (twoFaStatus!) {
                                createButtonState.value =
                                    !createButtonState.value;
                              } else {
                                // ignore: use_build_context_synchronously
                                showDialog(
                                  barrierColor: AppColors.placeHolderGrey,
                                  context: context,
                                  builder: (context) => ModalWindowWallet(
                                    titleSize: 30,
                                    shapeRadius: 10,
                                    title: '',
                                    content: ActivationTwoFa(
                                      activateMessage: tr(
                                          'profile.activate_2fa_to_create_key'),
                                      platformType: PlatformTypeState.web,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              width: 296.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: MainColorsApp.accentColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  UserAppImage(
                                    path: plusIcon,
                                    width: 18.w,
                                    isNetwork: false,
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Center(
                                    child: Text(
                                      tr('profile.create_new_api_key'),
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.sp,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : InputDecorationWeb(
                          createButtonState: createButtonState,
                          descriptionValue: descriptionValue,
                          descriptionController: descriptionController,
                        ),
                  SizedBox(
                    height: 20.h,
                  ),
                  apiKeyFuture.when(
                    data: (data) {
                      return const ApiKeyListWeb();
                    },
                    error: (error, _) => UserAppError(
                      errorMessage: error.toString(),
                    ),
                    loading: () => Padding(
                      padding: EdgeInsets.only(top: 180.h),
                      child: const MainLoader(),
                    ),
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

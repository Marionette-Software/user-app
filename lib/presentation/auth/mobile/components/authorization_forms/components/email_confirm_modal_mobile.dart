// ignore_for_file: use_build_context_synchronously
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_notifier.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_progress_state.dart';
import 'package:user_app/domain/non_custodial_exchange/stepper_progress.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/auth/auth_service.dart';
import 'package:user_app/presentation/app/wallets/wallets.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class EmailConfirmMobileModal extends HookConsumerWidget {
  const EmailConfirmMobileModal({
    super.key,
    required this.email,
    required this.password,
    required this.signUpWithNonCustodial,
    this.fontSize,
  });

  final String email;
  final String password;
  final double? fontSize;
  final bool signUpWithNonCustodial;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final controllerRead = ref.read(controllerStateProvider.notifier);
    final progress = ref.read(nonCustodialProgressStateProvider.notifier);
    final progressState = ref.read(nonCustodialStateProvider.notifier);
    final currencyStateWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);

    final loaderState = useState(LoadState.notLoading);

    IAuthService service = AuthService();

    return Container(
      height: 300.h,
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
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: isLightTheme(context)
                ? Colors.transparent
                : AppColors.whiteColor.withOpacity(0.25),
          ),
        ),
      ),
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 85.w,
                child: Divider(
                  color: isLightTheme(context)
                      ? Theme.of(context).primaryColor.withOpacity(0.1)
                      : AppColors.whiteColor.withOpacity(0.8),
                  thickness: 3,
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                tr('authorization.wellcome_to'),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: fontSize!.sp,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              SizedBox(
                height: 3.h,
              ),
              UserAppImage(
                width: 127.w,
                height: 20.h,
                path: isLightTheme(context) ? appLogoPath : appLogoPathDark,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                tr('authorization.registration_compleated'),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: fontSize!.sp,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(
                height: 9.h,
              ),
              Text(
                tr('authorization.proceed_to_login_to_your_account'),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: fontSize!.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
              ),
              SizedBox(
                height: 9.h,
              ),
              loaderState.value == LoadState.loading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: 270.w,
                      height: 35.h,
                      child: MainButton(
                        disableColor:
                            MainColorsApp.accentColor.withOpacity(0.5),
                        color: Theme.of(context).primaryColorLight,
                        onTap: () async {
                          loaderState.value = LoadState.loading;

                          final response = await service.login(
                            email: email,
                            password: password,
                          );
                          if (response is GraphQlError) {
                            final snackBar = SnackBar(
                              elevation: 0,
                              clipBehavior: Clip.none,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                title: tr('snack_bar_message.errors.error'),
                                message: response.message,
                                contentType: ContentType.failure,
                              ),
                            );

                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);

                            loaderState.value = LoadState.notLoading;
                          } else {
                            loaderState.value = LoadState.notLoading;
                            var uBox =
                                Hive.box<UserConfigData>(Constants.userConfig);
                            var uData = UserConfigData(
                              token: response.data!.login!.token,
                              userId: response.data!.login!.id,
                              userName:
                                  response.data!.login!.profiles!.length == 0
                                      ? 'User'
                                      : response.data!.login!.profiles!.first
                                              .first_name! +
                                          ' ' +
                                          response.data!.login!.profiles!.first
                                              .last_name!,
                            );
                            uBox.putAt(0, uData);
                            loaderState.value = LoadState.notLoading;
                            // controllerRead.state = ControllerState.authorized;

                            if (signUpWithNonCustodial) {
                              var nonCustodialBox =
                                  await Hive.openBox('nonCustodialBox');
                              StepperProgress stepperProgress = StepperProgress(
                                authenticated: 'true',
                                isWalletConnect: 'false',
                              );
                              nonCustodialBox.putAt(0, stepperProgress);
                              if (currencyStateWatch.wcAddress != '') {
                                progressState.state =
                                    NonCustodialState.walletConnected;
                              } else {
                                progressState.state = NonCustodialState.receive;
                              }

                              progress.state++;
                              context.pop();
                            } else {
                              context.go(Wallets.routeName);
                            }
                          }
                        },
                        text: tr('authorization.login'),
                        height: 60.h,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

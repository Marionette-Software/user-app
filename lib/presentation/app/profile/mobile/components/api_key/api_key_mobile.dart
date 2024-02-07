import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/two_fa/actions/two_fa_actions.dart';
import 'package:user_app/presentation/app/profile/mobile/components/api_key/componenst/api_key_list.dart';
import 'package:user_app/presentation/app/profile/mobile/components/api_key/componenst/input_description.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/two_fa/mobile/activation_two_fa.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ApiKeyMobile extends StatefulHookConsumerWidget {
  const ApiKeyMobile({
    super.key,
  });

  @override
  ConsumerState<ApiKeyMobile> createState() => _ApiKeyMobileState();
}

final ScrollController scrollController = ScrollController();

class _ApiKeyMobileState extends ConsumerState<ApiKeyMobile> {
  @override
  Widget build(BuildContext context) {
    final createButtonState = useState(true);
    final descriptionValue = useState('');

    final descriptionController = useTextEditingController();
    TwoFaActionsGeneral twoFaActionsGeneral = TwoFaActionsGeneral();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainBackgroundDarkColor,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50..h),
          child: Padding(
            padding: EdgeInsets.only(
              top: 15..h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: BackButtonMobile(
                    onTap: () => context.pop(),
                  ),
                ),
                Text(
                  'API Keys',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 15.sp,
                        letterSpacing: -0.75.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  width: 70.w,
                  height: 25..h,
                )
              ],
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 10..h,
          ),
          decoration: BoxDecoration(
            color: isLightTheme(context)
                ? AppColors.whiteColor
                : walletBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 20..h, left: 15.w, right: 15.w),
            child: Column(
              children: [
                createButtonState.value
                    ? InkWell(
                        onTap: () async {
                          var twoFaStatus =
                              await twoFaActionsGeneral.getTwoFaStatus();

                          if (twoFaStatus!) {
                            createButtonState.value = !createButtonState.value;
                          } else {
                            // ignore: use_build_context_synchronously
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) {
                                return const ActivationTwoFaMobile(
                                  title:
                                      'Please activate Two Factor\nAuthentication to create new API key',
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 45..h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            color: MainColorsApp.accentColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              UserAppImage(
                                path: plusIcon,
                                width: 15.w,
                                isNetwork: false,
                              ),
                              SizedBox(
                                width: 10.w,
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
                                        fontSize: 15.sp,
                                        letterSpacing: -0.75.sp,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : InputDecorationMobile(
                        createButtonState: createButtonState,
                        descriptionValue: descriptionValue,
                        descriptionController: descriptionController,
                      ),
                SizedBox(
                  height: 20..h,
                ),
                Expanded(
                  child: Scrollbar(
                    controller: scrollController,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: const ApiKeyListMobile(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20..h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

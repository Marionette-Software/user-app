import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/user/get_ref_user_future_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/presentation/app/profile/mobile/components/referrals_user/components/container_ref_code_details_mobile.dart';
import 'package:user_app/presentation/app/profile/mobile/components/referrals_user/components/list_referrals.level_mobile.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ReferralsUserMobile extends HookConsumerWidget {
  const ReferralsUserMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreshValue = useState(1);
    useEffect(() {
      if (refreshValue.value == 0) {
        refreshValue.value++;
      }
      return null;
    }, []);

    final getRefUser = ref.watch(
      refUserFutureProvider(
        RefreshRequest(refresh: '$refreshValue'),
      ),
    );

    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

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
                  'Referral Code'.hardcoded,
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
            padding: EdgeInsets.only(top: 30..h),
            child: getRefUser.when(
              data: (responseRefUser) {
                String refUserUrl =
                    '${globalData.url}/#/controller/ref_code?code=${responseRefUser.refCode}';

                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30.w,
                        right: 30.w,
                      ),
                      child: Column(
                        children: [
                          ContainerReCodeDetailsMobile(
                            iconDetail: heshIcon,
                            codeText: responseRefUser.refCode,
                          ),
                          SizedBox(
                            height: 30..h,
                          ),
                          ContainerReCodeDetailsMobile(
                            iconDetail: linkIcon,
                            codeText: refUserUrl,
                          ),
                          SizedBox(
                            height: 30..h,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'My referrals'.hardcoded,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 20.sp,
                            letterSpacing: -1.sp,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(
                      height: 7..h,
                    ),
                    ListReferralsLevelMobile(
                      referralsByLevel: responseRefUser.referralsByLevel,
                    )
                  ],
                );
              },
              error: (error, _) => UserAppError(
                errorMessage: error.toString(),
              ),
              loading: () => Padding(
                padding: EdgeInsets.only(top: 30..h),
                child: const MainLoaderMobile(
                  loaderSize: 100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

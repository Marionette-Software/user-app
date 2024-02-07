import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/user/get_ref_user_future_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/presentation/app/components/header_web/header_web.dart';
import 'package:user_app/presentation/app/profile/web/components/referral_user.dart/components.dart/conteiner_ref_code_details.dart';
import 'package:user_app/presentation/app/profile/web/components/referral_user.dart/components.dart/list_referrals_level.dart';
import 'package:user_app/presentation/auth/web/components/footer_components/footer.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/helpers/error.dart';

class ReferralUserWeb extends HookConsumerWidget {
  const ReferralUserWeb({Key? key}) : super(key: key);

  static const routeName = '/referralUser';

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

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: const HeaderWeb(),
      ),
      body: getRefUser.when(
        data: (responseRefUser) {
          String refUserUrl =
              '${globalData.url}/#/controller/ref_code?code=${responseRefUser.refCode}';

          return Scaffold(
            body: Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Column(
                    children: [
                      MainDecorationContainerWeb(
                        content: SizedBox(
                          width: 600.w,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 30.h,
                              bottom: 25.h,
                              left: 25.w,
                              right: 25.w,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Referral Code',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30.sp,
                                        letterSpacing: -1.5.sp,
                                      ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                ContainerReCodeDetailsWeb(
                                  iconDetail: heshIcon,
                                  codeText: responseRefUser.refCode,
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                ContainerReCodeDetailsWeb(
                                  iconDetail: linkIcon,
                                  codeText: refUserUrl,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      MainDecorationContainerWeb(
                        content: SizedBox(
                          width: 600.w,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 30.h,
                              bottom: 25.h,
                              left: 25.w,
                              right: 25.w,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'My referrals',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30.sp,
                                        letterSpacing: -1.5.sp,
                                      ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ListReferralsLevelWeb(
                                  referralsByLevel:
                                      responseRefUser.referralsByLevel,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 81.h,
                      ),
                      const FooterWeb(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        error: (error, _) => UserAppError(
          errorMessage: error.toString(),
        ),
        loading: () => const MainLoader(),
      ),
    );
  }
}

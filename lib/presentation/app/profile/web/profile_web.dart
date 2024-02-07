import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/user/profile_future_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/presentation/app/components/header_web/header_web.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/profile_app_bar.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/user_profile_header.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ProfileWeb extends HookConsumerWidget {
  const ProfileWeb({
    super.key,
    required this.indexSelectedTab,
  });

  final int? indexSelectedTab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreshValue = useState(1);
    final userFuture = ref.watch(
      userGetUserFutureProvider(
        RefreshRequest(
          refresh: '$refreshValue',
        ),
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
      body: userFuture.when(
        data: (data) {
          var user = data.data!.user;

          return Container(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: isLightTheme(context)
                  ? const DecorationImage(
                      image: AssetImage(bgInner),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Center(
              child: Container(
                padding: EdgeInsets.only(
                  top: 83.h,
                ),
                alignment: Alignment.centerLeft,
                width: 600.w,
                child: Column(
                  children: [
                    UserProfileHeader(
                      platformType: PlatformTypeState.web,
                      email: user!.email!,
                      name: data.data!.user!.profiles!.isEmpty
                          ? tr('profile.user')
                          : '${data.data!.user!.profiles!.first!.first_name!} ${data.data!.user!.profiles!.first!.last_name!}',
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    ProfileAppBar(
                      platformType: PlatformTypeState.web,
                      indexSelectedTab: indexSelectedTab!,
                      user: user,
                      email: user.email!,
                      enabled2fa: user.enabled2fa!,
                    ),
                  ],
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

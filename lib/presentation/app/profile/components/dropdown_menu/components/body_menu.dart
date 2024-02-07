import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/user_get_request.data.gql.dart';
import 'package:user_app/presentation/app/history/history.dart';
import 'package:user_app/presentation/app/profile/actions/show_profile_modal.dart';
import 'package:user_app/presentation/app/profile/profile.dart';
import 'package:user_app/presentation/app/profile/components/dropdown_menu/components/fa_status.dart';
import 'package:user_app/presentation/app/profile/components/dropdown_menu/components/item_menu_component.dart';
import 'package:user_app/presentation/app/profile/components/dropdown_menu/components/verification_component.dart';
import 'package:user_app/presentation/app/profile/web/components/api_key/api_key_web.dart';
import 'package:user_app/presentation/app/profile/web/components/referral_user.dart/referral_user_web.dart';
import 'package:user_app/presentation/app/user_orders/user_orders.dart';

class BodyMenuComponentWeb extends HookConsumerWidget {
  const BodyMenuComponentWeb({
    super.key,
    required this.emailVerified,
    required this.phoneVerified,
    required this.haveDocuments,
    required this.profileVerified,
    required this.user,
    required this.platformType,
  });

  final bool emailVerified;
  final bool phoneVerified;
  final bool haveDocuments;
  final bool profileVerified;
  final GGetUpdateUserData_user user;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    return Column(
      children: [
        SizedBox(
          height: 42.h,
        ),
        FAStatusWeb(
          platformType: platformType,
        ),
        SizedBox(
          height: 24.h,
        ),
        ItemMenuComponent(
          platformType: platformType,
          title: tr('API Keys'),
          haveBorder: true,
          onTap: () async {
            context.go(ApiKeyWeb.routeName);
          },
        ),
        VerificationItemWeb(
          platformType: platformType,
          emailVerified: emailVerified,
          phoneVerified: phoneVerified,
          haveDocuments: haveDocuments,
          profileVerified: profileVerified,
          user: user,
        ),
        globalData.enabledTradingPage
            ? ItemMenuComponent(
                platformType: platformType,
                title: tr('profile.open_orders'),
                haveBorder: true,
                onTap: () async {
                  context.go(UserOrders.routeName);
                },
              )
            : const SizedBox(),
        ItemMenuComponent(
          platformType: platformType,
          title: tr('profile.history'),
          haveBorder: true,
          onTap: () async {
            context.go(History.routeName);
          },
        ),
        globalData.enabledReferrals
            ? ItemMenuComponent(
                platformType: platformType,
                title: 'Referrals',
                haveBorder: true,
                onTap: () async {
                  context.go(ReferralUserWeb.routeName);
                },
              )
            : const SizedBox(),
        ItemMenuComponent(
          platformType: platformType,
          title: tr('profile.title_change_password'),
          haveBorder: true,
          onTap: () async {
            ShowProfileModalAction().showChangePasswordModal(
              context: context,
              platformType: platformType,
            );
          },
        ),
        ItemMenuComponent(
          platformType: platformType,
          title: tr('profile.settings'),
          haveBorder: false,
          onTap: () async {
            context.go(Profile.routeName);
          },
        ),
      ],
    );
  }
}

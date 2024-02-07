import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/user_get_request.data.gql.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/details.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/kyc_tab.dart';
import 'package:user_app/presentation/app/profile/mobile/components/about_system_container.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/app_bar_item.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/settings_tab/settings.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class ProfileAppBar extends StatefulWidget {
  const ProfileAppBar({
    super.key,
    required this.enabled2fa,
    required this.email,
    required this.user,
    required this.indexSelectedTab,
    required this.platformType,
  });

  final bool enabled2fa;
  final String email;
  final GGetUpdateUserData_user user;
  final int indexSelectedTab;
  final PlatformTypeState platformType;

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late int _tabIndex;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.indexSelectedTab,
    );
    _tabIndex = widget.indexSelectedTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainDecorationContainerWeb(
          content: Container(
            width: getSizeFromPlatformType(
              platformType: widget.platformType,
              webValue: 600,
              tabletValue: 475,
              mobileValue: 300,
            ).w,
            height: getSizeFromPlatformType(
              platformType: widget.platformType,
              webValue: 500,
              tabletValue: 380,
              mobileValue: 320,
            ).h,
            padding: EdgeInsets.only(
              top: getSizeFromPlatformType(
                platformType: widget.platformType,
                webValue: 50,
                tabletValue: 25,
                mobileValue: 15,
              ).h,
            ),
            child: DefaultTabController(
              length: 3,
              initialIndex: _tabIndex,
              child: SizedBox(
                height: getSizeFromPlatformType(
                  platformType: widget.platformType,
                  webValue: 60,
                  tabletValue: 47,
                  mobileValue: 35,
                ).h,
                child: Column(
                  children: <Widget>[
                    TabBar(
                      labelPadding: EdgeInsets.symmetric(
                        horizontal: getSizeFromPlatformType(
                          platformType: widget.platformType,
                          webValue: 12,
                          tabletValue: 9,
                          mobileValue: 4,
                        ).w,
                      ),
                      controller: _tabController,
                      splashBorderRadius: BorderRadius.circular(
                        getSizeFromPlatformType(
                          platformType: widget.platformType,
                          webValue: 10,
                          tabletValue: 10,
                          mobileValue: 5,
                        ).r,
                      ),
                      indicatorColor: Colors.transparent,
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      onTap: (index) {
                        setState(
                          () {
                            _tabIndex = index;
                          },
                        );
                      },
                      tabs: <Widget>[
                        AppBarItem(
                          platformType: widget.platformType,
                          tabIndex: _tabIndex,
                          title: tr('profile.settings'),
                          selectTabIndex: 0,
                        ),
                        AppBarItem(
                          platformType: widget.platformType,
                          tabIndex: _tabIndex,
                          title: tr('profile.details'),
                          selectTabIndex: 1,
                        ),
                        AppBarItem(
                          platformType: widget.platformType,
                          tabIndex: _tabIndex,
                          selectTabIndex: 2,
                          title: tr('profile.verification'),
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: getSizeFromPlatformType(
                            platformType: widget.platformType,
                            webValue: 25,
                            tabletValue: 25,
                            mobileValue: 15,
                          ).w,
                          right: getSizeFromPlatformType(
                            platformType: widget.platformType,
                            webValue: 25,
                            tabletValue: 25,
                            mobileValue: 15,
                          ).w,
                          top: getSizeFromPlatformType(
                            platformType: widget.platformType,
                            webValue: 30,
                            tabletValue: 30,
                            mobileValue: 15,
                          ).h,
                        ),
                        child: TabBarView(
                          controller: _tabController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            Settings(
                              platformType: widget.platformType,
                            ),
                            Details(
                              platformType: widget.platformType,
                            ),
                            KYCTab(
                              platformType: widget.platformType,
                              email: widget.email,
                              user: widget.user,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        widget.platformType == PlatformTypeState.mobile
            ? Padding(
                padding: EdgeInsets.only(
                  top: 30.h,
                ),
                child: const AboutSystemContainerMobile(),
              )
            : const SizedBox()
      ],
    );
  }
}

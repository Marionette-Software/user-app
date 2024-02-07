import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({
    super.key,
    required this.email,
    required this.name,
    required this.platformType,
  });

  final String email;
  final String name;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return MainDecorationContainerWeb(
      content: SizedBox(
        width: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 600,
          tabletValue: 475,
          mobileValue: 300,
        ).w,
        height: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 137,
          tabletValue: 97,
          mobileValue: 60,
        ).h,
        child: Padding(
          padding: EdgeInsets.only(
            left: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 25,
              tabletValue: 15,
              mobileValue: 15,
            ).w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 500.w,
                child: Tooltip(
                  message: name.length > 50 ? name : '',
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: platformType == PlatformTypeState.mobile
                        ? Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: getSizeFromPlatformType(
                                platformType: platformType,
                                webValue: 30,
                                tabletValue: 20,
                                mobileValue: 15,
                              ),
                            )
                        : Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontSize: getSizeFromPlatformType(
                                platformType: platformType,
                                webValue: 30,
                                tabletValue: 20,
                                mobileValue: 15,
                              ).sp,
                            ),
                  ),
                ),
              ),
              SizedBox(
                height: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 19,
                  tabletValue: 5,
                  mobileValue: 2,
                ).h,
              ),
              Text(
                email,
                style: platformType == PlatformTypeState.mobile
                    ? Theme.of(context).textTheme.labelSmall!.copyWith(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 20,
                            tabletValue: 15,
                            mobileValue: 10,
                          ).sp,
                        )
                    : Theme.of(context).textTheme.labelLarge!.copyWith(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 20,
                            tabletValue: 15,
                            mobileValue: 10,
                          ).sp,
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

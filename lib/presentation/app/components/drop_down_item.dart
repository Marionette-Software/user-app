import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class DropdownItem extends HookConsumerWidget {
  const DropdownItem({
    Key? key,
    required this.iconUrl,
    required this.id,
    this.platformType = PlatformTypeState.web,
    this.name = '',
    this.nameEnabled = true,
    this.alignment = MainAxisAlignment.start,
  }) : super(key: key);

  final String iconUrl;
  final String id;
  final String name;
  final bool nameEnabled;
  final MainAxisAlignment alignment;

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        UserAppImage(
          clipBehavior: Clip.hardEdge,
          
          path: iconUrl,
          width: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 50.w,
            tabletValue: 40.w,
            mobileValue: 25.w,
          ),
          height: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 50.h,
            tabletValue: 40.h,
            mobileValue: 25.h,
          ),
          isNetwork: true,
        ),
        SizedBox(width: 15.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(id,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 20,
                        tabletValue: 20,
                        mobileValue: 13,
                      ).sp,
                      letterSpacing: -1.sp,
                    )),
            if (nameEnabled)
              Text(
                name.split(' ').length >= 3
                    ? '${name.split(' ').getRange(0, 2).join(' ')}\n${name.split(' ').getRange(2, name.split(' ').length).join(' ')}'
                    : name,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 16,
                    tabletValue: 14,
                    mobileValue: 12,
                  ).sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

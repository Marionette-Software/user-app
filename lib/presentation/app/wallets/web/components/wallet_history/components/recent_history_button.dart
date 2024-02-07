import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/history/expanded_state_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class RecentHistoryButton extends HookConsumerWidget {
  const RecentHistoryButton({
    super.key,
    required this.platformType,
  });

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expandedController = ref.watch(historyExpandedProvider);
    final expandedState = ref.read(historyExpandedProvider.notifier);

    return InkWell(
      borderRadius: expandedController
          ? BorderRadius.only(
              topLeft: Radius.circular(
                getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 10,
                  tabletValue: 10,
                  mobileValue: 5,
                ),
              ).r,
              topRight: Radius.circular(
                getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 10,
                  tabletValue: 10,
                  mobileValue: 5,
                ).r,
              ),
            )
          : BorderRadius.circular(
              getSizeFromPlatformType(
                platformType: platformType,
                webValue: 10,
                tabletValue: 10,
                mobileValue: 5,
              ).r,
            ),
      child: SizedBox(
        height: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 50,
          tabletValue: 35,
          mobileValue: 35,
        ).h,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 17,
              tabletValue: 15,
              mobileValue: 10,
            ).w,
          ),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                !expandedController
                    ? Icon(
                        Icons.keyboard_arrow_down,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                      )
                    : Icon(
                        Icons.keyboard_arrow_up,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                      ),
                Text(
                  tr('wallet.recent_history'),
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: getSizeFromPlatformType(
                          platformType: platformType,
                          webValue: 24,
                          tabletValue: 15,
                          mobileValue: 13,
                        ).sp,
                      ),
                ),
                !expandedController
                    ? Icon(
                        Icons.keyboard_arrow_down,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                      )
                    : Icon(
                        Icons.keyboard_arrow_up,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                      ),
              ],
            ),
          ),
        ),
      ),
      onTap: () => {
        expandedController
            ? expandedState.state = false
            : expandedState.state = true
      },
    );
  }
}

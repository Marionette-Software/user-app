import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class VersionNumberRowMobile extends HookConsumerWidget {
  const VersionNumberRowMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = useState(
      PackageInfo(
        appName: '',
        packageName: '',
        version: '',
        buildNumber: '',
      ),
    );

    context.afterBuild(() async {
      packageInfo.value = await PackageInfo.fromPlatform();
    });

    return Text(
      packageInfo.value.buildNumber.isNotEmpty
          ? 'version ${packageInfo.value.version}+${packageInfo.value.buildNumber}'
          : 'version ${packageInfo.value.version}',
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.75,
            color: isLightTheme(context)
                ? AppColors.aboutHeaderLight
                : AppColors.whiteColor.withOpacity(0.5),
          ),
    );
  }
}

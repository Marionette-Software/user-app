import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_notifier.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_provider.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_progress_state.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class ExchangeFailedWeb extends HookConsumerWidget {
  const ExchangeFailedWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressRead = ref.read(nonCustodialStateProvider.notifier);
    final progress = ref.read(nonCustodialProgressStateProvider.notifier);

    return Container(
      width: 600.w,
      height: 310.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            isLightTheme(context)
                ? AppColors.whiteColor
                : AppColors.whiteColor.withOpacity(0.1),
            isLightTheme(context)
                ? AppColors.whiteColor
                : AppColors.whiteColor.withOpacity(0.05),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 43.h,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 36.h,
              width: 600.w,
              child: AutoSizeText(
                tr('non_custodial_exchange.exchange_failed'),
                minFontSize: 3,
                maxFontSize: 30,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 30,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 37.h,
            ),
            SvgPicture.asset(
              errorLogoPath,
              width: 50.w,
              height: 50.h,
            ),
            SizedBox(height: 32.h),
            SizedBox(
              height: 60.h,
              child: MainButton(
                onTap: () {
                  progressRead.state = NonCustodialState.walletConnected;
                  progress.state--;
                },
                text: tr('non_custodial_exchange.try_again'),
                height: 60.h,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

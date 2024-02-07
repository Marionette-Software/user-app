import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/referral_user/referrals_by_level_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ListReferralsLevelWeb extends StatelessWidget {
  const ListReferralsLevelWeb({
    required this.referralsByLevel,
    super.key,
  });

  final List<ReferralByLevelState> referralsByLevel;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          top: 30.h,
          bottom: 30.h,
        ),
        child: Divider(
          height: 1.h,
          color: isLightTheme(context)
              ? AppColors.mainBackgroundLightColor
              : AppColors.whiteColor.withOpacity(0.25),
        ),
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: referralsByLevel.length,
      itemBuilder: (context, i) {
        var item = referralsByLevel[i];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Tooltip(
              message: i == 0
                  ? 'Number of users invited by your referral link'
                  : 'Number of users invited by your level ${item.level - 1} referrals',
              child: Text(
                'Level ${item.level}',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      letterSpacing: -1.sp,
                    ),
              ),
            ),
            Text(
              '${item.count}',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 30.sp,
                    letterSpacing: -1.5.sp,
                  ),
            ),
          ],
        );
      },
    );
  }
}

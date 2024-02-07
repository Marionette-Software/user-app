import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/referral_user/referrals_by_level_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ListReferralsLevelMobile extends StatelessWidget {
  const ListReferralsLevelMobile({
    required this.referralsByLevel,
    super.key,
  });

  final List<ReferralByLevelState> referralsByLevel;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          top: 14..h,
          bottom: 14..h,
        ),
        child: Divider(
          height: 2..h,
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
        return Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Level ${item.level}',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      letterSpacing: -0.75.sp,
                    ),
              ),
              Text(
                '${item.count}',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      letterSpacing: -1.sp,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}

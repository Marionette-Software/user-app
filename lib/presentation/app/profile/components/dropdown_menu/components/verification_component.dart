import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/user_get_request.data.gql.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/button_status/not_verify_label.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/button_status/pending_label.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/button_status/verified_label.dart';
import 'package:user_app/presentation/app/profile/profile.dart';

class VerificationItemWeb extends StatelessWidget {
  const VerificationItemWeb({
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Theme.of(context).primaryColor.withOpacity(0.25),
          height: 1.h,
        ),
        SizedBox(
          height: 29.h,
        ),
        InkWell(
          onTap: () async {
            context.go(Profile.routeName, extra: 2);
          },
          child: Row(
            children: [
              Text(
                tr('profile.verification'),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1.sp,
                    ),
              ),
              const Spacer(),
              SizedBox(
                height: 24.h,
                child: emailVerified == true &&
                        phoneVerified == true &&
                        haveDocuments == true &&
                        profileVerified == true
                    ? const VerifiedLabel(
                        platformType: PlatformTypeState.web,
                      )
                    : emailVerified == true &&
                            phoneVerified == true &&
                            haveDocuments == true &&
                            profileVerified == false &&
                            (user.labels!.isNotEmpty &&
                                user.labels!
                                    .where((p0) => p0!.value == 'rejected')
                                    .isEmpty)
                        ? const PendingLabel(
                            platformType: PlatformTypeState.web,
                          )
                        : const NotVerifyLabel(
                            platformType: PlatformTypeState.web,
                          ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 29.h,
        ),
      ],
    );
  }
}

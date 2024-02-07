import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/application/global_data/actions/global_actions.dart';
import 'package:user_app/presentation/auth/components/contact_form/components/calendar_form.dart';
import 'package:user_app/presentation/auth/components/contact_form/components/send_form.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ContactFormWeb extends StatelessWidget {
  const ContactFormWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: isLightTheme(context)
              ? const AssetImage(sendFormBackgroundWhite)
              : const AssetImage(sendFormBackgroundBlack),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 50.h,
        ),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 590.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tr('marionette_form.how_will_you'),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1.5.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  Text(
                    tr('marionette_form.marionette'),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1.5.sp,
                          color: Theme.of(context).primaryColorLight,
                        ),
                  ),
                  Text(
                    '?',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1.5.sp,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CalendarFormWeb(),
                  SizedBox(
                    width: 50.w,
                  ),
                  const SendForm(showBookCall: false),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tr('Visit our website '),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -1.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  InkWell(
                    onTap: () async {
                      GlobalActionsGeneral globalActionsGeneral =
                          GlobalActionsGeneral();
                      globalActionsGeneral.openLink(
                          url: 'https://marionette.dev/');
                    },
                    child: Text(
                      tr('Marionette.dev'),
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1.sp,
                                color: Theme.of(context).primaryColorLight,
                              ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

bool isClicked = false;

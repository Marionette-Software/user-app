import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/app/profile/mobile/components/footer_pop_up.dart';
import 'package:user_app/presentation/components/main_show_modal_bottom_sheet.dart';

class AboutSystemContainerMobile extends StatelessWidget {
  const AboutSystemContainerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        mainShowModalBottomSheet(
          context: context,
          longShowModalBottom: true,
          content: Container(
            height: 410.0.h,
            color: Colors.transparent,
            child: const FooterPopUpMobile(),
          ),
        );
      },
      child: Text(
        tr('profile.about_system'),
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 13.sp,
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              decoration: TextDecoration.underline,
            ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/helpers/sizes.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.title,
    this.trailingOnTap,
    this.leading,
    this.trailing,
  }) : super(key: key);

  final String title;
  final Widget? leading;
  final Widget? trailing;
  final Function()? trailingOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
      ),
      child: InkWell(
        onTap: trailingOnTap,
        child: SizedBox(
          height: 52..h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: leading != null,
                child: SizedBox(
                  height: 22.h,
                  width: 22.w,
                  child: leading ?? const SizedBox(),
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      letterSpacing: -0.75.sp,
                    ),
              ),
              const Spacer(),
              trailing == null
                  ? Icon(
                      Icons.arrow_forward_ios,
                      size: 13.w,
                      color: Theme.of(context).primaryColor.withOpacity(0.25),
                    )
                  : Row(
                      children: [
                        trailing!,
                        gapW4,
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 13.w,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.25),
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}

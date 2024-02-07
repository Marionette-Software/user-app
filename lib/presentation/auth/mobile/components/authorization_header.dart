import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/presentation/constants/assets_path.dart';

class AuthorizationHeader extends StatelessWidget {
  const AuthorizationHeader({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 5.h,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 65.w,
          height: 65.h,
          child: IconButton(
            onPressed: onTap,
            icon: SvgPicture.asset(
              burgerIcon,
            ),
          ),
        ),
      ),
    );
  }
}

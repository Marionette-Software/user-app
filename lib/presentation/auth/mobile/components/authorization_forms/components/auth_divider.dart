import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class AuthDividerMobile extends StatelessWidget {
  const AuthDividerMobile({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
            width: 129.w,
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 10.sp,
                    color: isLightTheme(context)
                        ? Theme.of(context).primaryColor.withOpacity(0.5)
                        : Theme.of(context).primaryColor,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}

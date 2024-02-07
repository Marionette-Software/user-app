import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class AuthFormHeader extends StatelessWidget {
  const AuthFormHeader({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.subtitleAction,
    required this.subtitleQuestion,
  }) : super(key: key);

  final String title;
  final String subtitleQuestion;
  final String subtitle;
  final Function() subtitleAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 10.w,
          ),
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        const Spacer(),
        Column(
          children: [
            Text(
              subtitleQuestion,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: isLightTheme(context)
                    ? Theme.of(context).primaryColorDark
                    : Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 2.w,
        ),
        InkWell(
          onTap: subtitleAction,
          child: Text(
            subtitle,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).primaryColorLight,
                ),
          ),
        ),
        SizedBox(
          width: 10.w,
        )
      ],
    );
  }
}

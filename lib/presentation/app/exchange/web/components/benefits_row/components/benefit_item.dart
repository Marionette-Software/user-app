import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BenefitItem extends StatelessWidget {
  const BenefitItem({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 218.w,
      height: 164.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60.h,
            child: AutoSizeText(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 40,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
          SizedBox(
            height: 25.h,
            child: AutoSizeText(
              subTitle,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

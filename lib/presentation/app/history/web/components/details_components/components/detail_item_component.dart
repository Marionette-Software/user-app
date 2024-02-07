import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailItemComponent extends StatelessWidget {
  const DetailItemComponent({
    super.key,
    required this.name,
    required this.value,
    required this.isBorder,
    required this.valueColor,
    this.alt = '',
  });

  final String name;
  final String value;
  final bool isBorder;
  final String alt;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isBorder
                ? Theme.of(context).primaryColor.withOpacity(0.25)
                : Colors.transparent,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 20.sp,
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                ),
          ),
          const Spacer(),
          alt == ''
              ? Text(
                  value,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 20.sp,
                        color: valueColor,
                      ),
                )
              : Tooltip(
                  message: alt,
                  child: Text(
                    value,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 20.sp,
                          color: valueColor,
                        ),
                  ),
                ),
        ],
      ),
    );
  }
}

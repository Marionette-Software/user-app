import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DropdownItemMobile extends HookConsumerWidget {
  const DropdownItemMobile({
    Key? key,
    required this.iconUrl,
    required this.id,
    this.name = '',
    this.nameEnabled = true,
    this.alignment = MainAxisAlignment.start,
  }) : super(key: key);

  final String iconUrl;
  final String id;
  final String name;
  final bool nameEnabled;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Theme.of(context).inputDecorationTheme.fillColor,
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          // ignore: unnecessary_null_comparison
          iconUrl != null
              ? (iconUrl.endsWith('svg')
                  ? SvgPicture.network(
                      iconUrl,
                      width: 25.w,
                      height: 25.h,
                    )
                  : Image.network(
                      iconUrl,
                      width: 25.w,
                      height: 25.h,
                      errorBuilder:
                          (BuildContext context, Object exception, _) {
                        return SizedBox(
                          width: 25.w,
                          height: 25.h,
                          child: Icon(
                            Icons.circle,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        );
                      },
                    ))
              : Icon(
                  Icons.circle,
                  color: Theme.of(context).primaryColorLight,
                  size: 25.h,
                ),
          SizedBox(width: 7.w),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 17.h,
                  child: AutoSizeText(
                    id,
                    minFontSize: 4,
                    maxFontSize: 14,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                SizedBox(width: 7.w),
                if (nameEnabled)
                  SizedBox(
                    child: AutoSizeText(
                      name,
                      minFontSize: 8,
                      maxFontSize: 10,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 10,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                          ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

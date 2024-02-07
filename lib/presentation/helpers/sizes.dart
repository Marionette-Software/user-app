import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sizes {
  static const p4 = 4.0;
  static const p8 = 8.0;
  static const p12 = 12.0;
  static const p16 = 16.0;
  static const p20 = 20.0;
  static const p24 = 24.0;
  static const p32 = 32.0;
  static const p48 = 48.0;
  static const p64 = 64.0;
  static const p96 = 96.0;
  static const p128 = 128.0;
  static const p256 = 256.0;
  static const p192 = 192.0;
  static const p512 = 512.0;
}

/// Constant gap widths
SizedBox gapW4 = SizedBox(width: Sizes.p4.w);
SizedBox gapW8 = SizedBox(width: Sizes.p8.w);
SizedBox gapW12 = SizedBox(width: Sizes.p12.w);
SizedBox gapW16 = SizedBox(width: Sizes.p16.w);
SizedBox gapW20 = SizedBox(width: Sizes.p20.w);
SizedBox gapW24 = SizedBox(width: Sizes.p24.w);
SizedBox gapW32 = SizedBox(width: Sizes.p32.w);
SizedBox gapW48 = SizedBox(width: Sizes.p48.w);
SizedBox gapW64 = SizedBox(width: Sizes.p64.w);
SizedBox gapW96 = SizedBox(width: Sizes.p96.w);
SizedBox gapW128 = SizedBox(width: Sizes.p128.w);

/// Constant gap heights
SizedBox gapH4 = SizedBox(height: Sizes.p4.h);
SizedBox gapH8 = SizedBox(height: Sizes.p8.h);
SizedBox gapH12 = SizedBox(height: Sizes.p12.h);
SizedBox gapH16 = SizedBox(height: Sizes.p16.h);
SizedBox gapH20 = SizedBox(height: Sizes.p20.h);
SizedBox gapH24 = SizedBox(height: Sizes.p24.h);
SizedBox gapH32 = SizedBox(height: Sizes.p32.h);
SizedBox gapH48 = SizedBox(height: Sizes.p48.h);
SizedBox gapH64 = SizedBox(height: Sizes.p64.h);
SizedBox gapH96 = SizedBox(height: Sizes.p96.h);
SizedBox gapH128 = SizedBox(height: Sizes.p128.h);
SizedBox gapH192 = SizedBox(height: Sizes.p192.h);
SizedBox gapH256 = SizedBox(height: Sizes.p256.h);

gapSizeH(double height) => SizedBox(height: height.h);
gapSizeW(double width) => SizedBox(width: width.w);

/// Variable gap widths and heights
gap({int? height, int? width}) {
  if (height == null && width == null) return const SizedBox.shrink();
  if (height == null) return SizedBox(width: width!.toDouble());
  if (width == null)  return SizedBox(height: height.toDouble());
}

extension CustomSizedBox on double {
  Widget get value => SizedBox(height: this);
}
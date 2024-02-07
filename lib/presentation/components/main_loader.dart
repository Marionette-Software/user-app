import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:user_app/presentation/constants/colors.dart';

class MainLoader extends StatelessWidget {
  const MainLoader({this.loaderSize = 80, super.key});

  final double? loaderSize;

  @override
  Widget build(BuildContext context) {
    return SpinKitSpinningLines(
      color: MainColorsApp.accentColor,
      itemCount: 6,
      lineWidth: 3.w,
      size: loaderSize!.w,
    );
  }
}

class MainLoaderMobile extends StatelessWidget {
  const MainLoaderMobile({this.loaderSize = 300, super.key});

  final double? loaderSize;

  @override
  Widget build(BuildContext context) {
    return SpinKitSpinningLines(
      color: MainColorsApp.accentColor,
      itemCount: 6,
      lineWidth: 3.w,
      size: loaderSize!.w,
    );
  }
}

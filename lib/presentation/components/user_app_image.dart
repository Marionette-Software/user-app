import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserAppImage extends StatelessWidget {
  const UserAppImage({
    Key? key,
    this.width,
    this.height,
    required this.path,
    this.isNetwork = false,
    this.iconSize = 40,
    this.clipBehavior = Clip.none,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? path;
  final bool isNetwork;
  final double iconSize;
  final Clip? clipBehavior;

  @override
  Widget build(BuildContext context) {
    if (path != null) {
      if (isNetwork) {
        return Container(
          width: width,
          height: height,
          clipBehavior: clipBehavior!,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: path!.endsWith('svg')
              ? SvgPicture.network(
                  path!,
                  allowDrawingOutsideViewBox: false,
                )
              : Image.network(
                  path!,
                ),
        );
      } else {
        return path!.endsWith('svg')
            ? Container(
                width: width,
                height: height,
                clipBehavior: clipBehavior!,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: SvgPicture.asset(
                  path!,
                  allowDrawingOutsideViewBox: true,
                ),
              )
            : Image.asset(
                path!,
              );
      }
    } else {
      return Icon(
        Icons.circle,
        size: iconSize,
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:user_app/presentation/constants/colors.dart';

List<Color> getWalletColorsList(String? color1, String? color2, bool isLight) {
  Color default1 =
      isLight ? MainColorsApp.accentColor : MainColorsApp.accentColor;
  Color default2 =
      isLight ? MainColorsApp.accentColor : MainColorsApp.accentColor;
  List<Color> result = [];
  if (color1 == null || color1 == '') {
    result.add(default1);
  } else {
    result.add(HexColor(color1));
  }
  if (color2 == null || color2 == '') {
    result.add(default2);
  } else {
    result.add(HexColor(color2));
  }

  return result;
}

Color getWalletColor(
  String? lightColor,
  String? darkColor,
  bool isLight,
) {
  Color defaultColor =
      isLight ? MainColorsApp.accentColor : MainColorsApp.accentColor;

  if (isLight) {
    if ((lightColor != null) && (lightColor != '')) {
      return HexColor(lightColor);
    } else {
      return defaultColor;
    }
  } else {
    if ((darkColor != null) && (darkColor != '')) {
      return HexColor(darkColor);
    } else {
      return defaultColor;
    }
  }
}

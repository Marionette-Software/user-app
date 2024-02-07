import 'package:flutter/cupertino.dart';

String capitalize(String str) {
  return str[0].toUpperCase() + str.substring(1);
}

const List<Locale> supportedLocales = [
  Locale('en', 'US'),
];

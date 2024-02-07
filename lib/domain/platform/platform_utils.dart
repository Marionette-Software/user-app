

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';


class PlatformUtils {

  static void openLink(String? s) async {
    var succ = false;
    if (s != null) {
      try {
        succ = await launchUrl(Uri.parse(s), mode: LaunchMode.externalNonBrowserApplication);
      } catch (e) {
        debugPrint(e.toString());
      }
      if (!succ) {
        try {
          succ = await launchUrl(Uri.parse(s), mode: LaunchMode.externalApplication);
        } catch (e) {
          debugPrint(e.toString());
        }
      }
      if (!succ) {
        try {
          await launchUrl(Uri.parse(s), mode: LaunchMode.platformDefault);
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    }
  }

  static String convertDateTime(String? d) {
    String nullDate = "1970-00-01 00:00:01";
    if(d == null) return DateTime.parse(nullDate).toString();
    DateTime dt = DateTime.now();
    int offset = dt.timeZoneOffset.inHours;
    var date = DateTime.parse(d);
    var newDate = DateTime(date.year, date.month, date.day,
        date.hour + offset, date.minute, date.second);
    var format = DateFormat.yMMMMd().add_jm();
    return format.format(newDate);
  }
}
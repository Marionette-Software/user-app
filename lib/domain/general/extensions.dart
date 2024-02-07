import 'package:flutter/widgets.dart';

extension BuildContextUtils on BuildContext {
  void afterBuild(VoidCallback callback) {
    Future.delayed(Duration.zero, callback);
  }
}

//HELPER FOR LOCALIZATION
extension StringHardcoded on String {
  String get hardcoded => this;
}
extension LinkHardcoded on String {
  String get linkHardcoded => this;
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
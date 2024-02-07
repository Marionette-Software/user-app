import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getDesignSizeProvider = StateProvider.family<Size, double>(
  (ref, width) {
    if (width > 1240) {
      return const Size(1920, 1080);
    } else if (width < 1240 && width > 600) {
      return const Size(1920, 1400);
    } else {
      return const Size(390, 690);
    }
  },
);

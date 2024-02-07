import 'package:easy_localization/easy_localization.dart';

NumberFormat numberFormatWithPrecision(int precision) {
  String precisionForFormatter = '';

  if (precision == 0) {
    var formatterWithPrecision = NumberFormat('#,###,##0');
    return formatterWithPrecision;
  } else {
    for (int i = 0; i < precision; i++) {
      precisionForFormatter = '${precisionForFormatter}0';
    }

    var formatterWithPrecision =
        NumberFormat('#,###,##0.${precisionForFormatter.toString()}');

    return formatterWithPrecision;
  }
}

String abbreviateNumber({
  required double number,
  required int precision,
}) {
  if (number >= 1000000000) {
    return '${(number / 1000000000).toStringAsFixed(2)}B';
  } else if (number >= 1000000) {
    return '${(number / 1000000).toStringAsFixed(2)}M';
  } else if (number >= 10000) {
    return '${(number / 1000).toStringAsFixed(2)}K';
  } else {
    return numberFormatWithPrecision(precision).format(number);
  }
}

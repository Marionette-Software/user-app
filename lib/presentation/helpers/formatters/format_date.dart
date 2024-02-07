import 'package:easy_localization/easy_localization.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/date_symbol_data_local.dart';

formatDate(time) {
  initializeDateFormatting();

  var newStr = time.substring(0, 10) + ' ' + time.substring(11, 23);

  var dateTime = DateTime.now();
  var offset = dateTime.timeZoneOffset;

  if (!offset.isNegative) {
    return DateFormat("EEE, d MMM yyyy HH:mm:ss").format(
      DateTime.parse(newStr).add(
        Duration(
          minutes: offset.inMinutes,
        ),
      ),
    );
  } else {
    return DateFormat("EEE, d MMM yyyy HH:mm:ss").format(
      DateTime.parse(newStr).subtract(
        Duration(
          minutes: offset.inMinutes,
        ),
      ),
    );
  }
}

formatShortDate(time) {
  initializeDateFormatting();

  var newStr = time.substring(0, 10) + ' ' + time.substring(11, 23);

  var dateTime = DateTime.now();
  var offset = dateTime.timeZoneOffset;

  if (!offset.isNegative) {
    return DateFormat("d MMM yyyy HH:mm:ss").format(
      DateTime.parse(newStr).add(
        Duration(
          minutes: offset.inMinutes,
        ),
      ),
    );
  } else {
    return DateFormat("d MMM yyyy HH:mm:ss").format(
      DateTime.parse(newStr).subtract(
        Duration(
          minutes: offset.inMinutes,
        ),
      ),
    );
  }
}

formatShortTwoRowsDate(time) {
  initializeDateFormatting();

  var newStr = time.substring(0, 10) + ' ' + time.substring(11, 23);

  var dateTime = DateTime.now();
  var offset = dateTime.timeZoneOffset;

  if (!offset.isNegative) {
    return '${DateFormat("d MMM yyyy").format(
      DateTime.parse(newStr).add(
        Duration(
          minutes: offset.inMinutes,
        ),
      ),
    )}\n${DateFormat("HH:mm:ss").format(
      DateTime.parse(newStr).add(
        Duration(
          minutes: offset.inMinutes,
        ),
      ),
    )}';
  } else {
    return '${DateFormat("d MMM yyyy HH:mm:ss").format(
      DateTime.parse(newStr).subtract(
        Duration(
          minutes: offset.inMinutes,
        ),
      ),
    )}\n${DateFormat("d MMM yyyy HH:mm:ss").format(
      DateTime.parse(newStr).subtract(
        Duration(
          minutes: offset.inMinutes,
        ),
      ),
    )}';
  }
}

formatShortDateOnly(time) {
  DateTime dt = DateTime.parse(time);
  return DateFormat("d MMM yyyy").format(dt);
}

formatDateOnlyDate(time) {
  initializeDateFormatting();

  var newStr = time.substring(0, 10) + ' ' + time.substring(11, 23);

  DateTime dt = DateTime.parse(newStr);
  return DateFormat("EEE, d MMM yyyy").format(dt);
}

formatDateOnlyTime(time) {
  initializeDateFormatting();

  var newStr = time.substring(0, 10) + ' ' + time.substring(11, 23);

  var dateTime = DateTime.now();
  var offset = dateTime.timeZoneOffset;

  if (!offset.isNegative) {
    return DateFormat("HH:mm:ss").format(
      DateTime.parse(newStr).add(
        Duration(
          minutes: offset.inMinutes,
        ),
      ),
    );
  } else {
    return DateFormat("HH:mm:ss").format(
      DateTime.parse(newStr).subtract(
        Duration(
          minutes: offset.inMinutes,
        ),
      ),
    );
  }
}

String formatTimestamp(int timestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

  String formattedDate =
      DateFormat('EEE, d MMM yyyy HH:mm:ss').format(dateTime);

  return formattedDate;
}

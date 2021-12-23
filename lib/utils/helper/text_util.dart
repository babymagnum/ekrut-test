import 'package:intl/intl.dart';

class TextUtil {
  static int stringDateToMillis(String dateString, {String pattern = "yyyy-MM-dd'T'HH:mm:ssZ"}) {
    DateFormat originFormat = DateFormat(pattern);
    return originFormat.parse(dateString).millisecondsSinceEpoch;
  }

  static DateTime convertStringToDateTime(String date, String pattern) {
    DateFormat dateFormat = DateFormat(pattern);
    return dateFormat.parse(date);
  }

  static DateTime convertToAnotherDateTime(DateTime date, String pattern) {
    final stringDate = dateTimeToString(date, pattern);
    return convertStringToDateTime(stringDate, pattern);
  }

  static String convertDateStringToAnotherFormat(String dateString, String pattern, String originPattern) {
    DateFormat originFormat = DateFormat(originPattern);
    DateFormat finalFormat = DateFormat(pattern);
    DateTime dateTime = originFormat.parse(dateString);
    return finalFormat.format(dateTime);
  }

  static String getCurrentDate(String pattern) {
    return DateFormat(pattern).format(DateTime.now());
  }

  static String millisToStringDate(int millis, String pattern) {
    var date = DateTime.fromMillisecondsSinceEpoch(millis);
    return DateFormat(pattern).format(date);
  }

  static String dateTimeToString(DateTime dateTime, String pattern) {
    final DateFormat formatter = DateFormat(pattern);
    return formatter.format(dateTime);
  }
}

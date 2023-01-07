import 'package:intl/intl.dart';

class Formatter {
  static String dateTime(DateTime date) {
    return DateFormat("dd/MM/yyyy - kk:mm").format(date);
  }

  static String dateTimeShort(DateTime date) {
    return DateFormat("dd/MM, kk:mm").format(date);
  }
}

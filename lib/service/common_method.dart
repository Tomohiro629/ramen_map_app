import 'package:intl/intl.dart';

String getDateString(DateTime date) {
  return DateFormat("yyyy年M月d日").format(date);
}

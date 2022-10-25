import 'package:intl/intl.dart';

String formatDate(int? date) {
  if (date == null) return '';
  return DateFormat('d MMMM y', 'ru').format(
    DateTime.fromMillisecondsSinceEpoch(date),
  );
}

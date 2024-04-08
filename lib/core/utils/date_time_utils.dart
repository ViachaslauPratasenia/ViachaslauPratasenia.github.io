import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateTime dateTimeFromTimestamp(Timestamp? timestamp) {
    return timestamp?.toDate() ?? DateTime.now();
  }

  static DateTime? dateTimeFromTimestampNullable(Timestamp? timestamp) {
    return timestamp?.toDate();
  }

  static String makeWorkPeriod({required DateTime start, DateTime? end}) {
    String formattedDate = DateFormat('MMMM yyyy').format(start);
    final formattedEnd = end != null ? DateFormat('MMMM yyyy').format(end) : 'Present';

    return '$formattedDate - $formattedEnd';
  }
}

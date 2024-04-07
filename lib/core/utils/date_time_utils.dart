import 'package:cloud_firestore/cloud_firestore.dart';

class DateTimeUtils {
  static DateTime dateTimeFromTimestamp(Timestamp? timestamp) {
    return timestamp?.toDate() ?? DateTime.now();
  }
}
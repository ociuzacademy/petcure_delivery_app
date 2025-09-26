import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppHelpers {
  // New function to format booking dates using intl package
  static String formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  static String formatTimeOfDayTo12Hour(TimeOfDay time) {
    // Convert hour to 12-hour format
    int hour = time.hour % 12;
    if (hour == 0) hour = 12; // Handle 0 (midnight) as 12

    // Format minute with leading zero if needed
    String minute = time.minute.toString().padLeft(2, '0');

    // Determine AM/PM
    String period = time.hour < 12 ? 'AM' : 'PM';

    return '$hour:$minute $period';
  }

  // Additional helper function to format date with time
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy - hh:mm a').format(dateTime);
  }

  // Helper function to format just the time from DateTime
  static String formatTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }
}

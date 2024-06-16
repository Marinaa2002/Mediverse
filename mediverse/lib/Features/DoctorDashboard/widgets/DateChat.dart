import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/models/MessageModel.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatCoumn.dart';

class DateOfChat extends StatelessWidget {
  const DateOfChat({
    super.key,
    required this.firstMsgSent,
  });
  final Message firstMsgSent;
  String formatDate(String timestampString) {
    // Extract seconds and nanoseconds from the string
    int seconds = int.parse(timestampString.split(',')[0].split('=')[1]);
    int nanoseconds = int.parse(
        timestampString.split(',')[1].split('=')[1].replaceAll(')', ''));

    // Create a DateTime object from seconds and nanoseconds
    DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(
        seconds * 1000000 + nanoseconds ~/ 1000);

    // Get current date and compare
    DateTime now = DateTime.now();
    DateTime date = dateTime.toLocal();

    // Check if it's today
    if (now.year == date.year &&
        now.month == date.month &&
        now.day == date.day) {
      return 'Today';
    }

    // Check if it's yesterday
    DateTime yesterday = now.subtract(Duration(days: 1));
    if (yesterday.year == date.year &&
        yesterday.month == date.month &&
        yesterday.day == date.day) {
      return 'Yesterday';
    }
    counterOfDateOfMessage++;
    // Otherwise, return the formatted date
    return DateFormat('dd MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    // String dateOfChat
    return Center(child: Text('12/5/2022', style: Themes.DateText));
  }
}

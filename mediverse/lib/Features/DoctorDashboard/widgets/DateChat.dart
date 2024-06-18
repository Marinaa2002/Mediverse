import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/models/MessageModel.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatCoumn.dart';

String lastMsgDate = '';

class DateOfChat extends StatelessWidget {
  DateOfChat({
    super.key,
    required this.currentDate,
    required this.chatesSize,
    required this.currentIndex,
  });
  final int chatesSize;
  final int currentIndex;

  final String currentDate;
  int counterOfDateOfMessage = 0;
  // Function to parse and format the timestamp
  String formatToDate(String timestamp) {
    int seconds = int.parse(timestamp.split(',')[0].split('=')[1]);
    int nanoseconds =
        int.parse(timestamp.split(',')[1].split('=')[1].replaceAll(')', ''));

    DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(
        seconds * 1000000 + nanoseconds ~/ 1000);

    // Format the DateTime to 'dd/MM/yyyy'
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    // if (currentIndex == chatesSize) {
    //   return SizedBox(
    //     height: 50,
    //     width: MediaQuery.of(context).size.width,
    //     child: Center(
    //       child: Text(currentDate, style: Themes.DateText),
    //     ),
    //   );
    // }
    if (lastMsgDate != currentDate) {
      counterOfDateOfMessage++;
      lastMsgDate = currentDate;
      return SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(currentDate, style: Themes.DateText),
        ),
      );
    }
    lastMsgDate = currentDate;
    // counterOfDateOfMessage = 0;
    return SizedBox
        .shrink(); // Return an empty widget if date has already been displayed
  }
}

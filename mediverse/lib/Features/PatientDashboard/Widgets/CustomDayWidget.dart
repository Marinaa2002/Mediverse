import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

class CustomDayWidget extends StatelessWidget {
  CustomDayWidget({
    super.key,
    required this.day,
    required this.date,
    this.isChosen = false,
    // required this.colorBox,
    // required this.colorText,
  });
  String day;
  String date;

  bool isChosen;
  // Color colorBox;
  // Color colorText;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Material(
        color: Colors.transparent,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: 120,
          height: 80,
          decoration: BoxDecoration(
            color: (isChosen) ? Colors.indigo : kSecondryBackgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Text(
                    day,
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: (isChosen) ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: (isChosen) ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

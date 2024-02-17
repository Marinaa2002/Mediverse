import 'package:flutter/material.dart';

class CustomDayWidget extends StatelessWidget {
  CustomDayWidget({super.key, required this.day, required this.date, required this.colorBox, required this.colorText});
  String day;
  String date;
  Color colorBox;
  Color colorText;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Material(
        color: Colors.transparent,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: 100,
          height: 70,
          decoration: BoxDecoration(
            color: colorBox,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    '$day',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: colorText,
                    ),
                  ),
                ),
                Text(
                  '$date',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: colorText,
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
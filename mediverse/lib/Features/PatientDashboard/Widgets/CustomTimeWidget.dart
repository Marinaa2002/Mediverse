import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

class CustomTimeWidget extends StatelessWidget {
  CustomTimeWidget({
    super.key,
    required this.time,
    required this.isChosen,
    required this.isBooked,
    // required this.colorBox,
    // required this.colorText,
  });
  String time;
  bool isChosen;
  bool isBooked;
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
          height: 50,
          decoration: BoxDecoration(
            color: (isBooked)
                ? grey
                : (isChosen)
                    ? Colors.indigo
                    : kSecondryBackgroundColor,
            borderRadius: BorderRadius.circular(16),
            shape: BoxShape.rectangle,
          ),
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Text(
              (isBooked) ? '$time BOOKED' : time,
              style: TextStyle(
                fontFamily: 'Readex Pro',
                color: (isBooked)
                    ? Colors.black
                    : (isChosen)
                        ? Colors.white
                        : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

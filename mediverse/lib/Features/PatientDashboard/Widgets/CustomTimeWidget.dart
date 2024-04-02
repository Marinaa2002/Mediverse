import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

class CustomTimeWidget extends StatelessWidget {
  CustomTimeWidget({
    super.key,
    required this.time,
    required this.isChosen,
    // required this.colorBox,
    // required this.colorText,
  });
  String time;
  bool isChosen;
  // Color colorBox;
  // Color colorText;

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
          width: 120,
          height: 50,
          decoration: BoxDecoration(
            color: (isChosen) ? Colors.indigo : kSecondryBackgroundColor,
            borderRadius: BorderRadius.circular(16),
            shape: BoxShape.rectangle,
          ),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              '$time',
              style: TextStyle(
                fontFamily: 'Readex Pro',
                color: (isChosen) ? Colors.white : Colors.black,
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

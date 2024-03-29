import 'package:flutter/material.dart';

class CustomTimeWidget extends StatelessWidget {
  CustomTimeWidget(
      {super.key,
      required this.time,
      required this.colorBox,
      required this.colorText});
  String time;
  Color colorBox;
  Color colorText;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width*0.028),
      child: Material(
        color: Colors.transparent,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: size.width*0.28,
          height: 50,
          decoration: BoxDecoration(
            color: colorBox,
            borderRadius: BorderRadius.circular(16),
            shape: BoxShape.rectangle,
          ),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              '$time',
              style: TextStyle(
                fontFamily: 'Readex Pro',
                color: colorText,
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

import 'package:flutter/material.dart';


class CustomDateWidget extends StatelessWidget {
  CustomDateWidget({super.key,required this.date});
  String date;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
        EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
        child: Text(
          '$date',
          style: TextStyle(
            fontFamily: 'Readex Pro',
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
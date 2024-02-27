import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';

class CustomDateWidget extends StatelessWidget {
  CustomDateWidget({super.key, required this.date});
  String date;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
        child: Text('$date', style: Themes.DateText),
      ),
    );
  }
}
